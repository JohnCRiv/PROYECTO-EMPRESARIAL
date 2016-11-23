package servicio.impl;

import java.util.List;

import bean.ExamenPregunta;
import dao.ExamenPreguntaDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.ExamenPreguntaService;
import util.Constantes;

public class ExamenPreguntaServiceImpl extends GenericoServiceImpl<ExamenPregunta> implements ExamenPreguntaService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private ExamenPreguntaDao dao = factory.getExamenPreguntaDAO();
	private static ExamenPreguntaServiceImpl service;
	
	private ExamenPreguntaServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static ExamenPreguntaServiceImpl getInstance() {
		if(service == null) 
			service = new ExamenPreguntaServiceImpl();
		
		return service;
	}

	@Override
	public List<ExamenPregunta> listarPreguntas(Integer idcurso, Integer idexamen) {
		return dao.listarPreguntas(idcurso, idexamen);
	}
	
}
