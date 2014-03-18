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
<jcr:nodeProperty node="${currentNode}" name="body" var="body"/>

<jcr:nodeProperty node="${currentNode}" name="startDate" var="startDate"/>
<fmt:formatDate value="${startDate.time}" pattern="MMMM" var="startDateMonth"/>
<fmt:formatDate value="${startDate.time}" pattern="d" var="startDateDay"/>
<fmt:formatDate value="${startDate.time}" pattern="yyyy" var="startDateYear"/>

<c:url value='${url.base}${currentNode.path}.detail.html' var="linkUrl" />

<article class="clearfix">
    <div class="media-date media-date-big media-date-big-nomarginright "><span class="month">${startDateMonth}</span><span
            class="day">${startDateDay}</span> <span class="year">${startDateYear}</span></div>
    <c:if test="${! empty currentNode.properties.endDate}">
        <fmt:formatDate value="${currentNode.properties.endDate.time}" pattern="MMMM" var="endDateMonth"/>
        <fmt:formatDate value="${currentNode.properties.endDate.time}" pattern="d" var="endDateDay"/>
        <fmt:formatDate value="${currentNode.properties.endDate.time}" pattern="yyyy" var="endDateYear"/>
        <div class="media-date media-date-big media-date-big-end media-date-big-margintop"><span
                class="month">${endDateMonth}</span><span class="day">${endDateDay}</span> <span
                class="year">${endDateYear}</span></div>
    </c:if>

    <div class="media-body media-body-border-left media-body-marginleft150">

        <h2 class="media-heading"><a href="${linkUrl}">${title.string}</a></h2>
        <p class="media-info">
            <span class="label label-info"><i class="icon-star icon-white"></i>&nbsp;<fmt:message key='jnt_event.eventsType.${currentNode.properties.eventsType.string}'/></span>
    <span class="label label-info"><i
            class="icon-map-marker icon-white"></i>${currentNode.properties.location.string}</span></p>
        <jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="cat"/>
        <p class="media-info"><c:forEach items="${cat}" var="category" varStatus="status">
            <c:if test="${not status.first}">,&nbsp;</c:if>
            <i class="icon-tag"></i> <span class="text-info">${category.node.displayableName}</span>
        </c:forEach> </p>
        <p>${functions:abbreviate(functions:removeHtmlTags(body.string),400,450,'...')}</p>
    </div>
</article>
