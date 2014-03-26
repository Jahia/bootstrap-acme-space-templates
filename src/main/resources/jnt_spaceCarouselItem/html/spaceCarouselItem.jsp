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
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="lead" value="${currentNode.properties['lead'].string}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="linkType" value="${currentNode.properties['j:linkType'].string}"/>

<c:set var="linkUrl"/>
<c:choose>
    <c:when test="${linkType == 'internal'}">
        <c:set var="linkNode" value="${currentNode.properties['j:linknode'].node}"/>
        <c:set var="linkTitle" value="${linkNode.displayableName}"/>
        <c:url var="linkUrl" value="${url.base}${linkNode.path}.html"/>
    </c:when>
    <c:when test="${linkType == 'external'}">
        <c:set var="linkTitle" value="${currentNode.properties['j:linkTitle'].string}"/>
        <c:if test="${empty linkTitle}">
            <fmt:message var="linkTitle" key="jmix_alink.noTitle"/>
        </c:if>

        <c:set var="linkUrl" value="${currentNode.properties['j:url'].string}"/>
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

<c:choose>
    <c:when test="${renderContext.editMode}">
        <p>
            <jcr:nodeProperty var="image" node="${currentNode}" name="image"/>
            <img src="${image.node.url}" alt="${image.node.displayableName}" align="left" width="100" style="padding-right: 10px;"/>
            <strong>${title}</strong><br/>
                ${lead}<br/>
            <a href="${linkUrl}">${linkTitle}</a>
        </p>
    </c:when>
    <c:otherwise>
        <div class="container">
            <div class="carousel-caption">

                <h2>${title}</h2>

                <p class="lead inverse">${lead}</p>
                <a href="${linkUrl}" class="btn btn-large btn-primary"><i class="fa fa-chevron-right"></i>
                    <fmt:message key="bootstrapAcmeSpaceTemplates.message.readMore"/>
                </a>
            </div>

            <div class="carousel-img">
                <jcr:nodeProperty var="image" node="${currentNode}" name="image"/>
                <a href="${linkUrl}"><img src="${image.node.url}" alt="${image.node.displayableName}"/></a>
                <div class="clearfix"></div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
