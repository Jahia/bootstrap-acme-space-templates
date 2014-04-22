<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="homeNode" value="${renderContext.site.home.path}"/>
<c:set var="pagePath" value="${fn:substringAfter(renderContext.mainResource.node.path,homeNode)}"/>
<c:set var="paths" value="${fn:split(pagePath,'/')}"/>

<jcr:node var="rootNode" path="${homeNode}/${paths[0]}"/>

<script type="text/javascript">
    $(document).ready(function(){
        $("#${currentNode.identifier} li > a").each(function(i, el){
            var $el = $(el);
            var iconClass = "";
            if($el.parent("li").hasClass("lvl0")){
                iconClass = "fa fa-chevron-right";
            }else if($el.parent("li").hasClass("lvl1")){
                iconClass = "fa fa-caret-right";
            }else {
                return;
            }
            var newContent = "<i class='" + iconClass + "'></i> " + $el.text();
            $el.html(newContent);
        });
    })
</script>

<c:if test="${rootNode.path != renderContext.site.home.path}">
    <ul class="nav nav-list" id="${currentNode.identifier}">
        <c:url var="rootUrl" value="${url.base}${rootNode.path}.html"/>
        <li class="nav-header"><a href="${rootUrl}" title="${rootNode.displayableName}">${rootNode.displayableName}</a>
        </li>
        <c:forEach items="${jcr:getChildrenOfType(rootNode, 'jnt:page,jnt:nodeLink,jnt:navMenuText,jnt:externalLink')}"
                   var="menuElement">
            <c:if test="${! jcr:isNodeType(menuElement, 'jmix:hidePage')}">
                <c:set var="activeClass" value=""/>
                <c:set var="menuElementPath" value="${menuElement.path}/"/>
                <c:if test="${fn:startsWith(renderContext.mainResource.node.path, menuElementPath) || renderContext.mainResource.node.path eq menuElement.path}">
                    <c:set var="activeClass">active</c:set>
                </c:if>
                <c:set var="children" value="${jcr:getChildrenOfType(menuElement, 'jnt:page,jnt:nodeLink,jnt:externalLink')}"/>
                <template:addCacheDependency path="${menuElement.canonicalPath}"/>
                <c:choose>
                    <c:when test="${jcr:isNodeType(menuElement, 'jnt:navMenuText')}">
                        <li class="divider"></li>
                    </c:when>
                    <c:otherwise>
                        <li class="lvl0 ${activeClass}">
                            <c:choose>
                                <c:when test="${jcr:isNodeType(menuElement, 'jnt:nodeLink,jnt:externalLink')}">
                                    <template:module node="${menuElement}"/>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="${menuElement.url}" context="/"/>">${menuElement.displayableName}</a>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${!empty activeClass && !empty children}">
                                <ul class="nav nav-list">
                                    <c:forEach items="${children}" var="subMenuElement">
                                        <c:set var="subActiveClass" value=""/>
                                        <c:set var="subMenuElementPath" value="${subMenuElement.path}/"/>
                                        <c:if test="${fn:startsWith(renderContext.mainResource.node.path, subMenuElementPath) || renderContext.mainResource.node.path eq subMenuElement.path}">
                                            <c:set var="subActiveClass">active</c:set>
                                        </c:if>
                                        <li class="lvl1 ${subActiveClass}">
                                            <c:choose>
                                                <c:when test="${jcr:isNodeType(subMenuElement, 'jnt:nodeLink,jnt:externalLink')}">
                                                    <template:module node="${subMenuElement}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value="${subMenuElement.url}" context="/"/>">${subMenuElement.displayableName}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </c:forEach>
    </ul>
</c:if>