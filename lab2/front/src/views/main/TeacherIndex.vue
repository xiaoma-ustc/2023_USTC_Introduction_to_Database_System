<template>
  <el-container v-loading="loading" element-loading-background="rgb(255, 255, 255)" v-loading.lock="true">
    <Ustc-header />
    <el-container>
      <Ustc-aside />
      <Ustc-main />
    </el-container>
    <el-footer><Ustc-footer /></el-footer>
  </el-container>
</template>

<script>
import UstcHeader from 'components/content/header/UstcHeader'
import UstcAside from 'components/content/aside/UstcAside'
import UstcMain from './teacher/UstcMain'
import UstcFooter from 'components/content/footer/UstcFooter'
export default {
  name: 'TeacherIndex',
  data() {
    return {
      
    }
  },
  computed: {
    loading() {
      return this.$store.state.loading
    }
  },
  components: {
    UstcHeader,
    UstcAside,
    UstcMain,
    UstcFooter
  },
  methods: {
    
  }
}
</script>

<style scoped>
  
</style>
