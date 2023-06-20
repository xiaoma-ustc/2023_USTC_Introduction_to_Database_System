<template>
    <el-dialog :title="title" :visible.sync="dialogFormVisible" :before-close="diaglogVisibleClick" width="40%">
        <el-form :model="form" ref="form">
            <el-form-item label="工号" required>
                <el-input v-model="form.tno" autocomplete="off" :disabled="tnoVisible" placeholder="输入工号"></el-input>
            </el-form-item>
            <el-form-item label="姓名" required>
                <el-input v-model="form.name" autocomplete="off" placeholder="请输入姓名" ></el-input>
            </el-form-item>
            <el-form-item label="性别" required>
                <el-radio v-model="form.sex" label="男">男性</el-radio>
                <el-radio v-model="form.sex" label="女">女性</el-radio>
                <el-radio v-model="form.sex" label="双">双性</el-radio>
            </el-form-item>
            <el-form-item label="年龄" required>
                <el-input v-model="form.age" autocomplete="off" controls-position="right" :min="10" :max="100"></el-input>
            </el-form-item>
            <el-form-item label="学院" required>
                <el-input v-model="form.school" autocomplete="off" controls-position="right"></el-input>
            </el-form-item>
            
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="diaglogVisibleClick">取消</el-button>
            <el-button type="primary" @click="submitProfile">确定</el-button>
        </div>
    </el-dialog>
</template>

<script>
export default{
    /* 新增教师的表单 */
    name: 'USTCDialogTeacher',
    data(){
        return{}
    },
    computed:{},
    props:{
        tnoVisible:{
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

                }
            }
        }
    },
    methods:{
        submitProfile(){
            if(this.form.name === '' || this.form.tno === ''){
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