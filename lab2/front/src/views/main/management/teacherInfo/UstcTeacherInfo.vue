<template>
  <el-container v-if="isShow">
    <Ustc-header />
    <el-container>
      <Ustc-aside />
      <el-main>
        <el-page-header @back="goBack" content="详情页面" class="page-header"></el-page-header>
        <h4>教师信息</h4>
        <el-divider></el-divider>
        <el-table :data="listData" border style="width: 100%">
          <el-table-column
            fixed
            prop="tno"
            label="工号"
            width="150">
          </el-table-column>
          <el-table-column
            prop="name"
            label="姓名"
            width="100">
          </el-table-column>
          <el-table-column
            prop="sex"
            label="性别"
            width="80">
          </el-table-column>
          <el-table-column
            prop="age"
            label="年龄"
            width="80">
          </el-table-column>
          <el-table-column
            prop="school"
            label="学院"
            width="150">
          </el-table-column>
          <el-table-column
            prop="email"
            label="邮箱"
            width="150">
          </el-table-column>
          <el-table-column
            prop="tel"
            label="电话"
            width="150">
          </el-table-column>
          <el-table-column
            fixed="right"
            label="操作"
            width="210">
            <template slot-scope="scope">
              <el-button @click="lookClick(scope.$index)" size="mini">查看</el-button>
              <el-button @click="editClick(scope.$index)" size="mini">编辑</el-button>
              <el-button @click="deleteClick(scope.$index)" size="mini" type="danger">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-dialog title="教师信息" :visible.sync="dialogVisible" width="30%">
          <el-card class="box-card">
            <div>
              <p class="normal">工号：{{ form.tno }}</p>
              <p class="normal">姓名：{{ form.name }}</p>
              <p class="normal">性别：{{ form.sex }}</p>
              <p class="normal">年龄：{{ form.age }}</p>
              <p class="normal">学院：{{ form.school }}</p>
              <p class="normal">邮箱：{{ form.email }}</p>
              <p class="normal">电话：{{ form.tel }}</p>
              <p class="normal">简介：{{ form.intro }}</p>
            </div>
          </el-card>
          <span slot="footer" class="dialog-footer">
            <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
          </span>
        </el-dialog>
        <el-dialog title="教师信息" :visible.sync="dialogFormVisible" width="40%">
          <el-form :model="form" ref="form" :rules="rules">
            <el-form-item label="工号">
              <el-input v-model="form.tno" autocomplete="off" placeholder="请输入学号" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="姓名">
              <el-input v-model="form.name" autocomplete="off" placeholder="请输入姓名" clearable="clearable"></el-input>
            </el-form-item>
            <el-form-item label="性别">
              <el-radio v-model="form.sex" label="男">男性</el-radio>
              <el-radio v-model="form.sex" label="女">女性</el-radio>
              <el-radio v-model="form.sex" label="双">双性</el-radio>
            </el-form-item>
            <el-form-item label="年龄">
              <el-input-number v-model="form.age" autocomplete="off" controls-position="right" :min="1" :max="120"></el-input-number>
            </el-form-item>
            <el-form-item label="学院">
              <el-input v-model="form.school" autocomplete="off" placeholder="请输入学院" clearable="clearable"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
              <el-input type="email" v-model="form.email" autocomplete="off" placeholder="请输入邮箱" clearable="clearable"></el-input>
            </el-form-item>
            <el-form-item label="电话" prop="tel">
              <el-input type="tel" v-model="form.tel" autocomplete="off" placeholder="请输入电话" clearable="clearable"></el-input>
            </el-form-item>
            <el-form-item label="简介">
              <el-input type="textarea" v-model="form.intro" autocomplete="off" placeholder="请输入个人简介" maxlength="200" show-word-limit clearable="clearable"></el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="submitProfile(currentIndex)">确 定</el-button>
          </div>
        </el-dialog>
        <p class="add-more"><el-link type="primary" icon="el-icon-plus" @click="addMore">新增教师</el-link></p>
        <UstcDialogTeacher @dialogVisibleClick="dialogAddVisibleClick" @editDialog="addTeacher"  title="新增教师" :tnoVisible="false" :dialogFormVisible="dialogAddTeacherVisible" />
      </el-main>
    </el-container>
    <el-footer><Ustc-footer /></el-footer>
  </el-container>
</template>

<script>
import UstcHeader from 'components/content/header/UstcHeader'
import UstcAside from 'components/content/aside/UstcAside'
import UstcFooter from 'components/content/footer/UstcFooter'
import UstcDialogTeacher from 'components/common/UstcDialogTeacher'
import { getAllTeacherInfo } from 'network/management/getAllTeacherInfo'
import { getAllStudentInfo } from 'network/management/getAllTeacherInfo'
import { getTeacherInfo } from 'network/management/getTeacherInfo'
import { setTeacherProfile } from 'network/management/setTeacherProfile'
import { deleteTeacher } from 'network/management/deleteTeacher'
import { addTeacherInfo } from 'network/management/addTeacherInfo'

export default {
  name: 'UstcTeacherInfo',
  components: {
    UstcHeader,
    UstcAside,
    UstcFooter,
    UstcDialogTeacher
  },
  created() {
    // axios请求
    getAllTeacherInfo().then(res => {
      
      for(let i = 0; i < res.data.result.length; i++) {
        this.listData.push({
          tno: res.data.result[i].tno,
          name: res.data.result[i].name,
          sex: res.data.result[i].sex,
          age: res.data.result[i].age,
          school: res.data.result[i].school,
          email: res.data.result[i].email,
          tel: res.data.result[i].tel,
          intro: res.data.result[i].intro
        })
      }
      this.isShow = true
    }).catch(err => {})
  },
  data() {
    const validateEmail =  (rule, value, callback) => {
      const pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/
      if (this.form.email !== null && pattern.test(this.form.email) === false && this.form.email !== '') {
        callback(new Error('邮箱格式不规范'))
      } else {
        callback()
      }
    }
    const validateTel = (rule, value, callback) => {
      const pattern = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
      if (this.form.tel !== null && this.form.tel !== '' && pattern.test(this.form.tel) === false) {
        callback(new Error('电话格式不规范'))
      } else {
        callback()
      }
    }
    return {
      listData: [],
      isShow: false,
      dialogVisible: false,
      dialogFormVisible: false,
      currentIndex: 0,
      form: {},
      currentIndex: 0,
      dialogFormVisible: false,
      dialogAddTeacherVisible: false,
      rules: {
        email: [
          { validator: validateEmail, trigger: ['blur', 'change'] }
        ],
        tel: [
          { validator: validateTel, trigger: ['blur', 'change'] }
        ]
      }
    }
  },
  // computed: {
  //   loading() {
  //     return this.$store.state.loading
  //   }
  // },
  methods: {
    goBack() {
      this.$router.go(-1)
    },
    lookClick(index) {
      // js默认引用赋值
      this.form = Object.assign({}, this.listData[index])
      this.dialogVisible = true
    },
    editClick(index) {
      this.form = Object.assign({}, this.listData[index])
      this.currentIndex = index
      this.dialogFormVisible = true
    },
    deleteClick(index) {
      this.$confirm('此操作不可逆，将删除该教师的所有记录, 是否继续?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // axios请求删除该用户
          const tno = this.listData[index].tno
          deleteTeacher(tno).then(res => {
            this.listData.splice(index, 1)
          }).catch(err => {

          })
          this.$message({
            type: 'success',
            message: '删除成功!'
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
    },
    submitProfile(index) {
      const patternEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/
      const patternTel = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
      if ((this.form.email !== null && this.form.email !== '' && patternEmail.test(this.form.email) === false) || (this.form.tel !== null && this.form.tel !== '' && patternTel.test(this.form.tel) === false)) {
        return
      }
      this.$confirm('此操作将提交教师信息，是否继续','提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const name = this.form.name
        const sex = this.form.sex
        const age = this.form.age
        const school = this.form.school
        const email = this.form.email
        const tel = this.form.tel
        const intro = this.form.intro
        const tno = this.form.tno
        const data = JSON.stringify({name, sex, age,  school,  email, tel,  intro})
        // axios请求
        setTeacherProfile(tno, data).then(res => {
          // 替代listData[index]，不能用下标，vue不能实时渲染
          this.listData.splice(index, 1, this.form)
          this.dialogFormVisible = false
          this.$message({
            type: 'success',
            message: '教师信息修改成功!'
          })
        }).catch(err => {
          console.log(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消提交'
        })
      })
    },
    
    noeditDialog() {
      this.dialogFormVisible = false
    
    },
    dialogVisibleClick() {
      this.dialogFormVisible = false
    },
    dialogAddVisibleClick() {
      this.dialogAddTeacherVisible = false
    },
    addMore() {
      this.dialogAddTeacherVisible = true
    },
    addTeacher(form) {
      if(form.name === '' || form.tno === '' ) {
        return
      }
      this.$confirm('此操作将新增学生，是否继续','提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const data = JSON.stringify(form)
        // axios请求
        addTeacherInfo(data).then(res => {
          // this.dataList.splice(this.currentIndex, 1, form)
          
          if(res.data.status == 1100){
            this.dialogAddTeacherVisible = false
            this.$message({
            type: 'info',
            message: '插入错误'
          })
            return
          }
          
          this.dialogAddTeacherVisible = false
          this.$message({
            type: 'success',
            message: '添加成功'
          })
        }).catch(err => {
          console.log(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消提交'
        })
      })
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
  .normal {
    color: #555;
    line-height: 30px;
    text-align: left;
  }
  .add-more {
    text-align: right;
    margin-top: .5em;
  }
</style>
