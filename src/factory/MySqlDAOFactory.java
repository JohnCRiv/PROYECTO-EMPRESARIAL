package factory;

import dao.EnlaceDao;
import dao.RolDao;
import dao.RolEnlaceDao;
import dao.TipoDocumentoDao;
import dao.UsuarioDao;
import dao.impl.EnlaceDaoImpl;
import dao.impl.RolDaoImpl;
import dao.impl.RolEnlaceDaoImpl;
import dao.impl.TipoDocumentoDaoImpl;
import dao.impl.UsuarioDaoImpl;

/**
 * <strong>MySqlDAOFactory</strong> <br>
 * Fábrica de Dao's MySQL
 * 
 * @author CruzadoJ
 */
public class MySqlDAOFactory extends Factory {

	@Override
	public TipoDocumentoDao getTipoDocumentoDAO() {
		return new TipoDocumentoDaoImpl();
	}

	@Override
	public RolDao getRolDAO() {
		return new RolDaoImpl();
	}

	@Override
	public UsuarioDao getUsuarioDAO() {
		return new UsuarioDaoImpl();
	}

	@Override
	public EnlaceDao getEnlaceDAO() {
		return new EnlaceDaoImpl();
	}

	@Override
	public RolEnlaceDao getRolEnlaceDAO() {
		return new RolEnlaceDaoImpl();
	}
	
}
