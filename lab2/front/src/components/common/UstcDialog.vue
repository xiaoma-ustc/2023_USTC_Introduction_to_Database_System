<template>
    <el-dialog :title="title" :visible.sync="dialogFormVisible" :before-close="diaglogVisibleClick" width="40%">
        <el-form :model="form" ref="form">
            <el-form-item label="课程号" required>
                <el-input v-model="form.cno" autocomplete="off" :disabled="cnoVisible" placeholder="输入课程号"></el-input>
            </el-form-item>
            <el-form-item label="课程名" required>
                <el-input v-model="form.name" autocomplete="off" placeholder="请输入课程名" clearable="'clearable"></el-input>
            </el-form-item>
            <el-form-item label="学分" required>
                <el-input v-model="form.credit" autocomplete="off" controls-position="right" :min="1" :max="10"></el-input>
            </el-form-item>
            <el-form-item label="先修课课程号">
                <el-input palceholder="请输入先修课课程号" v-model="form.cpno" clearable="clearable" @change="$event => searchList(form.cpno)">
                    <el-button slot="'append" icon="el-icon-search" @click="$event => searchList(form.cpno)"></el-button>
                </el-input>
            </el-form-item>
            <el-form-item label="先修课">
                <el-input v-model="course" autocomplete="off" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item lable="教师工号" required>
                <el-input placeholder="请输入教师工号" v-model="form.tno" clearable="clearable" @change="$event => teacherSearch(form.tno)">
                    <el-button slot="append" icon="el-icon-search" @click="$event => teacherSearch(form.tno)"></el-button>
                </el-input>
            </el-form-item>
            <el-form-item label="教师" required>
                <el-input v-model="teacher" autocomplete="off" clearable="clearable" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="课堂容量" required>
                <el-input-number v-model="form.capacity" autocomplete="off" controls-positon="right" :min="1" :max="200"></el-input-number>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="diaglogVisibleClick">取消</el-button>
            <el-button type="primary" @click="submitProfile">确定</el-button>
        </div>
    </el-dialog>
</template>

<script>
/* 新增课程的表单 */
export default{
    name: 'USTCDialog',
    data(){
        return{}
    },
    computed:{},
    props:{
        cnoVisible:{
            type: Boolean,
            default:true
        },
        dialogFormVisible:{
            type: Boolean,
            default:true
        },
        title:{
            type: String,
            default:'信息'
        },
        form:{
            type:Object,
            default(){
                return{
                    credit:1,
                    capacity:10
                }
            }
        },
        course:{
            type: String,
            default:'无'
        },
        teacher:{
            type:String,
            default:'无'
        }
    },
    methods:{
        searchList(cpno){
            this.$emit('searchList', cpno)
        },
        teacherSearch(tno){
            this.$emit('teacherSearch', tno)
        },
        submitProfile(){
            if(this.form.name === '' || this.form.cno === '' || this.form.tno === '' || this.teacher === '无'){
                return
            }
            this.$emit('editDialog', this.form)
        },
        diaglogVisibleClick(){
            this.$emit('diaglogVisibleClick')
        }
    }
}
</script>