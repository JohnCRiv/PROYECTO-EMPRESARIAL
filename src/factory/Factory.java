package factory;

import dao.EnlaceDao;
import dao.RolDao;
import dao.RolEnlaceDao;
import dao.TipoDocumentoDao;
import dao.UsuarioDao;

/**
 * <strong>Factory</strong> <br>
 * Clase Fábrica DAO
 * 
 * @author CruzadoJ
 *
 */
public abstract class Factory {

	public static final String MYSQL = "MYSQL";
	public static final String SQLSERVER = "SQLSERVER";
	public static final String ORACLE = "ORACLE";
	
	public abstract TipoDocumentoDao getTipoDocumentoDAO();
	public abstract RolDao getRolDAO();
	public abstract UsuarioDao getUsuarioDAO();
	public abstract EnlaceDao getEnlaceDAO();
	public abstract RolEnlaceDao getRolEnlaceDAO();

	public static Factory getFactory(String database) {
		
		switch (database) {
			case MYSQL:
				return new MySqlDAOFactory();
			case SQLSERVER:
				// TODO: return new SqlServerDAOFactory();
			case ORACLE:
				// TODO: return new OracleDAOFactory();
		}

		return null;
	}
}
