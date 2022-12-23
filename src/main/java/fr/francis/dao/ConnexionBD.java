package fr.francis.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnexionBD {
	
	private final String URL ="jdbc:mysql://localhost:3306/gescategorie";
	private final String USER ="root";
	private final String PASSWORD ="";
	
	private static Connection objetDeConnexion;
	
	private ConnexionBD() {
		
			try {
				//Chargement du Driver ou pilote 
				Class.forName("com.mysql.cj.jdbc.Driver");	
				// Initialisation de la connexion
				objetDeConnexion = DriverManager.getConnection(URL, USER, PASSWORD);
				
				System.out.println("Connected !");
				
			}catch (Exception e) {
				
				System.out.println("Erreur : " + e.getMessage());
			}	
	}
	
	public static Connection getObjetDeConnexion() {
		
		if(objetDeConnexion == null) {
	
			new ConnexionBD();
		}
		return objetDeConnexion;
	}
}
