package servicio.impl;

import bean.Curso;
import dao.CursoDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.CursoService;
import util.Constantes;

public class CursoServiceImpl extends GenericoServiceImpl<Curso> implements CursoService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private CursoDao dao = factory.getCursoDAO();
	private static CursoServiceImpl service;
	
	private CursoServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static CursoServiceImpl getInstance() {
		if(service == null) 
			service = new CursoServiceImpl();
		
		return service;
	}
	
}
