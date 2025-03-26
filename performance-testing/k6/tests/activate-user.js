import http from 'k6/http';
import { check } from 'k6';

// export const options = {
//     vus: 5,
//     duration: '30s'

// };

const url = 'https://api.sandbox.pdax.ph/auth//ops/users/a735b963-86f6-4df0-b104-82a5caee8ec0/enable';

// const payload = JSON.stringify({
//     username: 'qa32.stage+hynie003@pdax.ph',
//     password: 'Pdax123!!!',

// });

const header = {
    'Content-Type': 'application/json',
};


export default function () {


    let response = http.post(url, { header});

    check(response, {
        'status is 200': (r) => r.status === 200,
    });

    console.log('Response: ' + response.body);
}