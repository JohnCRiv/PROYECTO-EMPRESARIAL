package servicio.impl;

import java.util.List;

import bean.Curso;
import bean.Examen;
import dao.ExamenDao;
import dto.DtoPregunta;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.ExamenService;
import util.Constantes;

public class ExamenServiceImpl extends GenericoServiceImpl<Examen> implements ExamenService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private ExamenDao dao = factory.getExamenDAO();
	private static ExamenServiceImpl service;
	
	private ExamenServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static ExamenServiceImpl getInstance() {
		if(service == null) 
			service = new ExamenServiceImpl();
		
		return service;
	}
	
	@Override
	public Examen obtenerExamenMaxId() {
		return dao.obtenerExamenMaxId();
	}

	@Override
	public void registrarExamen(Examen examen, Curso curso, List<DtoPregunta> listaPreguntasExamen) {
		dao.registrarExamen(examen, curso, listaPreguntasExamen);
	}
	
}
