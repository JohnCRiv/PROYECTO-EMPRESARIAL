package servicio.impl;

import bean.Usuario;
import dao.UsuarioDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.UsuarioService;
import util.Constantes;

public class UsuarioServiceImpl extends GenericoServiceImpl<Usuario> implements UsuarioService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private UsuarioDao dao = factory.getUsuarioDAO();
	private static UsuarioServiceImpl service;
	
	protected UsuarioServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static UsuarioServiceImpl getInstance() {
		if(service == null) 
			service = new UsuarioServiceImpl();
		
		return service;
	}
	
}
