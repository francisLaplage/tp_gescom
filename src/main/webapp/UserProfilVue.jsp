<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Profil</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
	<div class="container">
		<nav class="mt-3">
			<%@ include file="Menu.jsp" %>
		</nav>
		<div class="card border-primary mt-5 mb-3 w-50 mx-auto my-5" >
		  <div class="card-header text-center">Informations de l'Utilisateur </div>
		  <div class="card-body">
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">Nom</th>
				      <th scope="col">Login</th>
				      <th scope="col">Password</th>
				      <th scope="col" colspan="2">Actions</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr class="table-active">
				      <td> ${ sessionScope.userConnect.nomUser} </td>
				      <td> ${ sessionScope.userConnect.login }</td>
				      <td> <input type="password" class="form-control" value="${sessionScope.userConnect.password}"></td>
				       <td> <a href="#">Modifiez Vos Informations</a></td>
				       <td> <a href="UserServlet?action=reinitPwd">Réinitialisez Vôtre Mot de Passe</a></td>
				    </tr>
				  </tbody>
				</table> 
		  </div>
		</div>
	</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>