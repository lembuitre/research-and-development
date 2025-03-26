import http from 'k6/http';
import { check } from 'k6';

const url = 'https://accounts.api.sandbox.pdax.ph/accounts/register';

const payload = JSON.stringify({
    first_name: 'hynie1',
    last_name: 'perftest01',
    birthday: '2000-01-01',
    email: 'perf.test@pdax.ph',
});

const header = {
    'Content-Type': 'application/json',
}

export default function ()  {

    let response = http.post(url, payload, { header });

    check(response, {
        'status is 200': (r) => r.status === 200,
    });

    console.log('Response:' + response.body);


}