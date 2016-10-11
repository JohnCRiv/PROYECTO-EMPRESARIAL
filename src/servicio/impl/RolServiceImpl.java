package servicio.impl;

import bean.Rol;
import dao.RolDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.RolService;
import util.Constantes;

public class RolServiceImpl extends GenericoServiceImpl<Rol> implements RolService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private RolDao dao = factory.getRolDAO();
	private static RolServiceImpl service;
	
	private RolServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static RolServiceImpl getInstance() {
		if(service == null) 
			service = new RolServiceImpl();
		
		return service;
	}

	@Override
	public Rol obtenerRolMaxID() {
		return dao.obtenerRolMaxID();
	}
	
}
