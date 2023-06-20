import { request } from "../request";

export function setTeacherProfile(tno, data){
    return request({
        method: 'put',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        url: '/api/v1/super-user/info/teacher/' + tno,
        data: data
    })
}