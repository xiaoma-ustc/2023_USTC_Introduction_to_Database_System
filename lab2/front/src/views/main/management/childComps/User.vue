

<template>
  <div class="bg">
    <h4>教师信息</h4>
    <el-divider></el-divider>
    <el-scrollbar style="height:300px">

    <el-table :data="dataList" :stripe="true" style="width: 100%">
      <el-table-column prop="tno" label="工号"></el-table-column>
      <el-table-column prop="name" label="姓名"></el-table-column>
      <el-table-column prop="school" label="学院"></el-table-column>
    </el-table>
    
    </el-scrollbar>
    <p class="see-more"><el-link type="primary" icon="el-icon-view" @click="seeMore">查看更多</el-link></p>
  </div>
</template>

<script>
import { getTeacherInfo } from 'network/management/getTeacherInfo'
import { getAllTeacherInfo } from 'network/management/getAllTeacherInfo'
/* import { getUserStudent } from 'network/management/getUserStudent'
import { getUserMana } from 'network/management/getUserMana'
import { getUserTech } from 'network/management/getUserTech' */
export default {
  name: 'User',
  data() {
    return {
      dataList: []
    }
  },
  created() {
    // axios请求
    getTeacherInfo().then(res => {
      for (let i = 0; i < res.data.result.length; i++) {
        this.dataList.push({
          tno: res.data.result[i].tno,
          name: res.data.result[i].name,
          school: res.data.result[i].school
        })
      }
    }).catch(err => {
      console.log(err)
    })
  },
  methods: {
    seeMore() {
      // 路由跳转
      this.$router.push('/super-user/index/info/teacher')
    }
  }
}
</script>

<style scoped>
  .see-more {
    margin: .5em;
    text-align: right;
  }
</style>
