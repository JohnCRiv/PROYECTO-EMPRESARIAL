package servicio.impl;

import java.util.List;

import bean.Alumno;
import bean.AlumnoCurso;
import bean.Curso;
import dao.AlumnoCursoDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.AlumnoCursoService;
import util.Constantes;

public class AlumnoCursoServiceImpl extends GenericoServiceImpl<AlumnoCurso> implements AlumnoCursoService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private AlumnoCursoDao dao = factory.getAlumnoCursoDAO();
	private static AlumnoCursoServiceImpl service;
	
	private AlumnoCursoServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static AlumnoCursoServiceImpl getInstance() {
		if(service == null) 
			service = new AlumnoCursoServiceImpl();
		
		return service;
	}

	@Override
	public List<Curso> obtenerCursosAsignados(Alumno alumno) {
		return dao.obtenerCursosAsignados(alumno);
	}

	@Override
	public void eliminarCursosAsignados(Alumno alumno) {
		dao.eliminarCursosAsignados(alumno);
	}
	
}
