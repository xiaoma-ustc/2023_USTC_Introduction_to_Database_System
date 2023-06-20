<template>
  <el-container v-if="isShow">
    <Ustc-header />
    <el-container>
      <Ustc-aside />
      <el-main>
        <el-page-header @back="goBack" content="详情页面" class="page-header"></el-page-header>
        <h4>成绩</h4>
        <el-divider></el-divider>
        <el-table :data="dataList" :stripe="true" style="width: 100%">
          <el-table-column prop="cno" label="课程号"></el-table-column>
          <el-table-column prop="name" label="课程名"></el-table-column>
          <el-table-column prop="gradePo" label="绩点"></el-table-column>
          <el-table-column prop="grade" label="成绩"></el-table-column>
        </el-table>
      </el-main>
    </el-container>
    <el-footer><Ustc-footer /></el-footer>
  </el-container>
</template>

<script>
import UstcHeader from 'components/content/header/UstcHeader'
import UstcAside from 'components/content/aside/UstcAside'
import UstcFooter from 'components/content/footer/UstcFooter'
import { getAllGrade } from 'network/student/getAllGrade'
export default {
  name: 'UstcGrade',
  components: {
    UstcHeader,
    UstcAside,
    UstcFooter
  },
  data() {
    return {
      isShow: false,
      dataList: []
    }
  },
  computed: {

  },
  created() {
    // axios请求
    const sno = localStorage.getItem('Username')
    getAllGrade({sno}).then(res => {
      for (let i = 0; i < res.data.result.length; i++) {
        this.dataList.push({
          cno: res.data.result[i].cno,
          name: res.data.result[i].cname,
          gradePo: res.data.result[i].gradepo,
          grade: res.data.result[i].grade
        })
      }
      this.isShow = true
    }).catch(err => {
      console.log(err)
    })
  },
  methods: {
    goBack() {
      this.$router.go(-1)
    }
  }
}
</script>

<style scoped>
  .el-main {
    color: #333;
    text-align: center;
  }
  .page-header {
    margin-bottom: 1em;
  }
</style>
