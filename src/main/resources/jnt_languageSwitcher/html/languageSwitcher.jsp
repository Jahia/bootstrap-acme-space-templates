<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="cache" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jcr:nodeProperty node="${currentNode}" name="position" var="position"/>
<c:set var="pullClass" value="" />
<c:if test="${not empty position}">
    <c:set var="pullClass" value=" pull-${position.string}" />
</c:if>

<template:addResources type="css" resources="languageSwitchingLinks.css"/>
<c:set var="linkKind" value="${currentNode.properties.typeOfDisplay.string}"/>
<c:set var="flag" value="${linkKind eq 'flag'}"/>
<cache:addCacheDependency path="${renderContext.site.path}"/>
<ui:initLangBarAttributes activeLanguagesOnly="${renderContext.liveMode}"/>
<c:if test="${not empty requestScope.languageCodes}">
    <ul class="nav${pullClass}">
        <li class="dropdown">
            <c:forEach items="${requestScope.languageCodes}" var="language">
                <ui:displayLanguageSwitchLink languageCode="${language}" display="false" urlVar="switchUrl"
                                              var="renderedLanguage"
                                              linkKind="${currentNode.properties.typeOfDisplay.string}"/>
                <c:if test="${language eq currentResource.locale}">
                    <c:if test="${flag}">
                        <c:set var="renderedLanguage">
                            <span class='flag ${functions:getLanguageFlagCSSClass(functions:toLocale(language))}'></span>
                        </c:set>
                    </c:if>
                    <a class="dropdown-hover" data-hover="dropdown" href="#">${renderedLanguage}<span
                            class="caret"></span></a>
                </c:if>
            </c:forEach>
            <ul class="dropdown-menu">
                <c:forEach items="${requestScope.languageCodes}" var="language">
                    <c:if test="${ language ne currentResource.locale}">
                        <ui:displayLanguageSwitchLink languageCode="${language}" display="false" urlVar="switchUrl"
                                                      var="renderedLanguage"
                                                      linkKind="${currentNode.properties.typeOfDisplay.string}"/>
                        <c:if test="${flag}">
                            <c:set var="renderedLanguage">
                                <span class='flag ${functions:getLanguageFlagCSSClass(functions:toLocale(language))}'></span>
                            </c:set>
                        </c:if>
                        <li><a title="<fmt:message key='switchTo'/>"
                               href="<c:url context='/' value='${switchUrl}'/>">${renderedLanguage}</a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </li>
    </ul>
</c:if>