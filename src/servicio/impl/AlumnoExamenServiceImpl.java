package servicio.impl;

import bean.AlumnoExamen;
import dao.AlumnoExamenDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.AlumnoExamenService;
import util.Constantes;

public class AlumnoExamenServiceImpl extends GenericoServiceImpl<AlumnoExamen> implements AlumnoExamenService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private AlumnoExamenDao dao = factory.getAlumnoExamenDAO();
	private static AlumnoExamenServiceImpl service;
	
	private AlumnoExamenServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static AlumnoExamenServiceImpl getInstance() {
		if(service == null) 
			service = new AlumnoExamenServiceImpl();
		
		return service;
	}
	
}
