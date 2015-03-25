<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
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
<template:addResources type="javascript" resources="jquery.min.js,spectrum.js"/>
<template:addResources type="css" resources="spectrum.css"/>

<jcr:node var="bootstrapVariables" path="${renderContext.mainResource.node.resolveSite.path}/bootstrapVariables" />
<c:if test="${not empty bootstrapVariables}">
    <jcr:nodeProperty node="${bootstrapVariables}" name="bodyBackground" var="bodyBackground" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="textColor" var="textColor" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="linkColor" var="linkColor" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="baseFontSize" var="baseFontSize" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="baseFontFamily" var="baseFontFamily" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="baseLineHeight" var="baseLineHeight" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="headingsFontFamily" var="headingsFontFamily" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="headingsFontWeight" var="headingsFontWeight" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="headingsColor" var="headingsColor" />
    <jcr:nodeProperty node="${bootstrapVariables}" name="navbarTopBorder" var="navbarTopBorder" />
</c:if>
<c:choose>
    <c:when test="${empty bodyBackground}"><c:set var="bodyBackground" value="@black" /></c:when>
    <c:otherwise><c:set var="bodyBackground" value="${bodyBackground.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty textColor}"><c:set var="textColor" value="@gray" /></c:when>
    <c:otherwise><c:set var="textColor" value="${textColor.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty linkColor}"><c:set var="linkColor" value="#6600cc" /></c:when>
    <c:otherwise><c:set var="linkColor" value="${linkColor.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty baseFontSize}"><c:set var="baseFontSize" value="14px" /></c:when>
    <c:otherwise><c:set var="baseFontSize" value="${baseFontSize.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty baseFontFamily}"><c:set var="baseFontFamily" value="@sansFontFamily" /></c:when>
    <c:otherwise><c:set var="baseFontFamily" value="${baseFontFamily.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty baseLineHeight}"><c:set var="baseLineHeight" value="20px" /></c:when>
    <c:otherwise><c:set var="baseLineHeight" value="${baseLineHeight.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty headingsFontFamily}"><c:set var="headingsFontFamily" value="'Orbitron Medium',@sansFontFamily" /></c:when>
    <c:otherwise><c:set var="headingsFontFamily" value="${headingsFontFamily.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty headingsFontWeight}"><c:set var="headingsFontWeight" value="normal" /></c:when>
    <c:otherwise><c:set var="headingsFontWeight" value="${headingsFontWeight.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty headingsColor}"><c:set var="headingsColor" value="@black" /></c:when>
    <c:otherwise><c:set var="headingsColor" value="${headingsColor.string}" /></c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty navbarTopBorder}"><c:set var="navbarTopBorder" value="#6600cc" /></c:when>
    <c:otherwise><c:set var="navbarTopBorder" value="${navbarTopBorder.string}" /></c:otherwise>
</c:choose>

<div class="alert alert-block">
    <fmt:message key="bootstrapAcmeSpaceTemplates.bootstrap.variables.imagesInfo"/>
</div>
<fieldset class="box-1">
    <legend>Scaffolding</legend>
    <label><div class="row-fluid">
        <div class="span3">bodyBackground</div>
        <div class="span9"><input type="text" id="bodyBackground" name="bodyBackground" value="${fn:escapeXml(bodyBackground)}" /></div>
    </div></label>
    <label><div class="row-fluid">
        <div class="span3">textColor</div>
        <div class="span9"><input type="text" id="textColor" name="textColor" value="${fn:escapeXml(textColor)}" /></div>
    </div></label>
</fieldset>
<fieldset class="box-1">
    <legend>Links</legend>
    <label><div class="row-fluid">
        <div class="span3">linkColor</div>
        <div class="span9"><input type="text" id="linkColor" name="linkColor" value="${fn:escapeXml(linkColor)}" /></div>
    </div></label>
</fieldset>
<fieldset class="box-1">
    <legend>Typography</legend>
    <label><div class="row-fluid">
        <div class="span3">baseFontSize</div>
        <div class="span9"><input type="text" name="baseFontSize" value="${fn:escapeXml(baseFontSize)}" /></div>
    </div></label>
    <label><div class="row-fluid">
        <div class="span3">baseFontFamily</div>
        <div class="span9">
            <select name="baseFontFamily">
                <option value="@sansFontFamily" <c:if test="${baseFontFamily eq '@sansFontFamily'}">selected="selected" </c:if>>Sans-Serif Fonts</option>
                <option value="@serifFontFamily" <c:if test="${baseFontFamily eq '@serifFontFamily'}">selected="selected" </c:if>>Serif Fonts</option>
                <option value="@monoFontFamily" <c:if test="${baseFontFamily eq '@monoFontFamily'}">selected="selected" </c:if>>Monospace Fonts</option>
            </select>
        </div>
    </div></label>
    <label><div class="row-fluid">
        <div class="span3">baseLineHeight</div>
        <div class="span9"><input type="text" name="baseLineHeight" value="${fn:escapeXml(baseLineHeight)}" /></div>
    </div></label>
    <label><div class="row-fluid">
        <div class="span3">headingsFontFamily</div>
        <div class="span9">
            <select name="headingsFontFamily">
                <option value="'Orbitron Medium',@sansFontFamily" <c:if test="${headingsFontFamily eq '\\\'Orbitron Medium\\\',@sansFontFamily'}">selected="selected" </c:if>>Orbitron Medium + Sans-Serif Fonts</option>
                <option value="@sansFontFamily" <c:if test="${headingsFontFamily eq '@sansFontFamily'}">selected="selected" </c:if>>Sans-Serif Fonts</option>
                <option value="@serifFontFamily" <c:if test="${headingsFontFamily eq '@serifFontFamily'}">selected="selected" </c:if>>Serif Fonts</option>
                <option value="@monoFontFamily" <c:if test="${headingsFontFamily eq '@monoFontFamily'}">selected="selected" </c:if>>Monospace Fonts</option>
            </select>
        </div>
    </div></label>
    <label><div class="row-fluid">
        <div class="span3">headingsFontWeight</div>
        <div class="span9">
            <select name="headingsFontWeight">
                <option value="normal" <c:if test="${headingsFontWeight eq 'normal'}">selected="selected" </c:if>>normal</option>
                <option value="bold" <c:if test="${headingsFontWeight eq 'bold'}">selected="selected" </c:if>>bold</option>
            </select>

        </div>
    </div></label>
    <label><div class="row-fluid">
        <div class="span3">headingsColor</div>
        <div class="span9"><input type="text" id="headingsColor" name="headingsColor" value="${fn:escapeXml(headingsColor)}" /></div>
    </div></label>
</fieldset>
<fieldset class="box-1">
    <legend>Navbar</legend>
    <label><div class="row-fluid">
        <div class="span3">navbarTopBorder</div>
        <div class="span9"><input type="text" id="navbarTopBorder" name="navbarTopBorder" value="${navbarTopBorder}" /></div>
    </div></label>
</fieldset>

<script>
    $("#bodyBackground").spectrum({preferredFormat: "hex"});
    $("#textColor").spectrum({preferredFormat: "hex"});
    $("#linkColor").spectrum({preferredFormat: "hex"});
    $("#headingsColor").spectrum({preferredFormat: "hex"});
    $("#navbarTopBorder").spectrum({preferredFormat: "hex"});
    $("#bodyBackground").show();
    $("#textColor").show();
    $("#linkColor").show();
    $("#headingsColor").show();
    $("#navbarTopBorder").show();
</script>
