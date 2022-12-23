package fr.francis.servlet.controleurs;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.francis.dao.CategorieDao;
import fr.francis.dao.InterfaceCRUD;
import fr.francis.metier.modeles.Categorie;
import fr.francis.metier.modeles.User;

/**
 * Servlet implementation class CategorieServletControleur
 */
@WebServlet("/CategorieServletControleur")
public class CategorieServletControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action ="";
	private List<Categorie> listeCat;
	
	private InterfaceCRUD<Categorie> catDao;
       
    public CategorieServletControleur() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		this.catDao = new CategorieDao();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("userConnect")!=null) {
				
				User  user = (User) request.getSession().getAttribute("userConnect");	
				
				if(user.getRole().equals("admin")) {
					//cas ou il est admin
					 if(request.getParameter("action") != null  ) {					 	
					 	this.action = request.getParameter("action");					
							 switch (this.action){
								case "delete": {
										int id =Integer.parseInt( request.getParameter("id"));
										this.catDao.delete(new Categorie(id,""));
										this.display(request, response);
										break;
								}
								case "detail": {
										int id =Integer.parseInt( request.getParameter("id"));
										
										Categorie cat = this.catDao.findOneById(new Categorie(id,""));
										if(cat.getIdCat()!=0) {
											request.setAttribute("uneCat", cat);
											request.getRequestDispatcher("CategorieDetailVue.jsp").forward(request, response);
										}
										break;
								}
								case "insert": {
									request.getRequestDispatcher("CategorieInsertVue.jsp").forward(request, response);
									break;
								}
								case "update": {
									int id =Integer.parseInt( request.getParameter("id"));
									
									Categorie cat = this.catDao.findOneById(new Categorie(id,""));
									
									if(cat.getIdCat()!=0) {
										request.setAttribute("uneCat", cat);
										request.getRequestDispatcher("CategorieUpdateVue.jsp").forward(request, response);
									}
									break;
								}			
							}	 	
					 }else {
						 //cas ou la variable action est égale à null
						  this.display(request, response);
					 }		
				}else {
					//cas ou il n'est pas admin
					response.sendRedirect("ProduitServlet");
				}		
			}
		//fin du switch case		 
		 }catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	protected void display(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException,Exception  {
		this.listeCat = this.catDao.findAll();
		request.setAttribute("listeCat", this.listeCat);
		request.getRequestDispatcher("CategorieVue2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 if(request.getParameter("action") != null ) {		 	
			 try {		 
				 	this.action = request.getParameter("action");
				 	String nomCategorie = request.getParameter("txtNomCat");		 
				
					if(this.action.equals("insert")) {
					
						this.catDao.insert(new Categorie(0,nomCategorie));
						
					}else if(this.action.equals("update")) {
						
						int idCategorie = Integer.parseInt(request.getParameter("txtIdCat"));	
						
						this.catDao.update(new Categorie(idCategorie,nomCategorie));
					}
					this.display(request, response);
			 }catch (Exception e) {
				 System.out.println("Erreur " + e.getMessage());
			}			
		 }else {
			 doGet(request, response);
		 }
	}
}
