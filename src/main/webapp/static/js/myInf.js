let myInfVM = new Vue({
    el:"#inf-body",
    data:{
        genderBox:true,
        educationBox:true,
        avatarBox:true,
        genderfix:"修改",
        educationfix:"修改",
        avatarfix:"更改头像"
    },
    methods:{
        turnGenderBox:function () {
            if(this.genderBox){
                this.genderBox=false
                this.genderfix="取消修改"
            }
            else {
                this.genderBox=true
                this.genderfix="修改"
            }
            console.log(this.genderBox)
        },
        turnEducationBox:function () {
            if(this.educationBox){
                this.educationBox=false
                this.educationfix="取消修改"
            }
            else {
                this.educationBox=true
                this.educationfix="修改"
            }
        },
        turnUploadBox:function () {
            if(this.avatarBox){
                this.avatarBox=false
                this.avatarfix="取消修改"
            }else {
                this.avatarBox=true
                this.avatarfix="更改头像"

            }
        }
    }
})