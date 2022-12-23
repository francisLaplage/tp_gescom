package fr.francis.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.francis.dao.ConnexionBD;
import fr.francis.dao.ProduitDao;
import fr.francis.metier.modeles.Panier;
import fr.francis.metier.modeles.PanierProduit;
import fr.francis.metier.modeles.Produit;

public class PanierService {
	private Connection conn;
	private Statement stm ;
	private ResultSet rs;
	private PreparedStatement ps;
	private ProduitDao prodDao;
	private double prix;
	
	public PanierService() {
		this.conn = ConnexionBD.getObjetDeConnexion();
		this.prodDao = new ProduitDao();
	}
	/**
	 * @param t
	 * @throws Exception
	 */
	public Panier creerPanier(Panier t) throws Exception {
		Panier newPanier = new Panier();
		//Ici On recheche si l'utilisateur à déjà un panier
		this.ps = this.conn.prepareStatement("SELECT * from panier WHERE idUser = ?");	
		this.ps.setInt(1, t.getIdUser());
		this.rs = this.ps.executeQuery();
		
		if(this.rs.next()) {
			newPanier.setIdPanier(this.rs.getInt("idPanier"));
			newPanier.setIdUser(this.rs.getInt("idUser"));
			newPanier.setDate(this.rs.getString("date"));
		}else {		
			this.ps = this.conn.prepareStatement("INSERT INTO panier VALUES(default,?,?)",Statement.RETURN_GENERATED_KEYS);	
			this.ps.setInt(1, t.getIdUser());
			this.ps.setString(2, t.getDate());
			this.ps.executeUpdate();			
			this.rs=this.ps.getGeneratedKeys();
			this.rs.next();
			newPanier = this.getPanier(this.rs.getInt(1));				
		}		
		return newPanier;
	}
	/**
	 * 
	 * @param idPanier
	 * @return
	 * @throws Exception
	 */
	public Panier getPanier(int idPanier) throws Exception {
		Panier panier=null;
		this.ps = this.conn.prepareStatement("SELECT * from panier WHERE idPanier = ?");	
		this.ps.setInt(1,idPanier);
		this.rs = this.ps.executeQuery();
		
		if(this.rs.next()) {
			panier = new Panier();
			panier.setIdPanier(this.rs.getInt("idPanier"));
			panier.setIdUser(this.rs.getInt("idUser"));
			panier.setDate(this.rs.getString("date"));
		}	
		return panier;
	}
	/**
	 * @param t
	 * @throws Exception
	 */
	public void ajoutProdAuPanier(PanierProduit t) throws Exception{
		//Ici On rechecher l'existence du produit dans le panier ou pas
		this.ps = this.conn.prepareStatement("SELECT * from panier_produit WHERE idPanier = ? AND idProd=?");	
		this.ps.setInt(1, t.getIdPanier());
		this.ps.setInt(2, t.getProd().getId());	
		this.rs = this.ps.executeQuery();
		
		if(this.rs.next()) {
			//Cas ou le produit existe dans le panier
			this.ps = this.conn.prepareStatement("UPDATE panier_produit set quantite = ? WHERE idPanier = ? AND idProd=?");	
			this.ps.setInt(1, this.rs.getInt("quantite")+t.getQuantite());
			this.ps.setInt(2,t.getIdPanier());
			this.ps.setInt(3, t.getProd().getId());
			this.ps.executeUpdate();
		}else {
			//Cas ou le produit n'existe pas dans le panier
			this.ps = this.conn.prepareStatement("INSERT INTO panier_produit VALUES(?,?,?)");	
			this.ps.setInt(1, t.getIdPanier());
			this.ps.setInt(2, t.getProd().getId());
			this.ps.setInt(3, t.getQuantite());
			this.ps.executeUpdate();
		}
	}
	/**
	 * 
	 * @param t
	 * @throws Exception
	 */
	public void supprimerProdDuPanier(PanierProduit t) throws Exception{
		//Ici On rechecher l'existence du produit dans le panier ou pas
				this.ps = this.conn.prepareStatement("SELECT * from panier_produit WHERE idPanier = ? AND idProd=?");	
				this.ps.setInt(1, t.getIdPanier());
				this.ps.setInt(2, t.getProd().getId());	
				this.rs = this.ps.executeQuery();
				
				if(this.rs.next()) {
					//Récupération de la quantité du prod dans le panier
					int qte = this.rs.getInt("quantite") - t.getQuantite();			
					if(qte > 0) {
						//Mise à jour de la quentité (décrémentation de la quantité)
						this.ps = this.conn.prepareStatement("UPDATE panier_produit set quantite = ? WHERE idPanier = ? AND idProd=?");	
						this.ps.setInt(1, qte);
						this.ps.setInt(2,t.getIdPanier());
						this.ps.setInt(3, t.getProd().getId());
						this.ps.executeUpdate();
					}else {
						//Supprimer le produit du panier
						this.ps = this.conn.prepareStatement("DELETE FROM panier_produit  WHERE idPanier = ? AND idProd=?");	
						this.ps.setInt(1,t.getIdPanier());
						this.ps.setInt(2, t.getProd().getId());
						this.ps.executeUpdate();
					}
				}else {
					throw new Exception("ce n'existe pas dans le panier");
				}
	}
	/**
	 * 
	 * @param idPanier
	 * @return
	 * @throws Exception
	 */
	public List<PanierProduit> afficherPanier(int idPanier) throws Exception{

		List<PanierProduit> listedeProduitDsPanier = new ArrayList<PanierProduit>();
	
			this.stm = this.conn.createStatement();
		
			this.rs = stm.executeQuery("SELECT * FROM panier_produit as panier"
					                 +"	 INNER JOIN produit  as prod"
					                 +"    	ON panier.idProd = prod.id"
					                 +"					WHERE idPanier =" + idPanier);

			while(this.rs.next()) {		
				
				Produit prod = this.prodDao.findOneById(new Produit(this.rs.getInt("idProd")));
				
				listedeProduitDsPanier.add(new PanierProduit(this.rs.getInt("idPanier"),
						prod,this.rs.getInt("quantite")));
			}
			return listedeProduitDsPanier;
	}
	/**
	 * @param idPanier
	 * @return
	 * @throws Exception
	 */
	public double calculPrixTotalDuPanier(int idPanier) throws Exception{
		
		this.prix = 0;
		
		this.afficherPanier(idPanier).forEach((prod)->{
			
			this.prix = this.prix + (prod.getQuantite()*prod.getProd().getPrix());
			
		});	
		return this.prix;
	}
}
