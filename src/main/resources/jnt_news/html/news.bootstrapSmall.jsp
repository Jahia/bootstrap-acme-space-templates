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

<jcr:nodeProperty node="${currentNode}" name="jcr:title" var="newsTitle"/>
<c:set var="newsTitleEscaped" value="${not empty newsTitle ? fn:escapeXml(newsTitle.string) : ''}"/>
<jcr:nodeProperty node="${currentNode}" name="date" var="newsDate"/>
<jcr:nodeProperty node="${currentNode}" name="desc" var="newsDesc"/>
<jcr:nodeProperty node="${currentNode}" name="image" var="newsImage"/>
<c:url value='${url.base}${currentNode.path}.detail.html' var="linkUrl" />

<article class="clearfix">
    <div class="media-body">
        <h3 class="media-heading-small"><a href="${linkUrl}">${newsTitle.string}</a></h3>
        <fmt:message key="bootstrapComponents.news.datePattern" var="datePattern"/>
        <p class="media-info">
            <span class="label label-media-info"><i class="icon-calendar icon-white"></i> <fmt:formatDate value="${newsDate.time}" pattern="${datePattern}"/></span>
        </p>
    </div>
</article>