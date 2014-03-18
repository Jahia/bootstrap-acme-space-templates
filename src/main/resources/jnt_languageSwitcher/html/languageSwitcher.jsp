<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="bootstrap" uri="http://www.jahia.org/tags/bootstrapLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<bootstrap:addCSS/>
<template:addResources type="css" resources="languageSwitchingLinks.css"/>
<template:addResources type="javascript" resources="bootstrap-dropdown.js"/>
<c:set var="linkKind" value="${currentNode.properties.typeOfDisplay.string}"/>
<c:choose>
    <c:when test="${linkKind eq 'flag'}">
        <c:set var="flag"/>
    </c:when>
    <c:when test="${linkKind eq 'flagPlain'}">
        <c:set var="flag" value="_plain"/>
    </c:when>
    <c:when test="${linkKind eq 'flagShadow'}">
        <c:set var="flag" value="_shadow"/>
    </c:when>
</c:choose>

<ui:initLangBarAttributes activeLanguagesOnly="${renderContext.liveMode}"/>
<div class="btn-group btn-mini">
    <c:forEach items="${requestScope.languageCodes}" var="language">
        <ui:displayLanguageSwitchLink languageCode="${language}" display="false" urlVar="switchUrl"
                                      var="renderedLanguage"
                                      linkKind="${currentNode.properties.typeOfDisplay.string}"/>
        <c:if test="${language eq currentResource.locale}">
            <c:if test="${not empty flag}">
                <c:set var="renderedLanguage">
                    <span class='flag flag_${language}${flag}_off'></span>
                </c:set>
            </c:if>
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">${renderedLanguage}<span
                    class="caret"></span></a>
        </c:if>
    </c:forEach>
    <ul class="dropdown-menu">
        <c:forEach items="${requestScope.languageCodes}" var="language">
            <ui:displayLanguageSwitchLink languageCode="${language}" display="false" urlVar="switchUrl"
                                          var="renderedLanguage"
                                          linkKind="${currentNode.properties.typeOfDisplay.string}"/>
            <c:if test="${ language ne currentResource.locale}">
                <c:if test="${not empty flag}">
                    <c:set var="renderedLanguage">
                        <span class='flag flag_${language}${flag}_off'></span>
                    </c:set>
                </c:if>
                <li><a title="<fmt:message key='switchTo'/>"
                       href="<c:url context='/' value='${switchUrl}'/>">${renderedLanguage}</a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>
