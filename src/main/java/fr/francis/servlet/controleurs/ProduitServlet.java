package fr.francis.servlet.controleurs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.francis.dao.CategorieDao;
import fr.francis.dao.ProduitDao;
import fr.francis.dao.UserDao;
import fr.francis.metier.modeles.Categorie;
import fr.francis.metier.modeles.Produit;

/**
 * Servlet implementation class ProduitServlet
 */
@WebServlet("/ProduitServlet")
public class ProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProduitDao prodDao;
    private CategorieDao catDao;
    private UserDao userDao;
    private String action="";
    List<Produit> listeProd;

    public ProduitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		this.prodDao = new ProduitDao();
		this.listeProd = new ArrayList<Produit>();
		this.catDao = new CategorieDao();
		this.userDao = new UserDao();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
   try {	
		
		 if(request.getParameter("action") != null ) {
			 	
			 	this.action = request.getParameter("action");
			 	//int id =Integer.parseInt( request.getParameter("id"));
			 	request.setAttribute("listeCat",this.catDao.findAll());
				 switch (this.action){
				 	
				 	case "delete" :{
						int id =Integer.parseInt( request.getParameter("id"));
						this.prodDao.delete(new Produit(id));
						this.display(request, response);
				 		break;
				 	}
				 	case "update":{
						int id =Integer.parseInt( request.getParameter("id"));					
						Produit prod = this.prodDao.findOneById(new Produit(id));						
						if(prod.getId()!=0) {						
							request.setAttribute("unProd",prod);
							request.getRequestDispatcher("ProduitUpdateVue.jsp").forward(request, response);
						}
				 		break;
				 	}
				 	case "insert":
				 		//request.setAttribute("listeCat",this.catDao.findAll());
				 		request.getRequestDispatcher("ProduitInsertVue.jsp").forward(request, response);
				 		break;
				 	case "detail":{
						int id =Integer.parseInt( request.getParameter("id"));
						
						Produit prod = this.prodDao.findOneById(new Produit(id));	
						if(prod.getId()!=0) {
							request.setAttribute("unProd",prod);
							request.getRequestDispatcher("ProduitDetailVue.jsp").forward(request, response);
						}
				 		break;
				 	}
				 	case "liste":{
						this.listeProd = this.prodDao.findAll();
						request.setAttribute("listeProd", this.listeProd);
						request.getRequestDispatcher("ProduitVue.jsp").forward(request, response);
						break;
				 	}
				 	case "gesUsers" :{
						request.setAttribute("listeUsers", this.userDao.findAll());
						request.getRequestDispatcher("UsersVue.jsp").forward(request, response);		 		
				 		break;
				 	}
				 }
		
		   }else {
			   display(request, response);
		   }
		 
	 }catch (Exception e) {
	   System.out.println("Error " + e.getMessage());
	}	 
		 
		
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws Exception
	 */
	protected void display(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException,Exception  {
		this.listeProd = this.prodDao.findAll();
		request.setAttribute("listeProd", this.listeProd);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 try {
			 		
			 	if(request.getParameter("action") != null ) {		 	
		
				 	this.action = request.getParameter("action");
				 	String nomProd = request.getParameter("nomProd");
				 	String designation = request.getParameter("designation");
				 	double prix = Double.parseDouble( request.getParameter("prix"));
				 	int stock = Integer.parseInt(request.getParameter("stock"));
				 	String image = request.getParameter("image");
				 	int idCat = Integer.parseInt(request.getParameter("categorie"));
				 	
				 	if(action.equals("insert")) {
				 		this.prodDao.insert(new Produit(0,designation,nomProd,prix,stock,image,new Categorie(idCat)));	
				 	}else if(action.equals("update")) {
				 		int idProd = Integer.parseInt(request.getParameter("idProd"));
				 		this.prodDao.update(new Produit(idProd,designation,nomProd,prix,stock,image,new Categorie(idCat)));			 		
				 	}
				 	display(request, response);
			 	}else {
			 		display(request, response);
			 	}
				 	
			}catch (Exception e) {
				
			}
				 
	}

}
