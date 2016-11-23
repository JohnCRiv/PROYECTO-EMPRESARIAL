package dao;

import java.util.List;

import bean.Alumno;
import bean.Curso;
import bean.CursoExamen;
import bean.Examen;
import generico.GenericoDao;

public interface CursoExamenDao extends GenericoDao<CursoExamen> {
	
	public List<CursoExamen> listarExamenesProgramados(Curso curso);
	
	public List<Examen> listarExamenesEnCurso(Curso curso);
	
	public List<CursoExamen> listarExamenesPendientes(Curso curso, Alumno alumno);
	
}
