package servicio;

import java.util.List;

import bean.Alumno;
import bean.Curso;
import bean.CursoExamen;
import bean.Examen;
import generico.GenericoService;

public interface CursoExamenService extends GenericoService<CursoExamen> {

	public List<CursoExamen> listarExamenesProgramados(Curso curso);
	
	public List<Examen> listarExamenesEnCurso(Curso curso);
	
	public List<CursoExamen> listarExamenesPendientes(Curso curso, Alumno alumno);
	
}
