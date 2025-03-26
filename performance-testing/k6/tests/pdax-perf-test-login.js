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
                { duration: '5m', target: 11},
                { duration: '25m', target: 11},
                { duration: '5m', target: 0 },
        
            ],
            thresholds: {
                http_req_duration: ['p(95)<1000'], // 95% of requests should be complete in < 1 second
                http_reqs: ['rate>100'],           // Request rate should be > 100 requests per sec
                http_req_failed: ['rate<0.01'],    // Failure rate should be < 1%
            }
};


export default function ()  {
    
    let user = credentials[Math.floor(Math.random() * credentials.length)];
    const pixoBE = "https://api-dev.sandbox.pdax.ph/pixo";

    const urlLogin = pixoBE + '/v4/auth/login';

    const payloadLogin = JSON.stringify({
        username: user.username,
        password: user.password,
        is_backend: true
    });
    
    const header = {
        'Content-Type': 'application/json',
    };


    let LoginResponse = http.post(urlLogin, payloadLogin, { header });

    check(LoginResponse, {
        'status is 200': (r) => r.status === 200,
    });

    const body = LoginResponse.body;
    const userName = body.username;

    console.log(LoginResponse);

    errorRate.add(!LoginResponse);

    //Subsequent API

    sleep(1)

}