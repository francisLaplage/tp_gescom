<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>		
			<p> 15*5  = 	${15 *5} </p>
			
			<p> ${ nom } </p>
			
			<p> ${ empty nom ? "" : nom } </p>
			
			<p> ${ tableaux[2] } </p>
			
			<!--  Test de la JSTL -->
			
			<p> <c:out value="Hello word !"></c:out> </p>
			
			<p> <c:out value=""></c:out> </p>
			
			<!--  Test de la JSTL  : déclaration d'une variable-->
				<c:set var="age" value="15" scope="page"></c:set>
				
			<!--  Test de la JSTL  : afficher une variable-->
				
				<c:out value="${age}"></c:out>
				
			<!--  Test de la JSTL  : Conditions -->
				<c:if test="${age >= 18 }">
					<p> <c:out value="Vous êtes Majeur"></c:out> </p>
				</c:if>
			<!--  Test de la JSTL  : choose == switch cas  -->
				<c:choose>
					<c:when test="${ age < 0 }"> Wrong value </c:when>
					<c:when test="${ age > 0 && age < 18 }"> Vous êtes mineur </c:when>
					<c:when test="${ age >= 18 }"> Vous êtes Majeur </c:when>
					<c:otherwise>Pas définit </c:otherwise>
				</c:choose>
			<!--  Test de la JSTL  : ForEach -->
				<c:forEach var="i" begin="0" end="10" step="1">
					<p> la valeur de i = ${i}  </p>
				</c:forEach>
			<!--  Test de la JSTL  : ForEach -->
			
			<ul>
				<c:forEach var="elt" items="${tableaux}" varStatus="status">
				
					<li>index = ${status.index}   ${elt}  isFirst :  ${status.first}   nombre :  ${status.count}  isLast : ${status.last }</li>
								
				</c:forEach>		
			</ul>
</body>
</html>