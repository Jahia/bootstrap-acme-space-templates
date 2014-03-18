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
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
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

<a class="btn btn-primary" href="${action}" title="<fmt:message key="acmeBootstrapTemplate.back"/>">
    <i class="icon-chevron-left icon-white"></i> <fmt:message key="acmeBootstrapTemplate.back"/> </a>

<article class="news">

    <div class="media-body"><h1>${title.string}</h1> <span class="btn btn-default">${newsDate.time}</span></div>

    <div class="media-text-big">
        ${newsDesc.string}
    </div>
    <c:if test="${! empty image}">
        <figure><img src="<c:url value="${image.node.url}" context="/"/>" alt="${image.node.displayableName}"></figure>
    </c:if>

</article>