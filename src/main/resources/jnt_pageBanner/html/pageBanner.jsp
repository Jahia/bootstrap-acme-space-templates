<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<jcr:nodeProperty var="bgimage" node="${currentNode}" name="bgimage"/>
<c:set var="linkType" value="${currentNode.properties['linkType'].string}"/>

<c:set var="linkUrl"/>
<c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
<c:choose>
    <c:when test="${linkType == 'internal'}">
        <c:set var="linkNode" value="${currentNode.properties.internalLink.node}"/>
        <c:if test="${empty linkTitle}">
            <c:set var="linkTitle" value="${linkNode.displayableName}"/>
        </c:if>
        <c:url var="linkUrl" value="${url.base}${linkNode.path}.html"/>
    </c:when>
    <c:when test="${linkType == 'external'}">
        <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
        <c:if test="${empty linkTitle}">
            <fmt:message var="linkTitle" key="jmix_alink.noTitle"/>
        </c:if>

        <c:set var="linkUrl" value="${currentNode.properties.externalLink.string}"/>
    </c:when>
    <c:otherwise>
        <c:if test="${renderContext.editMode}">
            <div class="alert">
                <strong><fmt:message key="bootstrapAcmeSpaceTemplates.message.warning"/>!</strong> <fmt:message
                    key="bootstrapAcmeSpaceTemplates.couldNotDisplayLink"/> ${linkType}.
            </div>
        </c:if>
    </c:otherwise>
</c:choose>

<section class="illustration-section" style="background: #ccc url('${bgimage.node.url}') no-repeat 50% 50%">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="center-on-phone">
                <div class="span4">
                    <div class="center-on-phone">
                        <a href="${linkUrl}">
                            <jcr:nodeProperty var="image" node="${currentNode}" name="image"/>
                            <img src="${image.node.url}" alt="${image.node.displayableName}"/>
                        </a>
                    </div>
                </div>
                <div class="span8">
                    <div class="center-on-phone">
                        ${currentNode.properties.text.string}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>