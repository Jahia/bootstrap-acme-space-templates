<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="bootstrap" uri="http://www.jahia.org/tags/bootstrapLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<html lang="${renderContext.mainResourceLocale.language}">

<head>
    <meta charset="utf-8">

    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- Modernizr --%>
    <template:addResources type="javascript" resources="modernizr.js"/>

    <%-- google-code-prettify --%>
    <template:addResources type="css" resources="prettify.css"/>
    <template:addResources type="javascript" resources="prettify.js,lang-css.js,"/>

    <%-- HTML5 shim, for IE6-8 support of HTML5 elements --%>
    <template:addResources type="javascript" resources="html5shiv.js" condition="if lt IE 9"/>

    <%-- font-awesome icons --%>
    <template:addResources type="css" resources="font-awesome.css"/>

    <%-- Fav and touch icons --%>
    <link rel="shortcut icon" href="<c:url value='${url.currentModule}/icon/favicon.ico'/>" type="image/x-icon">
    <link rel="icon" href="<c:url value='${url.currentModule}/icon/favicon.ico'/>" type="image/ico">
    <link rel="icon" type="image/png" href="<c:url value='${url.currentModule}/icon/favicon.png'/>"/>

    <link rel="apple-touch-icon" href="<c:url value='${url.currentModule}/icon/icon-iphone.png'/>"/>
    <link rel="apple-touch-icon" sizes="72x72" href="<c:url value='${url.currentModule}/icon/icon-ipad.png'/>"/>
    <link rel="apple-touch-icon" sizes="114x114"
          href="<c:url value='${url.currentModule}/icon/jahia-icon-iphone4.png'/>"/>


    <%--tablet and iphone meta--%>
    <meta name='HandheldFriendly' content='True'/>
    <meta name="viewport"
          content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <!-- leaguegothic Type-->
    <template:addResources type="css" resources="orbitron.css"/>

</head>
<body class="body-bg">

<%-- Les styles old--%>
<template:addResources type="css" resources="jahia-old-responsive.css,jahia-old.css"/>

<template:addResources type="javascript" resources="jquery.min.js" />
<bootstrap:addThemeJS/>
<bootstrap:addCSS/>

<template:area path="header"/>

<div class="wrapper">
    <template:area path="pagecontent"/>
    <div class="copyright">
        <template:area path="footer"/>
    </div>
</div>


<c:if test="${renderContext.editMode}">
    <template:addResources type="css" resources="edit.css" />
</c:if>

</body>
</html>
