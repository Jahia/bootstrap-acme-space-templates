<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<jcr:nodeProperty node="${currentNode}" name="background" var="background"/>
<c:if test="${not empty background}">
    <template:addCacheDependency node="${background.node}"/>
</c:if>
<div class="hero-unit">
    <h1><jcr:nodeProperty node="${currentNode}" name="jcr:title"/></h1>
    <c:if test="${not empty background}">
        <img src="${background.node.url}" alt="">
    </c:if>
    <p>${currentNode.properties.cast.string}</p>
</div>
