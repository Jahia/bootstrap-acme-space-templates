<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
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
<template:addResources type="javascript" resources="bootstrap-carousel.js"/>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:set var="resourceReadOnly" value="${currentResource.moduleParams.readOnly}"/>
<template:include view="hidden.header"/>
<c:set var="isEmpty" value="true"/>
<c:choose>
    <c:when test="${moduleMap.liveOnly eq 'true' && !renderContext.liveMode}">
        <c:if test="${renderContext.editModeConfigName eq 'studiomode'}">
            <div class="area-liveOnly">
                <fmt:message key="label.content.creation.only.live"/>
            </div>
        </c:if>
        <c:if test="${!(renderContext.editModeConfigName eq 'studiomode')}">
            <template:addResources type="javascript" resources="jquery.min.js"/>
            <div id="liveList${currentNode.identifier}"></div>
            <script type="text/javascript">
                $('#liveList${currentNode.identifier}').load('<c:url value="${url.baseLive}${currentNode.path}.html.ajax"/>');
            </script>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:set var="divID" value="myCarousel${fn:replace(currentNode.identifier,'-', '')}"/>
        <c:if test="${jcr:isNodeType(currentNode, 'jmix:bootstrapCarouselInterval')}">
            <script type='text/javascript'>
                $(document).ready(function () {
                    $('#${divID}').carousel({
                        interval: ${currentNode.properties.interval.long}
                    })

                });
            </script>
        </c:if>
        <div id="${divID}" class="carousel slide" <c:if
                test="${jcr:isNodeType(currentNode, 'jmix:bootstrapCarouselInterval')}"> data-interval="${currentNode.properties.interval.long}" data-pause="hover"</c:if>>
            <ol class="carousel-indicators">
                <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}"
                           end="${moduleMap.end}" varStatus="status">
                    <li data-target="#${divID}" data-slide-to="${status.index}"<c:if
                            test="${status.first}"> class="active"</c:if>></li>
                </c:forEach>
            </ol>
            <div class="carousel-inner">
                <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}"
                           end="${moduleMap.end}" varStatus="status">
                <div class="item <c:if test="${status.first}"> active"
                </c:if>">
                <template:module node="${subchild}" view="${moduleMap.subNodesView}"
                                 editable="${moduleMap.editable && !resourceReadOnly}"/>
                <c:set var="isEmpty" value="false"/>
            </div>
            </c:forEach>
        </div>
        <c:if test="${not empty moduleMap.emptyListMessage and (renderContext.editMode or moduleMap.forceEmptyListMessageDisplay) and isEmpty}">
            ${moduleMap.emptyListMessage}
        </c:if>
        <c:if test="${moduleMap.editable and renderContext.editMode && !resourceReadOnly}">
            <template:module path="*"/>
        </c:if>
        <c:if test="${functions:length(moduleMap.currentList) gt 1}">
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#${divID}" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#${divID}" data-slide="next">&rsaquo;</a>
        </c:if>
        </div>
        <template:include view="hidden.footer"/>
    </c:otherwise>
</c:choose>
