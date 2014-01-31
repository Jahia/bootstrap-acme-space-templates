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

<c:if test="${jcr:isNodeType(renderContext.mainResource.node,'jnt:page' )}">
    <div class="page-header">
        <c:set var="pageTitle"
               value="${renderContext.mainResource.node.displayableName}"/>
        <c:if test="${jcr:isNodeType(renderContext.mainResource.node, 'jmix:alternateTitle')}">
            <c:set var="alternateTitle" value="${renderContext.mainResource.node.properties.alternateTitle.string}"/>
            <c:if test="${not empty alternateTitle}">
                <c:set var="pageTitle"
                       value="${alternateTitle}"/>
            </c:if>
        </c:if>
        <h1>${pageTitle}</h1>
        <c:if test="${jcr:isNodeType(renderContext.mainResource.node, 'jmix:intro')}">
            <div class="lead">${renderContext.mainResource.node.properties.intro.string}</div>
        </c:if>
    </div>
</c:if>
