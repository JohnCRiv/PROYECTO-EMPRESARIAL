package servicio.impl;

import bean.AlumnoRespuesta;
import dao.AlumnoRespuestaDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.AlumnoRespuestaService;
import util.Constantes;

public class AlumnoRespuestaServiceImpl extends GenericoServiceImpl<AlumnoRespuesta> implements AlumnoRespuestaService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private AlumnoRespuestaDao dao = factory.getAlumnoRespuestaDAO();
	private static AlumnoRespuestaServiceImpl service;
	
	private AlumnoRespuestaServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static AlumnoRespuestaServiceImpl getInstance() {
		if(service == null) 
			service = new AlumnoRespuestaServiceImpl();
		
		return service;
	}
	
}
