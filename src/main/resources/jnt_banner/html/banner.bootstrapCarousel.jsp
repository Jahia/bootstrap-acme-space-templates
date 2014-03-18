<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<jcr:nodeProperty node="${currentNode}" name="background" var="background"/>
<template:addCacheDependency node="${background.node}"/>
<img src="${background.node.url}" alt="">

<div class="carousel-caption">
    <h4><jcr:nodeProperty node="${currentNode}" name="jcr:title"/></h4>

    <p>${currentNode.properties.cast.string}</p>
</div>
