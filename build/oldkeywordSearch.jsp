<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
	   <meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/autosuggest.css">
	<link rel="stylesheet" type="text/css" href="css/searchresults.css">
</head>
<body onload="giveSuggestions()">
	<form action="search" accept-charset="utf-8">
		<div id="searchBox">
	    	<input type="text" name="q" id="searchInput" class="searchbar" autocomplete="off" value="${param.q}"/>
	    	<input type="text" id="ghostAhead" class="searchbar" autocomplete="off" tabIndex="-1"/>
		    <input type="submit" value="Search" id="submitButton">
	    	<div id="dropDown"></div>
		</div>
	    <input type="hidden" name="numResultsToSkip" value="0" />
	    <input type="hidden" name="numResultsToReturn" value="20" />
	</form>
	<table>
		<c:forEach items="${results}" var="result">
				<tr>
					<td><a href="item?id=${result.itemId}">${result.name} (${result.itemId})</a></td>
				</tr>
		</c:forEach>
	</table>
	<div class="footer">
		<div class="pagination">
			<c:choose>
				<c:when test="${param.numResultsToSkip eq '0'}"></c:when>
				<c:when test="${param.numResultsToSkip - param.numResultsToReturn <'0'}">
					<a class="prev" href="search?q=${queryURL}&numResultsToSkip=&numResultsToReturn=${param.numResultsToReturn}">&lt; Previous</a>
				</c:when>
				<c:otherwise>
					<a class="prev" href="search?q=${queryURL}&numResultsToSkip=${param.numResultsToSkip-param.numResultsToReturn}&numResultsToReturn=${param.numResultsToReturn}">&lt; Previous</a>
				</c:otherwise>
			</c:choose>
			<c:if test="${fn:length(results) eq param.numResultsToReturn}">
				<a class="next" href="search?q=${queryURL}&numResultsToSkip=${param.numResultsToSkip+param.numResultsToReturn}&numResultsToReturn=${param.numResultsToReturn}">Next &gt;</a>
			</c:if>
		</div>
	</div>
	<script type="text/javascript" src="js/suggestionRetriever.js"></script>
	<script type="text/javascript" src="js/autoSuggestControl.js"></script>
	<script type="text/javascript">
	function giveSuggestions(){
		oAutoSuggestControl = new AutoSuggestControl(document.getElementById("searchInput"), document.getElementById("ghostAhead"), document.getElementById("dropDown"),new SuggestionRetriever());
	}
	</script>
</body>
</html>