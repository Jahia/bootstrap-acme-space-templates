<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bootstrap" uri="http://www.jahia.org/tags/bootstrapLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="currentAliasUser" type="org.jahia.services.usermanager.JahiaUser"--%>

<bootstrap:addCSS/>
<template:addResources type="javascript" resources="bootstrap-alert.js"/>
<c:if test="${!renderContext.loggedIn || currentAliasUser.username eq 'guest'}">
    <script type="text/javascript">
        document.onkeydown = function (e) {
            if ((e || window.event).keyCode == 13) document.loginForm.submit();
        };
    </script>
    <ui:loginArea class="form-inline">
        <ui:isLoginError var="loginResult">
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <fmt:message
                        key="${loginResult == 'account_locked' ? 'message.accountLocked' : 'message.invalidUsernamePassword'}"/>
            </div>
        </ui:isLoginError>
        <c:if test="${not empty param['loginError']}">
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <fmt:message
                        key="${param['loginError'] == 'account_locked' ? 'message.accountLocked' : 'message.invalidUsernamePassword'}"/>
            </div>
        </c:if>

        <input class="input-small" type="text" value="" tabindex="1" maxlength="250" name="username" id="username"
               placeholder="<fmt:message key="label.username"/>"/>
        <input class="input-small" type="password" tabindex="2" maxlength="250" name="password" id="password"
               placeholder="<fmt:message key="label.password"/>"/>

        <label class="checkbox">
            <input type="checkbox" id="rememberme" name="useCookie"/><fmt:message key="loginForm.rememberMe.label"/>
        </label>

        <button type="submit" class="btn btn-small btn-primary"><fmt:message
                key='loginForm.loginbutton.label'/></button>
    </ui:loginArea>
</c:if>
<c:if test="${renderContext.loggedIn &&  !(currentAliasUser.username eq 'guest')}">
    <jcr:node var="user" path="${renderContext.user.localPath}"/>
    <jcr:nodeProperty node="${user}" name="j:publicProperties" var="publicProperties"/>
    <c:set var="publicPropertiesAsString" value=""/>

    <c:forEach items="${publicProperties}" var="value">
        <c:set var="publicPropertiesAsString" value="${value.string} ${publicPropertiesAsString}"/>
    </c:forEach>

    <p><fmt:message key="label.loggedAs"/>&nbsp;${renderContext.user.username}
        <c:if test="${!empty currentAliasUser}"> (as ${currentAliasUser.username})</c:if>&nbsp;
        <a class="btn btn-small btn-primary"
           href='<c:url value="${url.logout}"/>'><span><fmt:message key="label.logout"/></span></a>
    </p>
</c:if>
