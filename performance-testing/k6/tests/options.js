export const options = {
    stages: [
        // { duration: '5m', target: 11},
        // { duration: '25m', target: 11},
        // { duration: '5m', target: 0 },
        { duration: '5s', target: 2},
        { duration: '50s', target: 2},
        { duration: '5s', target: 0 },

    ],
    thresholds: {
        'http_req_duration{group:loginAPI}': ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        'http_reqs{group:loginAPI}': ['rate>100'],           // Request rate should be > 100 requests per sec
        'http_req_failed{group:loginAPI}': ['rate<0.01'],    // Failure rate should be < 1%

        'http_req_duration{group:pnlAPI}': ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        'http_reqs{group:pnlAPI}': ['rate>100'],           // Request rate should be > 100 requests per sec
        'http_req_failed{group:pnlAPI}': ['rate<0.01'],    // Failure rate should be < 1%

        'http_req_duration{group:balancesAPI}': ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        'http_reqs{group:balancesAPI}': ['rate>100'],           // Request rate should be > 100 requests per sec
        'http_req_failed{group:balancesAPI}': ['rate<0.01'],    // Failure rate should be < 1%


        'http_req_duration{group:settingsAPI}': ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        'http_reqs{group:settingsAPI}': ['rate>100'],           // Request rate should be > 100 requests per sec
        'http_req_failed{group:settingsAPI}': ['rate<0.01'],    // Failure rate should be < 1%
    }
}