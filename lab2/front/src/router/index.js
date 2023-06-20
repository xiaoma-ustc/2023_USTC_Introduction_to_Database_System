import Vue from 'vue'
import VueRouter from 'vue-router'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'

// 路由懒加载
const Login = () => import('views/login/Login')
const Index = () => import('views/main/Index')
const SuperIndex = () => import('views/main/SuperIndex')
const Reset = () => import('components/content/Reset')
const UstcProfile = () => import('views/main/student/profile/UstcProfile')
const ManaProfile = () => import('views/main/management/profile/UstcProfile')
const UstcGrade = () => import('views/main/student/grade/UstcGrade')
const UstcCourse = () => import('views/main/student/course/UstcCourse')
const UstcNotice = () => import('views/main/student/notice/UstcNotice')
const UstcSelectionCourse = () => import('views/main/student/selection/UstcSelectionCourse')
const UstcEvaluation = () => import('views/main/student/evaluation/UstcEvaluation')

const UserType = () => import('views/main/management/userType/UserType')
const UstcStudentInfo = () => import('views/main/management/studentInfo/UstcStudentInfo')
const UstcTeacherInfo = () => import('views/main/management/teacherInfo/UstcTeacherInfo')
const ManaCourse = () => import('views/main/management/course/UstcCourse')
const ManaGrade = () => import('views/main/management/grade/UstcGrade')

const TeachIndex = () => import('views/main/TeacherIndex')
const TeachProfile = () => import('views/main/teacher/profile/UstcProfile')
const TeachTasks = () => import('views/main/teacher/tasks/UstcTasks')
const TeachGrade = () => import('views/main/teacher/grade/UstcGrade')

// 安装插件
Vue.use(VueRouter)

const routes = [
  {
    path: '',
    redirect: '/login'
  },
  {
    path: '/login',
    meta: {
      title: '登录页面'
    },
    component: Login
  },
  {
    path: '/login/reset',
    meta: {
      title: '重置密码'
    },
    component: Reset
  },
  {
    path: '/index',
    meta: {
      title: '综合教务系统'
    },
    component: Index
  },
  {
    path: '/super-user/index',
    meta: {
      title: '管理员主页'
    },
    component: SuperIndex
  },
  {
    path: '/index/profile/:sno',
    meta: {
      title: '个人信息'
    },
    component: UstcProfile
  },
  {
    path: '/super-user/index/profile/:mno',
    meta: {
      title: '个人信息'
    },
    component: ManaProfile
  },
  {
    path: '/index/grade/:sno',
    meta: {
      title: '成绩'
    },
    component: UstcGrade
  },
  {
    path: '/index/course',
    meta: {
      title: '课程'
    },
    component: UstcCourse
  },
  {
    path: '/index/notice/:sno',
    meta: {
      title: '通知任务'
    },
    component: UstcNotice
  },
  {
    path: '/index/selection/course',
    meta: {
      title: '学生选课'
    },
    component: UstcSelectionCourse
  },
  {
    path: '/index/teaching/evaluation',
    meta: {
      title: '教学评价'
    },
    component: UstcEvaluation
  },

  // 管理员
  {
    path: '/super-user/index/user/:userType',
    meta: {
      title: '用户'
    },
    component: UserType
  },
  {
    path: '/super-user/index/info/student',
    meta: {
      title: '学生信息 '
    },
    component: UstcStudentInfo
  },
  {
    path: '/super-user/index/info/teacher',
    meta: {
      title: '教师信息 '
    },
    component: UstcTeacherInfo
  },
  {
    path: '/super-user/index/course',
    meta: {
      title: '课程'
    },
    component: ManaCourse
  },
  {
    path: '/super-user/index/grade',
    meta: {
      title: '学生成绩'
    },
    component: ManaGrade
  },

  // 教师
  {
    path: '/teacher/index',
    meta: {
      title: '主页'
    },
    component: TeachIndex
  },
  {
    path: '/teacher/index/profile/:tno',
    meta: {
      title: '个人信息'
    },
    component: TeachProfile
  },
  {
    path: '/teacher/index/tasks/:tno',
    meta: {
      title: '教学任务'
    },
    component: TeachTasks
  },
  {
    path: '/teacher/index/grade/:tno',
    meta: {
      title: '成绩打分'
    },
    component: TeachGrade
  }
]

// 创建对象
const router = new VueRouter({
  routes,
  mode: 'history'
})

// 简单配置

NProgress.inc(0.2)
NProgress.configure({ easing: 'cubic-bezier', speed: 500, showSpinner: false })

// 前置导航守卫
router.beforeEach((to, from, next) => {
  // 设置网站标题
  NProgress.start()
  if(to.meta.title) {
    document.title = to.meta.title
  }
  // TOKEN有效，直接进入主页
  if(to.path === '/login' && localStorage.getItem('Authorization')) {
    if(localStorage.getItem('UserType') === 'stu') {
      router.replace('/index')
    } else if(localStorage.getItem('UserType') === 'mana') {
      router.replace('/super-user/index')
    } else if(localStorage.getItem('UserType') === 'teach') {
      router.replace('/teacher/index')
    }
  }
  if(to.path !== '/login' && !localStorage.getItem('Authorization')) {
    router.replace('/login')
  }
  next()
})

router.afterEach(() => {
  NProgress.done()
})

const routerPush =VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(error=> error)
}

export default router
