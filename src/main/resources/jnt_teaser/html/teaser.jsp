<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<bootstrap:addCSS/>
<template:addResources type="css" resources="bootstrapComponents.css"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<fmt:message key="bootstrapComponents.teaser.readMore" var="linkTitle"/>
<c:url value='${url.base}${currentNode.properties.link.node.path}.html' var="linkUrl"/>

<div class="teaser">
    <jcr:nodeProperty var="image" node="${currentNode}" name="image"/>
    <c:if test="${! empty image}">
        <div class="img-wrapper">
            <a href="${linkUrl}" title="${fn:escapeXml(linkTitle)}">
                <img src="${image.node.url}" alt="${image.node.displayableName}">
            <span class="circle">
            <span class="plus">+</span>
            </span>
            </a>
        </div>
    </c:if>
    <div class="teaser-text">
        <a href="${linkUrl}" title="${fn:escapeXml(linkTitle)}"><h3>${title}</h3></a>
        ${currentNode.properties.abstract.string}
    </div>
</div>
