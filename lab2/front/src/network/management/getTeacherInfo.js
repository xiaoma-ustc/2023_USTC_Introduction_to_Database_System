import { request } from "../request";

export function getTeacherInfo(){
    return request({
        method: 'get',
        headers: {},
        url: '/api/v1/super-user/info/teacher?limit=8'
    })
    
}