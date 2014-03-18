<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<c:set var="writeable" value="${currentResource.workspace eq 'live'}"/>
<c:if test='${not writeable}'>
    <c:set var="disabled" value='disabled="true"'/>
</c:if>
<template:tokenizedForm>
<form action="<c:url value='${url.base}${currentNode.path}/*'/>" method="post" class="form-horizontal">
<input type="hidden" name="jcrNodeType" value="jnt:contact"/>
<input type="hidden" name="jcrRedirectTo"
       value="<c:url value='${url.base}${renderContext.mainResource.node.path}'/>"/>
    <%-- Define the output format for the newly created node by default html or by jcrRedirectTo--%>
<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
<c:set var="props" value="${currentNode.properties}"/>
<jcr:nodeType name="jnt:contact" var="contactType"/>
<c:set var="propDefs" value="${contactType.declaredPropertyDefinitionsAsMap}"/>
<fieldset>
<legend><fmt:message key="jnt_contact"/></legend>
<c:if test="${props.gender.boolean}">
    <div class="control-group">
        <label class="control-label" for="gender">
                ${fn:escapeXml(jcr:label(props.gender.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <select name="gender" id="gender" ${disabled}>
                <c:forEach items="${propDefs.gender.valueConstraints}" var="valueOption">
                    <option value="${valueOption}"><fmt:message
                            key="jnt_contact.gender.${valueOption}"/></option>
                </c:forEach>
            </select>
        </div>
    </div>
</c:if>
<c:if test="${props.title.boolean}">
    <div class="control-group">
        <label class="control-label" for="title">
                ${fn:escapeXml(jcr:label(props.title.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <select name="title" id="title" ${disabled}>
                <c:forEach items="${propDefs.title.valueConstraints}" var="valueOption">
                    <option value="${valueOption}"><fmt:message
                            key="jnt_contact.title.${valueOption}"/></option>
                </c:forEach>
            </select>
        </div>
    </div>
</c:if>
<c:if test="${props.firstname.boolean}">
    <div class="control-group">
        <label class="control-label" for="firstname">
                ${fn:escapeXml(jcr:label(props.firstname.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <input id="firstname" type="text" name="firstname" ${disabled} />
        </div>
    </div>
</c:if>

<c:if test="${props.lastname.boolean}">
    <div class="control-group">
        <label class="control-label" for="lastname">
                ${fn:escapeXml(jcr:label(props.lastname.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <input id="lastname" type="text" name="lastname" ${disabled} />
        </div>
    </div>
</c:if>

<c:if test="${props.age.boolean}">
    <div class="control-group">
        <label class="control-label" for="age">
                ${fn:escapeXml(jcr:label(props.age.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <input type="text" id="age" name="age" ${disabled} />
        </div>
    </div>
</c:if>
<c:if test="${props.birthdate.boolean}">
    <div class="control-group">
        <label class="control-label" for="birthdate">
                ${fn:escapeXml(jcr:label(props.birthdate.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <input type="text" id="birthdate" name="birthdate" ${disabled}/>
        </div>
    </div>
</c:if>

<c:if test="${props.profession.boolean}">
    <div class="control-group">
        <label class="control-label" for="profession">
                ${fn:escapeXml(jcr:label(props.profession.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <input type="text" id="profession" name="profession" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.maritalStatus.boolean}">
    <div class="control-group">
        <label class="control-label" for="maritalStatus">
                ${fn:escapeXml(jcr:label(props.maritalStatus.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <select name="maritalStatus" id="maritalStatus" ${disabled}>
                <c:forEach items="${propDefs.maritalStatus.valueConstraints}" var="valueOption">
                    <option value="${valueOption}"><fmt:message
                            key="jnt_contact.maritalStatus.${valueOption}"/></option>
                </c:forEach>
            </select>
        </div>
    </div>
</c:if>
<c:if test="${props.hobbies.boolean}">
    <div class="control-group">
        <label class="control-label" for="hobbies">
                ${fn:escapeXml(jcr:label(props.hobbies.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <input type="text" id="hobbies" name="hobbies" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.subject.boolean}">
    <div class="control-group">
        <label class="control-label" for="subject">
                ${fn:escapeXml(jcr:label(props.subject.definition,currentResource.locale))}
        </label>

        <div class="controls">
            <select name="subject" id="subject" ${disabled}>
                <c:forEach items="${propDefs.subject.valueConstraints}" var="valueOption">
                    <option value="${valueOption}"><fmt:message
                            key="jnt_contact.subject.${valueOption}"/></option>
                </c:forEach>
            </select>
        </div>
    </div>
</c:if>
<c:if test="${props.address.boolean}">
    <div class="control-group">
        <label class="control-label" for="address">
                ${fn:escapeXml(jcr:label(props.address.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <input type="text" id="address" name="address" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.city.boolean}">
    <div class="control-group">
        <label class="control-label" for="city">
                ${fn:escapeXml(jcr:label(props.city.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <input type="text" id="city" name="city" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.state.boolean}">
    <div class="control-group">
        <label class="control-label" for="state">
                ${fn:escapeXml(jcr:label(props.state.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <input type="text" id="state" name="state" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.zip.boolean}">
    <div class="control-group">
        <label class="control-label" for="zip">
                ${fn:escapeXml(jcr:label(props.zip.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <input type="text" id="zip" name="zip" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.country.boolean}">
    <div class="control-group">
        <label class="control-label" for="country">
                ${fn:escapeXml(jcr:label(props.country.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <input type="text" id="country" name="country" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.remarks.boolean}">
    <div class="control-group">
        <label class="control-label" for="remarks">
                ${fn:escapeXml(jcr:label(props.remarks.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <input type="text" id="remarks" name="remarks" ${disabled}/>
        </div>
    </div>
</c:if>
<c:if test="${props.captcha.boolean}">
    <div class="control-group">
        <label class="control-label" for="captcha">
                ${fn:escapeXml(jcr:label(props.captcha.definition,currentResource.locale))}
        </label>
        <div class="controls">
            <template:captcha/>
            <input type="text" id="inputCaptcha" name="jcrCaptcha"/>
        </div>
    </div>
</c:if>

<div class="controls-row">
    <div class="controls">
        <input type="submit" tabindex="28" value="<fmt:message key='save'/>" class="btn btn-primary" id="submit" ${disabled}/>
        <input type="reset" tabindex="29" value="<fmt:message key='reset'/>" class="btn" id="reset" ${disabled}/>
    </div>
</div>
</fieldset>
</form>
</template:tokenizedForm>

<c:if test="${jcr:hasPermission(currentNode,'viewContacts')}">
    <template:addResources type="javascript" resources="jquery.min.js"/>
    <fieldset>
        <legend><fmt:message key="label.results"/></legend>

        <div id="results-${currentNode.identifier}">
        </div>
    </fieldset>
    <script type="text/javascript">
        $('#results-${currentNode.identifier}').load('<c:url value="${url.baseLive}${currentNode.path}.bootstrap.results.html.ajax"/>');
    </script>
</c:if>
