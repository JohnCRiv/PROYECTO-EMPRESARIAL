package servicio.impl;

import bean.CursoExamen;
import dao.CursoExamenDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.CursoExamenService;
import util.Constantes;

public class CursoExamenServiceImpl extends GenericoServiceImpl<CursoExamen> implements CursoExamenService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private CursoExamenDao dao = factory.getCursoExamenDAO();
	private static CursoExamenServiceImpl service;
	
	private CursoExamenServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static CursoExamenServiceImpl getInstance() {
		if(service == null) 
			service = new CursoExamenServiceImpl();
		
		return service;
	}
	
}
