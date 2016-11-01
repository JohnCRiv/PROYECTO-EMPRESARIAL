package servicio.impl;

import java.util.List;

import bean.Alumno;
import bean.Curso;
import dao.AlumnoDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.AlumnoService;
import util.Constantes;

public class AlumnoServiceImpl extends GenericoServiceImpl<Alumno> implements AlumnoService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private AlumnoDao dao = factory.getAlumnoDAO();
	private static AlumnoServiceImpl service;
	
	private AlumnoServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static AlumnoServiceImpl getInstance() {
		if(service == null) 
			service = new AlumnoServiceImpl();
		
		return service;
	}

	@Override
	public void guardarAsignacionCurso(Alumno alumno, List<Curso> listaAlumnoCursos) {
		dao.guardarAsignacionCurso(alumno, listaAlumnoCursos);
	}
	
}
