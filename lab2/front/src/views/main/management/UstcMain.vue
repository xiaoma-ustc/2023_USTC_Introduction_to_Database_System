<template>
  <el-main>
    <el-row>
      <el-col :span="10">
        <profile />
      </el-col>
      <el-col :span="10" :offset="4" class="every-div">
        <User />
      </el-col>
      <el-col :span="10" :offset="0" class="every-div">
        <course />
        
      </el-col>
      <el-col :span="10" :offset="4" class="every-div">
        <student-info />
      </el-col>
    </el-row>
    <el-row>
      
    </el-row>
  </el-main>
</template>

<script>
import Profile from './childComps/Profile'
import User from './childComps/User'
import StudentInfo from './childComps/StudentInfo'
import Course from './childComps/Course'
export default {
  name: 'UstcMain',
  data() {
    return {

    }
  },
  components: {
    Profile,
    User,
    StudentInfo,
    Course
  },
  methods: {
    
  }
}
</script>

<style scoped>
  .el-main {
    background-color: #fff;
    color: #333;
  }
  .every-div {
    margin-top: 20px;
  }
</style>
