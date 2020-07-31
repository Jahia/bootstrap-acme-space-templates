<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="css" resources="advancedsearchform.css"/>

<jcr:nodeProperty name="jcr:title" node="${currentNode}" var="title"/>
<template:addResources>
    <script type="text/javascript">
        function toggleSearchMode(field) {
            if (field.type == 'checkbox') {
                if (field.name.indexOf('siteContent') != -1) {
                    document.getElementById('search-pages-criteria').style.display = field.checked ? '' : 'none';
                }
                if (field.name.indexOf('files') != -1) {
                    document.getElementById('search-documents-criteria').style.display = field.checked ? '' : 'none';
                }
            } else {
                var o, i = 0;
                while (o = field.options[i++]) {
                    if (o.value == 'siteContent') {
                        document.getElementById('search-pages-criteria').style.display = o.selected ? '' : 'none';
                    }
                    if (o.value == 'files') {
                        document.getElementById('search-documents-criteria').style.display = o.selected ? '' : 'none';
                    }
                }
            }
        }
        $(document).ready(function () {
            $('#advancedSearch').hide();

            $('#BtToggleSearch').click(function () {
                $('#advancedSearch').slideToggle("slow");
            });
        })
    </script>
</template:addResources>

<c:choose>
    <c:when test="${not empty title.string}">
        <h3>${fn:escapeXml(title.string)}&nbsp;<a class="btn btn-small btn-info" href="#" id="BtToggleSearch"><i
                class="icon-search"></i></a></h3>
    </c:when>
    <c:otherwise>
        <a class="btn btn-small btn-info" href="#" id="BtToggleSearch"><i class="icon-search"></i></a>
    </c:otherwise>
</c:choose>


<div id="advancedSearch">
    <c:url value='${url.base}${renderContext.mainResource.node.path}.html' var="searchUrl"/>
    <s:form id="advancedSearchForm" name="advancedSearchForm" class="form-horizontal" method="post" action="${searchUrl}">

        <fieldset>
            <legend><fmt:message key="search.advancedSearch.criteria.text.title"/></legend>
            <div class="control-group">
                <label class="control-label" for="searchTerm"><fmt:message key="search"/></label>

                <div class="controls">
                    <s:termMatch selectionOptions="all_words,exact_phrase,any_word,as_is"/>&nbsp;<s:term
                        id="searchTerm"/>
                </div>
                <label class="control-label"><fmt:message key="searchForm.term.searchIn"/></label>

                <div class="controls">
                    <s:termFields id="searchFields" onchange="toggleSearchMode(this)"/>
                </div>
            </div>
        </fieldset>

        <fieldset>

            <legend><fmt:message key="search.advancedSearch.criteria.authorAndDate.title"/></legend>
            <div class="control-group">
                <label class="control-label" for="searchCreatedBy">
                    <fmt:message key="search.advancedSearch.criteria.authorAndDate.createdBy"/>
                </label>

                <div class="controls">
                    <s:createdBy id="searchCreatedBy"/>
                </div>
                <label class="control-label" for="searchCreated">
                    <fmt:message key="search.advancedSearch.criteria.authorAndDate.created"/>
                </label>

                <div class="controls">
                    <s:created id="searchCreated"/>
                </div>
                <label class="control-label" for="searchLastModifiedBy">
                    <fmt:message key="search.advancedSearch.criteria.authorAndDate.modifiedBy"/>
                </label>

                <div class="controls">
                    <s:lastModifiedBy id="searchLastModifiedBy"/>
                </div>
                <label class="control-label" for="searchLastModified">
                    <fmt:message key="search.advancedSearch.criteria.authorAndDate.modified"/>
                </label>

                <div class="controls">
                    <s:lastModified id="searchLastModified"/>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend><fmt:message key="search.advancedSearch.criteria.miscellanea.title"/></legend>
            <div class="control-group">
                <label class="control-label" for="searchSite">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.site"/>
                </label>

                <div class="controls">
                    <s:site id="searchSite" includeReferencesFrom="systemsite"/>
                </div>

                <label class="control-label" for="searchLanguage">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.language"/>
                </label>

                <div class="controls">
                    <s:language id="searchLanguage"/>
                </div>
            </div>
            <c:set var="searchInFieldkey" value="src_terms[0].fields.custom"/>
            <c:set var="searchInFilesKey" value="src_terms[0].fields.files"/>
            <c:set var="searchInSiteContentKey" value="src_terms[0].fields.siteContent"/>
            <c:set var="pValues" value="${fn:join(paramValues[searchInFieldkey], ',')}"/>
            <c:set var="pFilesValue" value="${param[searchInFilesKey]}"/>
            <c:set var="pSiteContentValue" value="${param[searchInSiteContentKey]}"/>
            <div class="control-group"
                 id="search-pages-criteria" ${fn:contains(pValues, 'siteContent') || pSiteContentValue == 'true' ? '' : 'style="display:none"'}>
                <label class="control-label" for="searchPagePath">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.pagePath"/>
                </label>
                <s:pagePath id="searchPagePath"/>
            </div>
            <div class="control-group"
                 id="search-documents-criteria" ${fn:contains(pValues, 'fileContent') or fn:contains(pValues, 'files') or pFilesValue == 'true' ? '' : 'style="display:none"'}>
                <label class="control-label" for="searchFileType">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.fileType"/>
                </label>

                <div class="controls">
                    <s:fileType id="searchFileType"/>
                </div>
                <label class="control-label" for="searchFilePath">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.location"/>
                </label>

                <div class="controls">
                    <s:filePath id="searchFilePath"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="searchResultsPerPage">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.itemsPerPage"/>
                </label>

                <div class="controls">
                    <s:itemsPerPage id="searchResultsPerPage"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="searchOrderBy">
                    <fmt:message key="search.advancedSearch.criteria.miscellanea.sortBy"/>
                </label>

                <div class="controls">
                    <s:orderBy id="searchOrderBy"/>
                </div>
            </div>                       
        </fieldset>
        <div class="controls">
            <input type="submit" name="search" class="btn btn-primary btn-small"
                   value="<fmt:message key='search.advancedSearch.submit'/>"/>
        </div>
    </s:form>
</div>
