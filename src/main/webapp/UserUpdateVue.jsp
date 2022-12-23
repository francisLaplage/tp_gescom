<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Inscription</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav>
				<%@ include file="Menu.jsp" %>
			</nav>
			<h2 class="h2  mt-3 mb-3">INSCRIPTION D'UN NOUVEAU USER</h2>
			
		    <form  method="POST" action="UserServlet?action=update" class="form-inline justify-content-center">
		            <fieldset>		
		            
		              <div class="form-group">
		                <label for="idUser" class="col-form-label">ID: </label>
		                <div class="col-sm-10">
		                  <input type="text" readonly value="${unUser.idUser }" required class="form-control" id="idUser" name="idUser" >
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="nomUser" class="col-form-label">NOM: </label>
		                <div class="col-sm-10">
		                  <input type="text" value="${unUser.nomUser }"  required class="form-control" id="nomUser" name="nomUser" >
		                </div>
		              </div>
		              
		             <div class="form-group">
		                <label for="login" class="col-form-label">Login:</label>
		                <div class="col-sm-10">
		                  <input type="email" value="${unUser.login}"   required class="form-control" id="login" name="login" >
		                </div>
		              </div>
		             <div class="form-group">
		                <label for="password" class="col-form-label">Password</label>
		                <div class="col-sm-10">
		                  <input type="password" value="Test1234"  required class="form-control" id="password" name="password" >
		                </div>
		              </div>
		           <c:if test="${ !empty sessionScope.userConnect &&  sessionScope.userConnect.role =='admin'}">
					   <div class="form-group">
					      <label for="role" class="form-label mt-4">Rôle:</label>
					      <select class="form-select" id="role" name="role">				      			       			        
					        		<option value="user"  
										<c:if test="${unUser.role =='user'}">
											selected
										</c:if>
									> user</option>
								<option value="admin" 
									<c:if test="${unUser.role =='admin'}">
								 		selected
								 	</c:if>
								 > admin </option>
					      </select>
					    </div>						    
					</c:if>	              
		              <button type="submit" class="btn btn-primary mt-3">Update User</button>
		         </fieldset>
		    </form>			
		</div>	
	</body>
</html>