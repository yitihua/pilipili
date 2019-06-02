var newsvm = new Vue({
    el:"#news-list",
    data:{
        
    },
    methods:{
        gotoNews:function(newsid){
             window.location.href=`${ctx}/article/view`
        }
    }
})