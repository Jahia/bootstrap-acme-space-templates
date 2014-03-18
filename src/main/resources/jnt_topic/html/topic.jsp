<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="javascript" resources="jquery.min.js,jquery.cuteTime.js"/>
<script>
    function initCuteTime() {
        $('.timestamp').cuteTime({ refresh: 60000 });
    }
    $(document).ready(function () {
        $('.timestamp').cuteTime({ refresh: 60000 });
    });
</script>
<ul class="media-list" id="${currentNode.UUID}">
    <jcr:sql var="numberOfPostsQuery"
             sql="select * from [jnt:post] as post  where isdescendantnode(post, ['${functions:sqlencode(currentNode.path)}']) order by post.[jcr:lastModified] desc"/>
    <c:set target="${moduleMap}" property="commentsList" value="${numberOfPostsQuery.nodes}"/>
    <c:set target="${moduleMap}" property="listTotalSize" value="${numberOfPostsQuery.nodes.size}"/>
    <c:forEach items="${moduleMap.commentsList}" var="subchild" varStatus="status" begin="${moduleMap.begin}"
               end="${moduleMap.end}">
        <li class="media"><template:module node="${subchild}"/></li>
    </c:forEach>
</ul>
