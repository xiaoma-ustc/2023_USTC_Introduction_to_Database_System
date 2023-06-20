<template>
    <el-container v-loading="loading" element-loading-backgroud="rgb(255,255,255)" v-loading.lock="true">
        <UstcHeader/>
        <el-container>
            <UstcAside/>
            <UstcMain/>
            </el-container>
            <el-footer><UstcFooter /></el-footer>
    </el-container>
</template>

<script>
import UstcHeader from 'components/content/header/UstcHeader'
import UstcAside from 'components/content/aside/UstcAside'
import UstcMain from './student/UstcMain'
import UstcFooter from 'components/content/footer/UstcFooter'
export default {
name: 'Index',
data() {
    return {

    }
},
created() {
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

