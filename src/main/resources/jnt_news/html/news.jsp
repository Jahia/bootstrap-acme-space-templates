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
<c:set var="newsTitleEscaped" value="${not empty title ? fn:escapeXml(title.string) : ''}"/>
<jcr:nodeProperty node="${currentNode}" name="desc" var="newsDesc"/>

<jcr:nodeProperty node="${currentNode}" name="date" var="newsDate"/>
<fmt:formatDate value="${newsDate.time}" pattern="MMMM" var="newsMonth"/>
<fmt:formatDate value="${newsDate.time}" pattern="d" var="newsDay"/>
<fmt:formatDate value="${newsDate.time}" pattern="yyyy" var="newsYear"/>

<jcr:nodeProperty var="image" node="${currentNode}" name="image"/>
<c:url value='${url.base}${currentNode.path}.detail.html' var="linkUrl" />

<article class="clearfix">
    <div class="media-date media-date-big media-date-big-nomarginright "><span class="month">${newsMonth}</span><span
            class="day">${newsDay}</span> <span class="year">${newsYear}</span></div>
    <c:if test="${!empty image}">
        <c:choose>
            <c:when test="${jcr:isNodeType(image.node, 'jmix:thumbnail')}">
                <a class="media-photo media-photo-medium media-photo-margintop-medium" href="#"><img src="${image.node.thumbnailUrls['thumbnail']}" alt="alt"></a>
            </c:when>
            <c:otherwise>
                <a class="media-photo media-photo-medium media-photo-margintop-medium" href="#"><img src="${image.node.url}" alt="${image.node.displayableName}" /></a>
            </c:otherwise>
        </c:choose>
    </c:if>
    <div class="media-body media-body-border-left media-body-marginleft150">
        <h2 class="media-heading"><a href="${linkUrl}">${title.string}</a></h2>

        <p>${functions:abbreviate(functions:removeHtmlTags(newsDesc.string),400,450,'...')}</p>
    </div>
</article>
