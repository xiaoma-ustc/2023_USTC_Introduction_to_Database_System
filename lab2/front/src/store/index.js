import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
    profileMsg: {},
    avatarUrl: '',
    loading: false,
    color: ''
}

const store = new Vuex.Store({
    state,
    getters:{

    },
    mutations:{
        profileMsg(state, payload){
            localStorage.setItem('ProfileMsg', JSON.stringify(payload))
            state.profileMsg = payload
        },
        getAvatarUrl(state, payload){
            localStorage.setItem('AvatarUrl', payload.url)
            state.avatarUrl = payload.url
        },
        setLoading(state, payload){
            state.loading = payload.loading
        },
        systemColorChange(state, payload){
            localStorage.setItem('SystemColor', payload.color)
            state.color = payload.color
        },
    },
    actions:{}
})

export default store