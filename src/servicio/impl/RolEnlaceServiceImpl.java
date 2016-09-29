package servicio.impl;

import bean.RolEnlace;
import dao.RolEnlaceDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.RolEnlaceService;
import util.Constantes;

public class RolEnlaceServiceImpl extends GenericoServiceImpl<RolEnlace> implements RolEnlaceService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private RolEnlaceDao dao = factory.getRolEnlaceDAO();
	private static RolEnlaceServiceImpl service;
	
	private RolEnlaceServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static RolEnlaceServiceImpl getInstance() {
		if(service == null) 
			service = new RolEnlaceServiceImpl();
		
		return service;
	}
	
}
