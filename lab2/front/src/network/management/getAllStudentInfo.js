import { request } from "../request";

export function getAllStudentInfo(){
    return request({
        method: 'get',
        headers: {},
        url: '/api/v1/super-user/info/student/all'
    })
}