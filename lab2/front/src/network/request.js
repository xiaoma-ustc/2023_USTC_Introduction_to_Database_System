import axios from 'axios'
import {Message} from 'element-ui'
import store from '../store'
import router from '../router'

//对axios进行二次封装
export function request(config){
    const instance = axios.create({
        baseURL: 'http://localhost:3000',
        timeout: 5000,
        headers: {}
    })
    //请求拦截器
    instance.interceptors.request.use(config => {
        store.commit('setLoading', {loading:true})
        if(localStorage.getItem('Authorization')){
            config.headers.Authorization = localStorage.getItem('Authorization')
        }
        return config
    },err => {console.log(err)})
    //响应拦截器
    instance.interceptors.response.use(res => {
        if(res.data.status === 10010 && localStorage.getItem('Authorization')){
            store.commit('systemColorChange', {color: '#B3cdae'})
            localStorage.clear()
            Message.error('账户过期，请重新登录！')
            router.replace({
                path: '/login'
            })
        }
        store.commit('setLoading', {loading:false})
        return res
    },err => {console.log(err)})
    return instance(config)
}

