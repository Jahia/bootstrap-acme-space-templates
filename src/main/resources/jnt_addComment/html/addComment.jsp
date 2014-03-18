<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="acl" type="java.lang.String"--%>
<template:addResources type="css" resources="commentable.css"/>
<template:addResources type="javascript" resources="jquery.min.js,jquery.validate.js"/>
<template:addResources type="inlinejavascript">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#newCommentForm").validate({
                rules: {
                    'jcr:title': "required",
                    <c:if test="${not renderContext.loggedIn}">
                    pseudo: "required",
                    captcha: "required"
                    </c:if>
                }
            });
        });
    </script>
</template:addResources>
<c:set var="boundComponent"
       value="${uiComponents:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:if test="${not empty boundComponent}">
    <a name="addComments"></a>

    <template:tokenizedForm>
        <form action="<c:url value='${url.base}${boundComponent.path}.addComment.do'/>" method="post"
              id="newCommentForm" class="form-horizontal">
            <input type="hidden" name="jcrNodeType" value="jnt:post"/>
            <input type="hidden" name="jcrRedirectTo"
                   value="<c:url value='${url.base}${renderContext.mainResource.node.path}'/>"/>
            <input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
            <input type="hidden" name="jcrResourceID" value="${currentNode.identifier}"/>
            <fieldset>
                <c:if test="${not renderContext.loggedIn}">
                    <div class="control-group">
                        <label class="control-label" for="comment_pseudo">
                            <fmt:message key="comment.pseudo"/>
                        </label>

                        <div class="controls">
                            <input value="${sessionScope.formDatas['pseudo'][0]}"
                                   type="text" size="35" name="pseudo" id="comment_pseudo"
                                   tabindex="1"/>
                        </div>
                    </div>
                </c:if>
                <div class="control-group">
                    <label class="control-label" for="comment-title">
                        <fmt:message key="comment.title"/>
                    </label>

                    <div class="controls">
                        <input value="${sessionScope.formDatas['jcr:title'][0]}"
                               type="text" size="35" id="comment-title" name="jcr:title"
                               tabindex="1"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="jahia-comment-${boundComponent.identifier}">
                        <fmt:message key="comment.body"/>
                    </label>

                    <div class="controls">
                        <textarea rows="7" cols="35" id="jahia-comment-${boundComponent.identifier}"
                                  name="content"
                                  tabindex="2"><c:if
                                test="${not empty sessionScope.formDatas['content']}">${fn:escapeXml(sessionScope.formDatas['content'][0])}</c:if></textarea>
                    </div>
                </div>

                <c:if test="${not renderContext.loggedIn}">
                    <label class="control-label" for="captcha">
                        <fmt:message key="label.captcha"/>
                    </label>
                    <template:captcha/>
                    <c:if test="${not empty sessionScope.formError}">
                        <label class="text-error">${fn:escapeXml(sessionScope.formError)}</label>
                    </c:if>
                    <label class="control-label" for="captcha"><fmt:message key="label.captcha.enter"/></label>
                    <input type="text" id="captcha" name="jcrCaptcha"/>
                </c:if>
                <div class="control-group">
                    <div class="controls">
                        <input type="reset" value="<fmt:message key='label.reset'/>" class="btn"
                               tabindex="3"  ${disabled}/>

                        <input type="submit" value="<fmt:message key='label.submit'/>" class="btn btn-primary"
                               tabindex="4"  ${disabled} onclick=""/>
                    </div>
                </div>
            </fieldset>
        </form>
    </template:tokenizedForm>
</c:if>
