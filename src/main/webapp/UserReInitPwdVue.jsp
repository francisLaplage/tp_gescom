<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Connexion</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
	<div class="container">
		<nav>
			<%@ include file="Menu.jsp" %>
		</nav>
		<div class="card border-primary mt-5 mb-3 w-50 mx-auto my-5" >
		  <div class="card-header text-center">Reset Password </div>
		  <div class="card-body">
		  	<form method="POST" action="UserServlet?action=reinitPwd">
  				<fieldset>
  					<div>
  						<span class="text-danger "> ${ !empty msg ? msg : "" }</span>
  					</div>
					<div class="form-group">
				      <label for="oldPassword" class="form-label mt-4">Ancien Password</label>
				      <input type="password" required class="form-control" id="oldPassword" name="oldPassword">
				    </div>
				    <div class="form-group">
				      <label for="newPassword" class="form-label mt-4">Nouveau Password</label>
				      <input type="password"  required  class="form-control" id="newPassword" name="newPassword">
				    </div>
				     <div class="form-group">
				      <label for="confirmPassword" class="form-label mt-4">Confirmez Votre Nouveau Password</label>
				      <input type="password"  required  class="form-control" id="confirmPassword" name="confirmPassword">
				    </div>
					<div class="form-group mt-3">
					   	<button type="submit" class="btn btn-primary">Réinitialisé</button>
   				 		<a href="#" class="link">Mot de passe oublié</a>
					</div>
 		 		</fieldset>
			</form>    
		  </div>
		</div>
	</div>
			<%@ include file="FootConfig.jsp" %>
	</body>
</html>