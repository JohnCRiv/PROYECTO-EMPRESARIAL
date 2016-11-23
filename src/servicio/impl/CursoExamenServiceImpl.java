package servicio.impl;

import java.util.List;

import bean.Alumno;
import bean.Curso;
import bean.CursoExamen;
import bean.Examen;
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

	@Override
	public List<CursoExamen> listarExamenesProgramados(Curso curso) {
		return dao.listarExamenesProgramados(curso);
	}
	
	@Override
	public List<Examen> listarExamenesEnCurso(Curso curso) {
		return dao.listarExamenesEnCurso(curso);
	}

	@Override
	public List<CursoExamen> listarExamenesPendientes(Curso curso, Alumno alumno) {
		return dao.listarExamenesPendientes(curso, alumno);
	}
	
}
