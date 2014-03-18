<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<template:addResources type="css" resources="article.css"/>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<h1>${currentNode.properties["jcr:title"].string}</h1>
<span class="label label-info"><i class="icon-star icon-white"></i>&nbsp;Auteur</span>
<h4 class="intro">
    ${currentNode.properties.intro.string}
</h4>
<c:forEach items="${currentNode.nodes}" var="paragraph">
    <c:if test="${jcr:isNodeType(paragraph,'jnt:paragraph')}">
        <template:module node="${paragraph}" view="default"/>
    </c:if>
</c:forEach>
<c:if test="${renderContext.editMode}">
    <template:module path="*"/>
</c:if>