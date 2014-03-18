<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
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

<div class="accordion-group">
    <div class="accordion-heading">
        <a class="accordion-toggle"
           href="#collapse${currentResource.moduleParams.count}${fn:replace(currentResource.moduleParams.id,'-','')}"
           <c:if test="${not renderContext.editMode}">data-toggle="collapse"
           data-parent="#jnt_bootstrapCollapseList${fn:replace(currentResource.moduleParams.id,'-','')}"</c:if>>${fn:escapeXml(currentNode.displayableName)}</a>
    </div>

    <div class="accordion-body <c:if test="${not renderContext.editMode}">collapse <c:if test="${currentResource.moduleParams.first}">in</c:if></c:if>"
         id="collapse${currentResource.moduleParams.count}${fn:replace(currentResource.moduleParams.id,'-','')}">
        <div class="accordion-inner">
            <template:module path="${currentNode.path}" view="default"/>
        </div>
    </div>
</div>