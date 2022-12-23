package fr.francis.metier.modeles;

public class PanierProduit {
	private int idPanier;
	private Produit prod;
	private int quantite;
	
	public PanierProduit() {

	}

	public PanierProduit(int idPanier, Produit prod, int quantite) {
		this.idPanier = idPanier;
		this.prod = prod;
		this.quantite = quantite;
	}

	public int getIdPanier() {
		return idPanier;
	}

	public void setIdPanier(int idPanier) {
		this.idPanier = idPanier;
	}

	public Produit getProd() {
		return prod;
	}

	public void setProd(Produit prod) {
		this.prod = prod;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	@Override
	public String toString() {
		return "PanierProduit [idPanier=" + idPanier + ", prod=" + prod + ", quantite=" + quantite + "]";
	}
	
}
