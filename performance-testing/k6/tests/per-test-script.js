import http from 'k6/http'
import {sleep} from 'k6'
import {check} from 'k6'
import login from './login.js';

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

        'http_req_duration{group:digitalAssetsAPI}': ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        'http_reqs{group:digitalAssetsAPI}': ['rate>100'],           // Request rate should be > 100 requests per sec
        'http_req_failed{group:digitalAssetsAPI}': ['rate<0.01'],    // Failure rate should be < 1%

        'http_req_duration{group:kycAPI}': ['p(95)<1000'], // 95% of requests should be complete in < 1 second
        'http_reqs{group:kycAPI}': ['rate>100'],           // Request rate should be > 100 requests per sec
        'http_req_failed{group:kycAPI}': ['rate<0.01'],    // Failure rate should be < 1%
    }
}


export default function (){
    const id_token = login().id_token
    const access_token = login().access_token
    const uuid = login().uuid
    const pnlUrl = 'https://stage.services.sandbox.pdax.ph/api/pdax-api/retail/v1/assets/pnl'
    const balancesUrl = 'https://api-stage.sandbox.pdax.ph/pixo/v4/balances'
    const settingsUrl = `https://accounts.api.sandbox.pdax.ph/accounts/users/${uuid}/settings`
    const digitalAssetsUrl = 'https://api-stage.sandbox.pdax.ph/pixo/v4/digital-assets'
    const streamURL = 'https://stage.services.sandbox.pdax.ph/api/pdax-api/retail/v1/assets/stream'
    const userURL = `https://kyc.services.sandbox.pdax.ph/kyc-retail/users/${uuid}`

    const headers = {
        'Authorization' : `Bearer ${id_token}`
    }

    const res = http.get(pnlUrl, {headers, tags: { group: 'pnlAPI' }, })
    const parsedPnl = JSON.parse(res.body)
    check(res, {'PNL IS 200' : (r) => r.status == 200 || r.status == 400})
    console.log('PNL RES BODY', parsedPnl)
    sleep(1)

    // const streamRes = http.get(streamURL, {headers})
    // const parsedStream = JSON.parse(streamRes.body)
    // check(streamRes, {'STREAM IS 200' : (r) => r.status == 200 || r.status == 400})
    // console.log('STREAM RES BODY', parsedStream)


    const balanceHeaders = {
        'access_token' :`${access_token}`,
        'id_token': `${id_token}`
    }

    const balancesRes = http.get(balancesUrl, {headers : balanceHeaders, tags: { group : 'balancesAPI'}, })
    const parsedBalances = JSON.parse(balancesRes.body)
    check(balancesRes, {'BALANCES IS 200': (balancesRes)=> balancesRes.status == 200 })
    console.log('BALANCE RES BODY', parsedBalances)

    const settingsHeaders = {
        'Authorization': `Bearer ${id_token}`
    }
    const settingRes = http.get(settingsUrl, {headers : settingsHeaders,  tags: { group : 'settingsAPI'}, })
    const parsedSettings = JSON.parse(settingRes.body)
    check(settingRes, {'Settings is 200': (settingRes)=> settingRes.status == 200})
    console.log('Setting Res Body', parsedSettings)

    const digitalAssetHeaders = {
        'access_token' :`${access_token}`,
        'id_token': `${id_token}`
    }
    const digitalAssetRes = http.get(digitalAssetsUrl, {headers : digitalAssetHeaders, tags: { group : 'digitalAssetsAPI'},})
    const parsedAsset = JSON.parse(digitalAssetRes.body)
    check(digitalAssetRes, {'Digital Asset is 200': (digitalAssetRes)=> digitalAssetRes.status == 200})
    console.log('Digital Asset Res', parsedAsset)

    const kycHeaders = {
        'Authorization': `${id_token}`
    }

    const kycRes = http.get(userURL, {headers: kycHeaders, tags: { group : 'kycAPI'},})
    const parsedKYC = JSON.parse(kycRes.body)
    check(kycRes, {'KYC is 200': (kycRES)=> kycRES.status == 200})
    console.log('KYC Res', parsedKYC)


}