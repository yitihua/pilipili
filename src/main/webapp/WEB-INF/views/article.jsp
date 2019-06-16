<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/1
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>【pilipili】${news.title}</title>
    <script>var ctx ="${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/article.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/login.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>

</head>
<body>
<div class="contenter" id="contenter">
    <div class="news-topnav" id="topnav">
        <div class="widthfix">
            <span class="news-logo" onclick="javascript:window.location.href='${ctx}/index'"><img src="${ctx}/static/img/CN_bilibiliB.png"></span>
            <%--登录注册--%>
            <div class="userInf" id="unlog-userInf clearfix">
                <input type="button" value="登 录" class="btn-white" v-on:click="getH" id="loginbtn"
                       v-bind:class="{hide:registed}">
                <!-- login&&register -->
                <div class="login" id="login" v-bind:class="{seeme:seeme}">
                    <div class="login-bc" id="login-bc">
                        <div class="login-bar">
								<span v-on:click="gologin()"
                                      v-bind:class="{borderHighLight:actived,borderIndex:!actived}">
									登录
								</span>
                            <span v-on:click="goregister()"
                                  v-bind:class="{borderHighLight:!actived,borderIndex:actived}">
									注册
								</span>
                        </div>
                        <div class="login-boxs clearfix" id="loginBoxs">
                            <form method="POST" id="login-form" v-bind:class='{hide:!actived}' action="${ctx}/login"
                                  onsubmit="check()">
                                <div class="login-box login-box-1">
                                    <input type="hidden" name="nextUrl" value="${ctx}/article/view/${news.id}">
                                    <span class="logtip" id="logtip"></span>
                                    <p>用户名</p><input type="text" name="username" id="username"><br>
                                    <p>密码</p><input type="password" name="password" id="password"><br>
                                    <input type="checkbox" name="rememberMe" id="rememberMe" style="width: 20px"><label
                                        for="rememberMe">记住我</label>
                                </div>
                                <div class="login-btns">
                                    <input type="button" value="返回" class="login-btns2" v-on:click="closeForm()"/>
                                    <input type="submit" value="确认" class="login-btns1"/>
                                </div>
                            </form>
                            <form method="POST" id="register-form" v-bind:class='{hide:actived}'
                                  action="${ctx}/register">
                                <div id="loginbox" class="login-box login-box-2">
                                    <input type="hidden" name="nextUrl" value="${ctx}/index">
                                    <p>用户名</p><input type="text" ref="name" v-model="name"
                                                     name="username" class="register-name"><br>
                                    <span>
                                        <img src='${ctx}/static/img/right.png' v-bind:class="{hide:namewrong}"
                                             class="nametip"/>
                                        <span v-html="nametip"></span>
                                    </span><br>
                                    <p>性别</p>
                                    <input type="radio" name="gender" value="男" id="male" class="log-radio"><label
                                        for="male">男</label>
                                    <input type="radio" name="gender" value="女" id="female" class="log-radio"><label
                                        for="female">女</label>
                                    <input type="radio" name="gender" value="保密" id="secret" class="log-radio"><label
                                        for="secret">保密</label><br>
                                    <p>学历</p>
                                    <select name="education">
                                        <option value="无">无</option>
                                        <option value="小学">小学</option>
                                        <option value="初中">初中</option>
                                        <option value="高中">高中</option>
                                        <option value="大学及以上">大学及以上</option>
                                    </select><br>
                                    <p>密码</p><input type="password" ref="password" v-model="password"
                                                    name="password" class="register-pwd"><br>
                                    <span>
                                        <img src='${ctx}/static/img/right.png' v-bind:class="{hide:pwdwrong}"
                                             class="nametip"/>
                                        <span v-html="pwdtip"></span>
                                    </span><br>
                                </div>
                                <div class="login-btns">
                                    <input type="button" value="退出" class="login-btns2" v-on:click="closeForm()"/>
                                    <input type="submit" value="确认" class="login-btns1"/>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!-- login&&regist结束 -->
            <!-- 登录后的用户信息栏 -->

            <div class="userInf" v-bind:class="{hide:!registed}">
                <c:choose>
                    <c:when test="${user.avatar!=''&&user.avatar!=null}">
                        <div class="icon" style="background-image: url('${ctx}/upload/${user.avatar}')"></div>
                    </c:when>
                    <c:otherwise>
                        <div class="icon" style="background-image: url('${ctx}/static/img/indexPhoto.jpg')"></div>
                    </c:otherwise>
                </c:choose>
                <span class="userInf-name clearfix">${user.username}<span></span></span>
                <div class="userInf-drop-down">
                    <span class="userInf-drop-down-name">${user.username}</span>
                    <span onclick="javascript:window.location.href='${ctx}/myInf'">个人中心</span>
                    <shiro:hasRole name="admin">
                        <span onclick="javascript:window.location.href='${ctx}/add'">写文章</span>
                    </shiro:hasRole>
                    <span onclick="javascript:window.location.href='${ctx}/logout'">登出</span>
                </div>
            </div>
            <%--登录注册结束--%>
        </div>
    </div>
    <div class="widthfix">
        <div class="news-body">
            <%--news--%>
            <div class="news-title">
                ${news.title}
            </div>
            <div class="news-inf">
                <span>
                        作者：${news.author.username}
                </span>
                <span>
                        发布时间：${news.createAt}
                </span>
                <span class="news-type">
                    ${news.type.name}
                </span>
            </div>
            <div class="news-content">
                ${news.content}
            </div>
            <%--news end--%>
            <!-- comment -->
            <div class="comment-body">
                <div class="comment-add">
                    <div class="avatar" style="background-image: url('${ctx}/static/img/indexPhoto.png')"></div>
                    <form action="${news.id}/createComment" method="POST"  class="comment-add-form">
                        <input type="hidden" name="newsId" value="${news.id}">
                        <textarea name="content"></textarea>
                        <p><input type="submit" value="发表" class="submit-btn"></p>
                    </form>
                </div>
                <%--comment list--%>
                <div class="comment-list">
                    <c:forEach var="comment" items="${commentList}">
                        <div class="comment-nav" id="comment-nav-${comment.level}">
                                <%--commentator inf--%>
                            <div class="avatar" style="background-image: url('${ctx}/static/img/indexPhoto.png')"></div>
                            <div class="comment-main clearfix">
                                <div class="comment-commentator">
                                    <span class="comment-commentator-name">
                                                ${comment.author.username}
                                    </span>
                                    <span>
                                            ${comment.createAt}
                                    </span>
                                    <span class="comment-commentator-level">
                                            ${comment.level}楼
                                    </span>
                                    <span class="reply-btn reply-btn-1" data-comment-level="${comment.level}" data-comment-id="${comment.id}" data-comment-author="${comment.author.username}">回复</span>
                                </div>
                                    <%-- commentator inf end--%>
                                    <%-- comment body--%>
                                <div class="comment-content">
                                    <div class="comment-text">
                                            ${comment.content}
                                    </div>
                                        <%--reply--%>
                                    <c:forEach var="reply" items="${comment.replies}">
                                        <div class="comment-reply">
                                            <div class="reply-textfield">
                                                <a>${reply.author.username}</a>回复：<a>${reply.father.author.username}</a><br>
                                                <span>${reply.content}</span>
                                            </div>
                                            <div class="reply-inf">
                                                    <span>
                                                            ${reply.createAt}
                                                    </span>
                                                <span>
                                                    ${reply.father.level}-${reply.level}楼
                                                     </span>
                                                <span class="reply-btn reply-btn-2" data-comment-level="${comment.level}" data-comment-id="${reply.id}" data-comment-author="${reply.author.username}">回复</span>
                                            </div>

                                        </div>
                                    </c:forEach>
                                    <div class="reply-form hide" id="reply-form-${comment.level}">
                                        <form action="${news.id}/createComment" method="post" class="reply-area" id="reply-area-${comment.level}">
                                            <input type="hidden" name="rootCommentId" value="${comment.id}">
                                            <textarea class="reply-text" id="reply-text-${comment.level}" name="content"></textarea>
                                            <p><input type="submit" value="发表" class="submit-btn"/></p>
                                        </form>

                                    </div>
                                        <%--reply end--%>
                                </div>
                                    <%--comment body end--%>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <%--comment list end--%>
            </div>
            <!-- comment end -->
        </div>
    </div>
</div>
</body>

<script src="${ctx}/static/js/articleLog.js"></script>
<script>
    if ("${user.username}") {
        vm.registed = true
    }
</script>
<script src="${ctx}/static/js/article.js"></script>

</html>
