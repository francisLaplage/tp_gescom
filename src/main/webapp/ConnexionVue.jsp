<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Connexion</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
	<div class="container">
		<div class="card border-primary mt-5 mb-3 w-50 mx-auto my-5" >
		  <div class="card-header text-center">User Login</div>
		  <div class="card-body">
		  	<form method="POST" action="ConnexionServlet?action=connexion">
  				<fieldset>
					<div class="form-group">
				      <label for="login" class="form-label mt-4">Login</label>
				      <input type="email" required class="form-control" id="login" name="login" placeholder="exemple@yahoo.fr">
				    </div>
				    <div class="form-group">
				      <label for="password" class="form-label mt-4">Password</label>
				      <input type="password"  required  class="form-control" id="password" name="password">
				    </div>
					<div class="form-group mt-3">
					   	<button type="submit" class="btn btn-primary">Connexion</button>
   				 		<a href="UserServlet?action=insert" class="link">Inscription</a>
					</div>
 		 		</fieldset>
			</form>    
		  </div>
		</div>
	</div>
	</body>
</html>