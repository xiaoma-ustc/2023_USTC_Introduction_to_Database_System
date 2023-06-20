<template>
    <div class="el-footer" :style="colorSelect">
    <p>
        版权所有 &copy; 2023 Xiaoma
    </p>
    </div>
</template>

<script>
/* 页脚 */
export default {
    name: 'UstcFooter',
    data() {
    return {
        
    }
    },
    computed: {
    colorSelect() {
        if(this.$store.state.color !== '' && this.$store.state.color !== null) {
        return {
            backgroundColor: this.$store.state.color
        }
        } else if (localStorage.getItem('SystemColor')) {
        return {
            backgroundColor: localStorage.getItem('SystemColor')
        }
        }
        return {
        backgroundColor: 'white'
        }
    }
    }
}
</script>

<style scpoed>

    .el-footer {
    color: #333;
    text-align: center;
    line-height: 60px;
    padding: 0;
    }
</style>