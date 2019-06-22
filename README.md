# pilipili
![logo](/src/main/webapp/static/img/pilipili.png)

## 小组成员：

<table>
    <tr>
        <td>姓名</td>
        <td>学号</td>
        <td>gitID</td>
    </tr>
    <tr>
         <td>顾思宇</td>
         <td>2016011993</td>
         <td>dandelionClaw</td>
    </tr>
    <tr>
         <td>张慧</td>
         <td>2016012019</td>
        <td>BUZA2018</td>
    </tr>
    <tr>
         <td>程羚</td>
         <td>2016012050</td>
         <td>chengling2016012050</td>
    </tr>
</table>

## 小组分工：

![](/src/main/webapp/static/img/ourteam.jpg)

## 项目介绍

pilipili资讯网集合了最新最热门的电视剧、电影、番剧及游戏资讯。管理员上传新闻，游客进行预览，注册后可进入个人界面和进行评论

## 功能模块

### 1.前台页面实现（负责人：张慧）

#### 1.1游客界面

#### 1.1.1网站默认页面

![](/src/main/webapp/static/img/img-README/buza/index.png)

#### 1.1.2文章预览页面

![](/src/main/webapp/static/img/img-README/buza/articleUn.png)

>评论区

![](/src/main/webapp/static/img/img-README/buza/commentArea.png)
>点击“回复”按钮展开二级评论框

![](/src/main/webapp/static/img/img-README/buza/reply1.png)
>回复框获得焦点展开，当其他一级评论的“回复”按钮被点击时，将收回

![](/src/main/webapp/static/img/img-README/buza/commentArea.png)

>点击回复和登录按钮弹出登录/注册框

![](/src/main/webapp/static/img/img-README/buza/btns.png)

![](/src/main/webapp/static/img/img-README/buza/loginbox.png)

![](/src/main/webapp/static/img/img-README/buza/registerbox.png)

>由用户名密码不合规范导致的注册失败

![](/src/main/webapp/static/img/img-README/buza/registFalse00.png)
![](/src/main/webapp/static/img/img-README/buza/registFalse01.png)

>信息合规范时提示通过

![](/src/main/webapp/static/img/img-README/buza/registRight.png)

#### 1.2普通用户界面

#### 1.2.1头导航栏中，登录按钮变为用户头像

>新用户头像为默认头像

![](/src/main/webapp/static/img/img-README/buza/newUser.png)
>普通用户的下拉框样式

![](/src/main/webapp/static/img/img-README/buza/userDropdown.png)

#### 1.2.2用户个人信息界面

>>用户可进行头像等个人信息的更改
>>点击修改按钮可展开和收起修改面板，完成对信息的修改

![](/src/main/webapp/static/img/img-README/buza/userInf.png)

头像的修改有两种方式：
* 可点击加号链入本地图片
* 直接将图片拖入提交框内

随后提交框对提交的图片进行预览

![](/src/main/webapp/static/img/img-README/buza/upA.png)
![](/src/main/webapp/static/img/img-README/buza/upO.png)

>以下是修改后的个人界面

![](/src/main/webapp/static/img/img-README/buza/upOver.png)

#### 1.2.3用户个人评论管理界面

>评论为一级评论时，显示评论的文章名
>评论为二级评论时，显示评论的评论作者

![](/src/main/webapp/static/img/img-README/buza/myComment.png)

#### 1.3管理员界面

#### 1.3.1管理员登录后，默认页面显示后台管理入口

![](/src/main/webapp/static/img/img-README/buza/admin.png)

####1.3.2管理员的头像下拉框多出“写文章”的入口

![](/src/main/webapp/static/img/img-README/buza/adminDropdown.png)

####1.3.3管理员个人界面多出“文章管理选项”

![](/src/main/webapp/static/img/img-README/buza/adminSideMenu.png)

####1.3.4文章管理页面

![](/src/main/webapp/static/img/img-README/buza/myArticle.png)

####1.3.5写文章

点击页面中的“新增”键或头像下拉框中的“写文章”均可跳转至文章增加页面

![](/src/main/webapp/static/img/img-README/buza/add1.png)
![](/src/main/webapp/static/img/img-README/buza/add.png)
>文章头图的上传与头像上传相同，可拖入也可从目录选择
>文章可以没有头图
>添加的头图宽高比最好接近1.68:1
添加好的带头图的文章效果如下

![](/src/main/webapp/static/img/img-README/buza/headimg.png)

####1.3.6文章编辑

![](/src/main/webapp/static/img/img-README/buza/edit.png)




