package servicio.impl;

import java.util.List;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import dao.DocenteCursoDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.DocenteCursoService;
import util.Constantes;

public class DocenteCursoServiceImpl extends GenericoServiceImpl<DocenteCurso> implements DocenteCursoService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private DocenteCursoDao dao = factory.getDocenteCursoDAO();
	private static DocenteCursoServiceImpl service;
	
	private DocenteCursoServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static DocenteCursoServiceImpl getInstance() {
		if(service == null) 
			service = new DocenteCursoServiceImpl();
		
		return service;
	}

	@Override
	public List<Curso> obtenerCursosAsignados(Docente docente) {
		return dao.obtenerCursosAsignados(docente);
	}

	@Override
	public void eliminarCursosAsignados(Docente docente) {
		dao.eliminarCursosAsignados(docente);
	}
	
}
