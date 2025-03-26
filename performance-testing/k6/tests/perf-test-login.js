import http from 'k6/http';
import { sleep, check } from 'k6';
import { SharedArray } from 'k6/data';
import { Rate } from 'k6/metrics';


export const errorRate = new Rate('errors');


const credentials = new SharedArray('credentials', function () {
    return JSON.parse(open('../data/users.json'));
});


export const options = {
    stages: [
        // { duration: '5m', target: 50 },   // Ramp up to 50 users over 5 minutes
        // { duration: '2m', target: 1000 },  // Spike to 1000 users in 2 minutes
        // { duration: '5m', target: 1000 },  // Maintain 1000 users for 5 minutes
        // { duration: '3m', target: 50 },   // Ramp down to 50 users over 3 minutes
        // { duration: '1m', target: 0 },    // Close the test with 0 users for 1 minute
        { duration: '30s', target: 6 },  // ramp up to 6 VUs over 30 seconds
        { duration: '30s', target: 6 },  // hold at 6 VUs for the next 30 seconds
    ],
    thresholds: {
        http_req_duration: ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        http_reqs: ['rate>100'],           // Request rate should be > 100 requests per sec
        http_req_failed: ['rate<0.01'],    // Failure rate should be < 1%
    }
};

// export const options = {
//     scenarios: {
//         ramping_test: {
//             executor: 'ramping-vus',
//             startVUs: 1,
//             stages: [
//                 { duration: '30s', target: 3},
//                 { duration: '1m', target: 3},
//                 { duration: '30s', target: 0 },
        
//             ],
//         },
//     },
// };


export default function ()  {
    
    let user = credentials[Math.floor(Math.random() * credentials.length)];

    const url = 'https://api.sandbox.pdax.ph/auth/login';

    const payload = JSON.stringify({
        username: user.username,
        password: user.password,
    });
    
    const header = {
        'Content-Type': 'application/json',
    };

    let response = http.post(url, payload, { header });

    check(response, {
        'status is 200': (r) => r.status === 200,
    });

    errorRate.add(!response);

    sleep(1)

}