<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gestion des Utilisateurs</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav class="mt-3">
				<%@ include file="Menu.jsp" %>
			</nav>	
			<h2 class="h2 mt-3">LISTE DES UTILISATEURS</h2>	
			<a href="UserServlet?action=insert" class="btn btn-success mt-2 mb-2">ADD UTILISATEUR</a>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID: </th>
								<th>NOM: </th>
								<th>LOGIN:</th>
								<th>ROLE:</th>
								<th colspan="3">ACTIONS</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${listeUsers}">
									<tr>									
										<td> ${u.idUser}  </td>
										<td>  ${u.nomUser}</td>
										<td> ${u.login}  </td>
										<td>  ${u.role}</td>						
										<td> <a href="UserServlet?action=delete&id=${u.idUser}" class="btn btn-danger"> DELETE</a> </td>	
										<td>  <a class="btn btn-warning"  href="UserServlet?action=update&id=${u.idUser}" > UPDATE</a> </td>
										<td>  <a href="UserServlet?action=detail&id=${u.idUser}" class="btn btn-secondary"> DETAILS</a> </td>								
									</tr>	
							</c:forEach>					
						</tbody>
					</table>
			</div>		
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>