import { request } from "../request";

export function getAllTeacherInfo(){
    return request({
        method: 'get',
        headers: {},
        url: '/api/v1/super-user/info/teacher/all'
    })
}