package servicio.impl;

import bean.Enlace;
import dao.EnlaceDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.EnlaceService;
import util.Constantes;

public class EnlaceServiceImpl extends GenericoServiceImpl<Enlace> implements EnlaceService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private EnlaceDao dao = factory.getEnlaceDAO();
	private static EnlaceServiceImpl service;
	
	private EnlaceServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static EnlaceServiceImpl getInstance() {
		if(service == null) 
			service = new EnlaceServiceImpl();
		
		return service;
	}
	
}
