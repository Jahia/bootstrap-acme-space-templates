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
<c:set var="base" value="${currentNode.properties.base.node}"/>

<c:forEach var="level1Page" items="${jcr:getChildrenOfType(base, 'jmix:sitemap')}" varStatus="level1Status">
    <c:if test="${level1Status.first}"><ul class="sitemap"></c:if>
    <li><h2><i class="fa fa-chevron-right"></i> 
      <c:choose>
         <c:when test="${jcr:isNodeType(level1Page, 'jnt:navMenuText')}">
            <a href='' onclick="return false"><strong>${level1Page.displayableName}</strong></a>
         </c:when>
         <c:otherwise>
            <a href="${level1Page.url}" title="${level1Page.displayableName}"><strong>${level1Page.displayableName}</strong></a>
         </c:otherwise>
      </c:choose>
      </h2>
        <c:forEach var="level2Page" items="${jcr:getChildrenOfType(level1Page, 'jmix:sitemap')}" varStatus="level2Status">
            <c:if test="${level2Status.first}"><ul></c:if>
            <li><h3><i class="fa fa-file"></i> 
              
              <c:choose>
                 <c:when test="${jcr:isNodeType(level2Page, 'jnt:navMenuText')}">
                    <a href='' onclick="return false"><strong>${level2Page.displayableName}</strong></a>
                 </c:when>
                <c:otherwise>
                    <a href="${level2Page.url}" title="${level2Page.displayableName}">${level2Page.displayableName}</a>
                </c:otherwise>
              </c:choose>
              </h3>
                <c:forEach var="level3Page" items="${jcr:getChildrenOfType(level2Page, 'jmix:sitemap')}" varStatus="level3Status">
                    <c:if test="${level3Status.first}"><ul></c:if>
                    <li><i class="fa fa-file-o"></i> 
                    <c:choose>
                     	<c:when test="${jcr:isNodeType(level3Page, 'jnt:navMenuText')}">
                    		<a href='' onclick="return false"><strong>${level3Page.displayableName}</strong></a>
                 		</c:when>
                		<c:otherwise>
                    		<a href="${level3Page.url}" title="${level3Page.displayableName}">${level3Page.displayableName}</a>
                		</c:otherwise>
              		</c:choose>                      
                    </li>
                    <c:if test="${level3Status.last}"></ul></c:if>
                </c:forEach>
            </li>
            <c:if test="${level2Status.last}"></ul></c:if>
        </c:forEach>
    </li>
    <c:if test="${level1Status.last}"></ul></c:if>
</c:forEach>
