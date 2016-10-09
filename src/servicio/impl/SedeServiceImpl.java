package servicio.impl;

import bean.Sede;
import dao.SedeDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.SedeService;
import util.Constantes;

public class SedeServiceImpl extends GenericoServiceImpl<Sede> implements SedeService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private SedeDao dao = factory.getSedeDAO();
	private static SedeServiceImpl service;
	
	private SedeServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static SedeServiceImpl getInstance() {
		if(service == null) 
			service = new SedeServiceImpl();
		
		return service;
	}
	
}
