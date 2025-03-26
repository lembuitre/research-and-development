import http from 'k6/http'
import {sleep} from 'k6'
import {check} from 'k6'
import { SharedArray } from 'k6/data';


const users = new SharedArray('creds', function () {
    return JSON.parse(open('../data/usertest.json'));
});


const login_url = 'https://api.sandbox.pdax.ph/auth/login'

const login_headers = {
    'Content-Type': 'application/json'
}

function getCookieValue(cookies, key) {
    const regex = new RegExp(`${key}=([^;]+)`);
    
    const match = cookies.match(regex);

    return match ? match[1] : null;
}


export default function login() {

    const userIndex = (__VU - 1) % users.length
    const user = users[userIndex]
    
    const login_payload = JSON.stringify({
        username: user.username,
        password: user.password
    })
    let res = http.post(login_url, login_payload, login_headers,);

    const cookies = res.headers['Set-Cookie']
    const id_token = getCookieValue(cookies, 'id_token')
    const access_token = getCookieValue(cookies, 'access_token')
    const parsedBody = JSON.parse(res.body)
    const uuid = parsedBody.username ? parsedBody.username : null;

    check(res, { 'Login is 200': (r) => r.status == 200 });
    sleep(1)
    return {id_token, access_token, uuid}

}