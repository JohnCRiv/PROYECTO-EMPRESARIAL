package servicio.impl;

import bean.Docente;
import dao.DocenteDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.DocenteService;
import util.Constantes;

public class DocenteServiceImpl extends GenericoServiceImpl<Docente> implements DocenteService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private DocenteDao dao = factory.getDocenteDAO();
	private static DocenteServiceImpl service;
	
	private DocenteServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static DocenteServiceImpl getInstance() {
		if(service == null) 
			service = new DocenteServiceImpl();
		
		return service;
	}
	
}
