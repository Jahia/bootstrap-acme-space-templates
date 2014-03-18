<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bootstrap" uri="http://www.jahia.org/tags/bootstrapLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<bootstrap:addCSS/>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="bootstrap-modal.js"/>
<a href="#popup-${currentNode.name}" role="button" class="btn" data-toggle="modal">${currentNode.properties['buttonLabel'].string}</a>

<c:if test="${not renderContext.editMode}">
    <div id="popup-${currentNode.name}" class="modal hide fade ${currentNode.properties['popupClass'].string}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-body">
</c:if>
    <template:area path="popup-content" areaAsSubNode="false"/>
<c:if test="${not renderContext.editMode}">
    </div>

    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true"><fmt:message key="label.close"/></button>
    </div>
    </div>
</c:if>
