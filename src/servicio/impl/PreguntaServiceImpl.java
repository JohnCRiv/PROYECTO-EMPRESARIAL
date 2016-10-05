package servicio.impl;

import bean.Pregunta;
import dao.PreguntaDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.PreguntaService;
import util.Constantes;

public class PreguntaServiceImpl extends GenericoServiceImpl<Pregunta> implements PreguntaService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private PreguntaDao dao = factory.getPreguntaDAO();
	private static PreguntaServiceImpl service;
	
	private PreguntaServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static PreguntaServiceImpl getInstance() {
		if(service == null) 
			service = new PreguntaServiceImpl();
		
		return service;
	}
	
}
