<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<jcr:nodeProperty node="${currentNode}" name="jcr:description" var="description" />
<c:set var="linkTitle" value="${not empty description ? ' title=\"' + description.string + '\"' : ''}" />

<a href="${currentNode.url}" data-hover="dropdown" data-delay="500" class="dropdown-toggle"${linkTitle}>${currentNode.displayableName} <b class="caret"></b></a>