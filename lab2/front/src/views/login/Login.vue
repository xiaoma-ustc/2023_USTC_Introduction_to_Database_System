<template>
<div class="bg" v-loading="loading">
    <div class="ustc"></div>
    <div class="login">
        <div class="login-text">
            <h2 class="ustc-edu">统一身份认证登录</h2>
            <el-form :model="ruleForm" ref="ruleForm" :rules="rules" label-width="100px" class="demo-rulerForm">
                <el-form-item label="用户名" prop="username">
                    <el-input v-model="ruleForm.username" class="el-size" placeholder="请输入学工号" clearable autofocus="true" auto-complete="new-password"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="pass">
                    <el-input v-model="ruleForm.pass"  class="el-size" placeholder="请输入密码" show-password clearable auto-complete="new-password"></el-input>
                </el-form-item>
                <el-row>
                    <el-col :span="24" class="text-center user-select">
                        <el-radio-group v-model="radio">
                            <el-radio label="stu">学生</el-radio>
                            <el-radio label="teach">教师</el-radio>
                            <el-radio label="mana">管理员</el-radio>
                        </el-radio-group>
                    </el-col>
                </el-row>
                <el-form-item>
                    <el-button type="primary" :loading="isLoading" round class="el-size" @click="btnLogin">登录</el-button>
                </el-form-item>
            </el-form>
            <div class="login-msg">
                <span>学生默认密码为：123456，首次登录后需修改密码</span>
            </div>
            <div class="forget-pass">
                <span >忘记密码</span>
            </div>
        </div>
    </div>
</div>

</template>

<script>
//按需导入
import {toLogin} from 'network/student/login'
import {teacherLogin} from 'network/teacher/login'
import {superLogin} from 'network/management/login'

//默认导出
export default{
    name: 'Login',
    data(){
        const validateUsr = (rule, value, callback) =>{
            if(value == ''){
                callback(new Error('请输入学工号'))
            }
            else{
                callback()
            }
        }
        const validatePass = (rule, value, callback) => {
            if(value == ''){
                callback(new Error('请输入密码'))
            }
            else{
                callback()
            }
        }
        return{
            ruleForm:{
                username:'',
                pass:''
            },
            rules:{
                username:[
                    {validator: validateUsr, trigger: 'blur'}
                ],
                pass:[
                    {validator: validatePass, trigger: 'blur'}
                ]
            },
            isLoading:false,
            radio: 'stu'
        }
    },
    computed:{
        loading(){
            return this.$store.state.loading
        }
    },
    methods:{
        btnLogin(){
            if(this.ruleForm.username === '' || this.ruleForm.pass === ''){
                return
            }
            this.isLoading = true
            const username = this.ruleForm.username
            const password = this.ruleForm.pass
            const data = JSON.stringify({username, password})
            if(this.radio == 'stu'){
                this.userLogin(data)
            }
            else if(this.radio == 'mana'){
                this.superUserLogin(data)
            }
            else if(this.radio == 'teach'){
                this.teacherUserLogin(data)
            }
        },
        userLogin(data){
            //使用Promise的特性，使用.then()与.catch()
            toLogin(data).then(res =>{
                if(res.data.status === 1100){
                    this.$message.error('用户名或密码错误')
                    this.ruleForm.pass = ''
                    this.isLoading = false
                }
                else if(res.data.status == 1105){
                    if(this.ruleForm.pass == '123456'){
                        localStorage.setItem('UserType', this.radio)
                        localStorage.setItem('Username', this.ruleForm.username)
                        this.$router.replace('/login/reset')
                    }
                    else{
                        console.log(res.data)
                        localStorage.setItem('UserType', this.radio)
                        localStorage.setItem('Authorization', res.data.token)
                        localStorage.setItem('Username', this.ruleForm.username)
                        localStorage.setItem('Name', res.data.name)
                        localStorage.setItem('AvatarUrl', res.data.url)
                        this.$router.replace('/index')
                    }
                }
                this.loading = false
            }).catch(err => {})
        },
        teacherUserLogin(data){
            teacherLogin(data).then(res =>{
                if(res.data === 1100){
                    this.$message.err('用户名或密码错误')
                    this.ruleForm.pass = ''
                    this.isLoading = false
                }else if(res.data.status === 1105){
                    if(this.ruleForm.pass == '123456'){
                        localStorage.setItem('UserType', this.radio)
                        localStorage.setItem('Username', this.ruleForm.username)
                        this.$router.replace('/login/reset')
                    }
                    else{
                        localStorage.setItem('Authorization', res.data.token)
                        localStorage.setItem('UserType', this.radio)
                        localStorage.setItem('Username', this.ruleForm.username)
                        localStorage.setItem('Name', res.data.name)
                        localStorage.setItem('AvatarUrl', res.data.url)
                        this.$router.replace('/teacher/index')
                    }
                }
                this.isLoading = false
            }).catch(err => {})
        },
        superUserLogin(data){
            superLogin(data).then(res => {
                if(res.data.status === 1100){
                    this.$message.error('用户名或密码错误')
                    this.ruleForm.pass = ''
                    this.isLoading = false;
                }else if(res.data.status === 1105){
                    if(this.ruleForm.pass == '123456'){
                        localStorage.setItem('UserType', this.radio)
                        localStorage.setItem('Username', this.ruleForm.username)
                        this.$router.replace('/login/reset')
                    }
                    else{
                        localStorage.setItem('Authorization', res.data.token)
                        localStorage.setItem('UserType', this.radio)
                        localStorage.setItem('Username', this.ruleForm.username)
                        localStorage.setItem('Name', res.data.name)
                        localStorage.setItem('AvatarUrl', res.data.url)
                        this.$router.replace('/super-user/index')
                    }
                }
            }).catch(err => {})
        }
    }
}


</script>

<style scoped>
/* 修饰template中的元素 */
.bg {
    
    margin:center;
    height: 1000px;
    background-color: #DDD;
    
    background-image: url(~assets/img/login/system.png);
    background-size:100% 100%;
    background-attachment:fixed;
}
.bg .ustc{
    float: center;
    height: 200px;
    background-image: url(~assets/img/login/ustc.png);
    background-size:100px 100px;
    background-repeat: no-repeat;
    background-position: center 50px;
    opacity: 0.5;
}

.ustc-edu {
    margin-top: 1em;
    margin-left: 6em;
    margin-bottom: 2em;
}
.text-center {
    margin: center;
}
.login {
    position: relative;
    top: 10%;
    display: flex;
    display: -webkit-flex;
    justify-content: center;

}
.login-text {
    width: 500px;
    height: 430px;
    margin: 0 auto;
    background-color: #FFF;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
.login-img {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}
.user-select {
    margin-bottom: 1.4em;
}

.el-size {
    width: 300px;
}
.login-msg {
    margin-top: 4em;
    margin-left: 3em;
    font-size: 12px;
    color: #312599;
    display: flex;
    float: left;
}
.forget-pass {
    margin-top: 4em;
    margin-right: 3em;
    font-size: 12px;
    color: #312599;
    display: flex;
    float:right;
}
.login-msg:hover {

    color: #000000;

}
.forget-pass:hover {

color: #000000;

}
</style>
