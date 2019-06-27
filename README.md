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

>需要注意的是：为了代码编写方便，部分js文件中封装了JQuery中的$方法
>前台页面中对代码直接的操作与维护最好不要链入JQuery文件,以免冲突报错

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

####1.1.3搜索功能

>搜索成功与失败时的新闻列表

![](/src/main/webapp/static/img/img-README/buza/search.png)

![](/src/main/webapp/static/img/img-README/buza/search-none.png)


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

#### 1.3.2管理员的头像下拉框多出“写文章”的入口

![](/src/main/webapp/static/img/img-README/buza/adminDropdown.png)

#### 1.3.3管理员个人界面多出“文章管理选项”

![](/src/main/webapp/static/img/img-README/buza/adminSideMenu.png)

#### 1.3.4文章管理页面

![](/src/main/webapp/static/img/img-README/buza/myArticle.png)

#### 1.3.5写文章

点击页面中的“新增”键或头像下拉框中的“写文章”均可跳转至文章增加页面

![](/src/main/webapp/static/img/img-README/buza/add1.png)
![](/src/main/webapp/static/img/img-README/buza/add.png)
>文章头图的上传与头像上传相同，可拖入也可从目录选择
>文章可以没有头图
>添加的头图宽高比最好接近1.68:1
添加好的带头图的文章效果如下

![](/src/main/webapp/static/img/img-README/buza/headimg.png)

#### 1.3.6文章编辑

![](/src/main/webapp/static/img/img-README/buza/edit.png)


####1.4需要管理员手动维护的部分

####1.4.1轮播图

![](/src/main/webapp/static/img/img-README/buza/cjs2.png)

![](/src/main/webapp/static/img/img-README/buza/cjs.png)

在main/webapp/static/js文件夹下打开js文件carousel.js文件

![](/src/main/webapp/static/img/img-README/buza/cjs2.png)

>在photoes对象中，可以进行对轮播图的增删改查。
>photoes对象中，每个对象对应一张轮播图，对象中第一个键值对记录了轮播图的图片地址，第二个键值对记录了图片简介
>如新增轮播图，只需要在已有键值对后按序添加新键值对，便可新生成一个轮播图和其按钮

####1.4.2精选资讯

![](/src/main/webapp/static/img/img-README/buza/hot.png)

>在main/webapp/static/js文件夹下打开js文件hotnews.js文件

![](/src/main/webapp/static/img/img-README/buza/hjs.png)

>精选资讯栏提供了五条资讯展示空间,它们的内容由hotnews对象控制
>以hotnews中第一个键值对为例
>>0键：0键决定了是否为资讯标题前加一个小火苗，如有需要，只需将0键的值设为真
>>1键：1键是该条资讯的标题
>>2键：2键是该条资讯的链接
>如有需要，只需对相应键值对进行修改

![](/src/main/webapp/static/img/img-README/buza/hotnews.png)

### 2.后台管理页面（负责人：程羚）

#### 2.1 数据字典
![](/src/main/webapp/static/img/img-README/chenry/dict.jpg)

点击添加后会跳出相应弹框，效果图如下：

![](/src/main/webapp/static/img/img-README/chenry/dict_add1.jpg)
![](/src/main/webapp/static/img/img-README/chenry/dict_add2.jpg)

点击编辑
>弹框界面与添加相同，但会自动读取相应操作的数据字典类型

![](/src/main/webapp/static/img/img-README/chenry/dict_edit.jpg)

点击删除

![](/src/main/webapp/static/img/img-README/chenry/dict_delect.jpg)

#### 2.2 栏目管理

![](/src/main/webapp/static/img/img-README/chenry/catalog.jpg)
>栏目管理所实现功能与数据字典大致相同

#### 2.3 用户权限管理

![](/src/main/webapp/static/img/img-README/chenry/access.jpg)
>在后台的用户权限管理，我们去除了新增权限和权限删除的功能

![](/src/main/webapp/static/img/img-README/chenry/access1.jpg)
![](/src/main/webapp/static/img/img-README/chenry/access2.jpg)

#### 2.3 新闻管理
![](/src/main/webapp/static/img/img-README/chenry/index.jpg)

>在新闻管理时，点击编辑、删除将跳转至新的页面

![](/src/main/webapp/static/img/img-README/chenry/index1.jpg)

#####2.3.1 文章添加

![](/src/main/webapp/static/img/img-README/chenry/news1.jpg)

#####2.3.2 文章编辑

![](/src/main/webapp/static/img/img-README/chenry/news2.jpg)

#### 2.4 返回前台
点击“返回主页”和“logout”均可返回前台界面，logout将直接登录

![](/src/main/webapp/static/img/img-README/chenry/logout.jpg)





