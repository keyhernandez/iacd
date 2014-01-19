<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<html>
  <head>
    <meta name="layout" content="main">
    <title><g:if test="${params.q && params.q?.trim() != ''}">${params.q} - </g:if>Buscar</title>

    <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("q").focus();
        }
    </script>
  </head>
  <body onload="focusQueryInput();">

 &nbsp;
 <strong><div class="head">Resultados</div></strong> <br>
  <g:set var="haveQuery" value="${params.q?.trim()}" />
  <g:set var="haveResults" value="${searchResult?.results}" />

  <span> &nbsp;
    <br>
    <g:if test="${haveQuery && haveResults}">
      Mostrando <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> de <strong>${searchResult.total}</strong>
      resultados para <strong>${params.q}</strong>

    </g:if>
    <g:else>
      &nbsp;
    </g:else>
  </span>


  <g:if test="${haveQuery && !haveResults && !parseException}">
    <p>No se encontraron resultados para la busqueda de - <strong>${params.q}</strong></p>

  </g:if>

  <g:if test="${searchResult?.suggestedQuery}">
    <p>Did you mean <g:link controller="empresa" action="search" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
</g:if>


<table width="500" align="center">
  <tbody>
  <g:if test="${haveResults}">
    <div class="list">
      <g:each var="result" in="${searchResult.results}" status="index">
        <tr class="${(index % 2) == 0 ? 'even' : 'odd'}">

          <td >
        <g:link action="show" id="${result.id}">
${fieldValue(bean: result, field: "nombre")}
        </g:link>
        </td>
        </tr>
      </g:each>
    </div>
    </tbody>
</table>

<div>
  <div class="paging">
    <g:if test="${haveResults}">
      Pág.:
      <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
      <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
      <g:else><g:paginate controller="empresa" action="search" params="[q: params.q]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
    </g:if>
  </div>
</div>

</g:if>

</div>

</body>
</html>
