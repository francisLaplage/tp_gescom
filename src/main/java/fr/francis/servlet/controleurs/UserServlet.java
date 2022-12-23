package fr.francis.servlet.controleurs;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.francis.dao.UserDao;
import fr.francis.metier.modeles.Categorie;
import fr.francis.metier.modeles.Panier;
import fr.francis.metier.modeles.PanierProduit;
import fr.francis.metier.modeles.Produit;
import fr.francis.metier.modeles.User;
import fr.francis.services.PanierService;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action ="";
	private UserDao userDao;
	private PanierService panierService;
	
	private Panier panierUser;
	private int idProd;
       
	public void init(ServletConfig config) throws ServletException {
		this.userDao = new UserDao();
		this.panierService = new PanierService();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try {		 		
			 	if(request.getParameter("action") != null ) {		 		
				 	this.action = request.getParameter("action");
				 	
				 	if(action.equals("delete")) {	
				 		
				 		int idUser = Integer.parseInt(request.getParameter("id"));			 		
      			 		this.userDao.delete(new User(idUser));
				 		
				 		request.setAttribute("listeUsers", this.userDao.findAll());
				 		request.getRequestDispatcher("UsersVue.jsp").forward(request, response);
				 		
				 	}else if(action.equals("update")) {
				 		int idUser = Integer.parseInt(request.getParameter("id"));
				 		User user = this.userDao.findOneById(new User(idUser));
				 		request.setAttribute("unUser", user);
				 		request.getRequestDispatcher("UserUpdateVue.jsp").forward(request, response);
				 		
				 	}else if(action.equals("detail")) {
				 		
				 		request.getRequestDispatcher("UserDetailVue.jsp").forward(request, response);
				 		
				 	}else if(action.equals("insert")) {		 		
				 		request.getRequestDispatcher("UserIncriptionVue.jsp").forward(request, response);
				 	}else if(action.equals("profil")) {			 		
				 		request.getRequestDispatcher("UserProfilVue.jsp").forward(request, response);				 		
				 	}else if(action.equals("reinitPwd")) {
				 		request.getRequestDispatcher("UserReInitPwdVue.jsp").forward(request, response);
				 	}else if(action.equals("panier")) {
				 		
				 		this.configParam(request, response); 
				 		this.display(request, response);
				 		
				 	}else if(action.equals("panierIinc")) {
				 		//récupération du panier du user
				 		this.idProd = Integer.parseInt(request.getParameter("id"));
				 		this.configParam(request, response);
				 		
				 		this.panierService.ajoutProdAuPanier(new PanierProduit(panierUser.getIdPanier(),
				 				                              new Produit(this.idProd),1));
				 			this.display(request, response);
				 		
				 	}else if(action.equals("panierDesc")) {
				 		//récupération du panier du user
				 		this.idProd = Integer.parseInt(request.getParameter("id"));
				 		this.configParam(request, response);
				 		this.panierService.supprimerProdDuPanier((new PanierProduit(panierUser.getIdPanier(),
				 				                              new Produit(this.idProd),1)));	
				 		//récupération de la liste des produit du panier
				 		this.display(request, response);
				 	}
				 	
			 	}else {
			 		response.sendRedirect("ConnexionVue.jsp");
			 	}
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void configParam(HttpServletRequest request,HttpServletResponse response) throws Exception {	
		this.panierUser = (Panier) request.getSession().getAttribute("panier");
		//this.idProd =( Integer.parseInt(request.getParameter("id"));
		
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void display(HttpServletRequest request,HttpServletResponse response) throws Exception {	
		request.setAttribute("ptt", this.panierService.calculPrixTotalDuPanier(panierUser.getIdPanier()));
 	    request.setAttribute("contenuePanier", this.panierService.afficherPanier(panierUser.getIdPanier()));
 		request.getRequestDispatcher("PanierVue.jsp").forward(request, response);
	}
	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		 try {		 		
			 	if(request.getParameter("action") != null ) {		 		
				 	this.action = request.getParameter("action");
				 	
				 	String nomUser = request.getParameter("nomUser");
				 	String login = request.getParameter("login");
				 	String password = request.getParameter("password");
				 	String role = (request.getParameter("role") != null ) ? request.getParameter("role") : "user";
				 	
				 	if(this.action.equals("insert")) {
				 		this.userDao.insert(new User(nomUser,login,password,role));	
				 	}else if(action.equals("delete")) {		 		
						/*
						 * int idUser = Integer.parseInt(request.getParameter("id"));
						 * this.userDao.delete(new User(idUser)); response.sendRedirect("index.jsp");
						 */
				 		
				 	}else if(this.action.equals("update")) {
				 		
				 		int idUser = Integer.parseInt(request.getParameter("idUser"));
				 		
				 		this.userDao.update(new User(idUser,nomUser,login,password,role));
				 		
				 		request.setAttribute("listeUsers", this.userDao.findAll());
				 		request.getRequestDispatcher("UsersVue.jsp").forward(request, response);
				 		
				 	}else if(this.action.equals("reinitPwd")) {
				 		
				 		//1-	Vérification des données
						 	String oldPwd = request.getParameter("oldPassword");
						 	String newPwd = request.getParameter("newPassword");
						 	String confirmPwd = request.getParameter("confirmPassword");
						 	User userConnect = (User) request.getSession().getAttribute("userConnect");
						 	
						 if(userConnect.getPassword().equals(oldPwd) && newPwd.equals(confirmPwd)) {
							 //2-	On met le mot de passe à jour
							 	this.userDao.reInitPassord(new User(userConnect.getLogin(),newPwd));
							 	response.sendRedirect("ConnexionVue.jsp");
							 
						 }else {
							 //3-	Wrong parameter
							 request.setAttribute("msg", "Vérifier vôtre mot de passe");
							 request.getRequestDispatcher("UserReInitPwdVue.jsp").forward(request, response);
						 }
				 	}	
			 	}else {
			 		response.sendRedirect("ConnexionVue.jsp"); 
			 	}				
			}catch (Exception e) {
				System.out.println("Error : " + e.getMessage());
			}
	}

}
