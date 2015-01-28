<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="slider.css"/>

<jcr:nodeProperty var="bgimage" node="${currentNode}" name="bgimage"/>
<c:set var="bgimageUrl" value="${bgimage.node.url}"/>
<section class="slider-container illustration-section " <c:if test="${! empty bgimageUrl}"> style="background: url('${bgimageUrl}') no-repeat 50% 50%"</c:if>>
    <div class="container-fluid ">
<c:choose>
    <c:when test="${renderContext.editMode}">
    <ul>
        <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:spaceCarouselItem')}" var="item" varStatus="status">
            <li>
                <template:module node="${item}" editable="true"/>
            </li>
        </c:forEach>
    </ul>
        <template:module path="*" nodeTypes="jnt:spaceCarouselItem"/>
    </c:when>
    <c:otherwise>
    <div id="carousel${currentNode.identifier}" class="carousel slide slider">
        <ol class="carousel-indicators">
            <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:spaceCarouselItem')}" var="item" varStatus="status">
                <li data-target="#carousel${currentNode.identifier}" data-slide-to="${status.index}" class="${status.index eq 0?'active':''}"></li>
                <c:set var="carouselInner">${carouselInner}
                    <c:set var="classItem" value="${status.index eq 0?'active':''} item"/>
                    <div class="${classItem}">
                    <template:module node="${item}"/>
                </div>
                </c:set>
            </c:forEach>
        </ol>
        <div class="carousel-inner">
            ${carouselInner}
        </div>
        <a class="carousel-control left" href="#carousel${currentNode.identifier}" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#carousel${currentNode.identifier}" data-slide="next">&rsaquo;</a>

    </c:otherwise>
    </c:choose>
    </div>
    <c:if test="${renderContext.editMode}">
    </c:if>
</section>

<template:addResources type="javascript" resources="jquery.min.js,bootstrap-carousel.js"/>
