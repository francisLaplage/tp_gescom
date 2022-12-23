package fr.francis.servlet.controleurs;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.francis.dao.UserDao;
import fr.francis.metier.modeles.Panier;
import fr.francis.metier.modeles.User;
import fr.francis.services.PanierService;


@WebServlet("/ConnexionServlet")
public class ConnexionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action="" ;
	private UserDao userDao;
	private Panier panier;
	private PanierService panierServive;
       
    public ConnexionServlet() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
		this.userDao = new UserDao();
		this.panierServive = new PanierService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		 try {
			 
			 	if(request.getParameter("action") != null ) {		 	
		
				 	this.action = request.getParameter("action");
				 	
				 	if(this.action.equals("deconnexion")) {
				 		request.getSession().removeAttribute("userConnect");
				 		request.getRequestDispatcher("ConnexionVue.jsp").forward(request, response);
				 	}		 	
			 	}else {
			 		request.getRequestDispatcher("ConnexionVue.jsp").forward(request, response);
			 	}
			 			 	
		 }catch (Exception e) {
	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {			 
			 	if(request.getParameter("action") != null ) {		 	
		
				 	this.action = request.getParameter("action");
				 	String login = request.getParameter("login");
				 	String password = request.getParameter("password");
				 	
					 if(this.action.equals("connexion")) {
						 User user = this.userDao.authentification(new User(login,password));					 
						 // test de la connexion
						 if(user != null) {
							 //stocke les informations de connexion
							 HttpSession session = request.getSession();
							 session.setAttribute("userConnect",user);
							 
							 // création ou récupération du panier utilisateur
							 String d = new Date().toString();
							 System.out.println("dateJour : " +  d + " idUser = " + user.getIdUser());
							 this.panier = this.panierServive.creerPanier(new Panier(0,user.getIdUser(),d));
							 
							 System.out.println("Paneir = " + this.panier);
							 
							 // On stocke le panier dans la variable de session
							  session.setAttribute("panier",this.panier);
							 
							 //Redirection
							 response.sendRedirect("ProduitServlet");						 
						 }else {
							 response.sendRedirect("ConnexionVue.jsp");
						 }			 
					 }else if(this.action.equals("inscription")) {
						 
					 }					 	
			 	}
		 }catch (Exception e) {
			// TODO: handle exception
		}
	}

}
