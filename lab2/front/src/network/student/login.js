import { request } from "../request";

export function toLogin(data){
    return request({
        method:'post',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        url: '/api/v1/login',
        data: data
    })
    
}