package servicio.impl;

import bean.CursoPregunta;
import dao.CursoPreguntaDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.CursoPreguntaService;
import util.Constantes;

public class CursoPreguntaServiceImpl extends GenericoServiceImpl<CursoPregunta> implements CursoPreguntaService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private CursoPreguntaDao dao = factory.getCursoPreguntaDAO();
	private static CursoPreguntaServiceImpl service;
	
	private CursoPreguntaServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static CursoPreguntaServiceImpl getInstance() {
		if(service == null) 
			service = new CursoPreguntaServiceImpl();
		
		return service;
	}
	
}
