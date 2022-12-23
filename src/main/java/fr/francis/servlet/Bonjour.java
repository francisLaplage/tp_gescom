package fr.francis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Bonjour
 */
@WebServlet("/Bonjour")
public class Bonjour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bonjour() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 		request === l'objet req de nodejs
		 * 	    response === l'objet res de nos api rest sur node
		 */
		// TODO Auto-generated method stub
		//response.getWriter().append("Bonjour je passe part la méthode doGet :");
		
		// Dans la réponse nous allons construire une page html
		
		/*
		 * String login = request.getParameter("txtLogin"); String pwd =
		 * request.getParameter("txtPwd");
		 * 
		 * if(login == null) login="";
		 */
		
		/*
		 * response.setContentType("text/html");
		 * 
		 * PrintWriter out = response.getWriter(); out.println("<!DOCTYPE>");
		 * out.println("<html>"); out.println("		<head>");
		 * out.println("				<title>Connexion</title>");
		 * out.println("		</head>"); out.println("		<body>");
		 * out.println("				<form method='POST' action='Bonjour' >");
		 * out.println("					<label for='txtLogin'>Login :<br>"); out.
		 * println("					<input type='text' id='txtLogin' name='txtLogin' value='"
		 * +login +"' > <br>");
		 * 
		 * out.println("					<label for='txtPwd'>Password : <br>"); out.
		 * println("					<input type='password' id='txtPwd' name='txtPwd' > <br>"
		 * );
		 * 
		 * out.
		 * println("					<input type='submit' id='btnConnexion' name='btnConnexion' value='Connexion' > <br> <br>"
		 * );
		 * 
		 * out.println("				</form>");
		 * 
		 * out.println("		</body>"); out.println("</html>");
		 */
		
		// On fait appel à une page jsp existente
		request.getRequestDispatcher("/BonjourVue.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Récupération des paramètres dans l'objet request
			String login = request.getParameter("txtLogin");
			String pwd = request.getParameter("txtPwd");
		
		// Test de connexion
		
			if(login.equals("bart@yahoo.fr") && pwd.equals("Test1234")) {
				response.getWriter().append("Bonjour je passe part la méthode doPost , et vos cordonnées de connexion sont : " + login + " - " + pwd);
			}else {
				doGet(request, response);
			}
		//doGet(request, response);
	}

}
