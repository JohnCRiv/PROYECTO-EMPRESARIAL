package servicio.impl;

import java.util.List;

import bean.PreguntaOpcion;
import dao.PreguntaOpcionDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.PreguntaOpcionService;
import util.Constantes;

public class PreguntaOpcionServiceImpl extends GenericoServiceImpl<PreguntaOpcion> implements PreguntaOpcionService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private PreguntaOpcionDao dao = factory.getPreguntaOpcionDAO();
	private static PreguntaOpcionServiceImpl service;
	
	private PreguntaOpcionServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static PreguntaOpcionServiceImpl getInstance() {
		if(service == null) 
			service = new PreguntaOpcionServiceImpl();
		
		return service;
	}

	@Override
	public List<PreguntaOpcion> listarOpciones(Integer idcurso, Integer idpregunta) {
		return dao.listarOpciones(idcurso, idpregunta);
	}
	
}
