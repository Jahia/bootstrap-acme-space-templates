<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="bootstrap" uri="http://www.jahia.org/tags/bootstrapLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="newsImage" type="org.jahia.services.content.JCRPropertyWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<bootstrap:addCSS/>
<template:addResources type="css" resources="bootstrapComponents.css"/>
<c:if test="${!empty jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}">
    <c:url value='${url.base}${jcr:getParentOfType(renderContext.mainResource.node, "jnt:page").path}.html' var="action"/>
</c:if>
<c:if test="${empty jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}">
    <c:set var="action">javascript:history.back()</c:set>
</c:if>

<jcr:nodeProperty node="${currentNode}" name="jcr:title" var="title"/>
<jcr:nodeProperty node="${currentNode}" name="intro" var="body"/>

<c:url value='${url.base}${currentNode.path}.article-detail.html' var="linkUrl" />

<article class="clearfix">
    <div class="media-body media-body-border-left media-body-marginleft150">

        <h2 class="media-heading"><a href="${linkUrl}">${title.string}</a></h2>
        <span class="label label-info"><i class="icon-star icon-white"></i>&nbsp;Auteur</span>

        <p class="media-info">
            <jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="cat"/>
        <p class="media-info"><c:forEach items="${cat}" var="category" varStatus="status">
            <c:if test="${not status.first}">,&nbsp;</c:if>
            <i class="icon-tag"></i> <span class="text-info">${category.node.displayableName}</span>
        </c:forEach> </p>
        <p>${body.string}</p>
    </div>
</article>