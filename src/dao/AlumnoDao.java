package dao;

import java.util.List;

import bean.Alumno;
import bean.Curso;
import generico.GenericoDao;

public interface AlumnoDao extends GenericoDao<Alumno> {
	
	public void guardarAsignacionCurso(Alumno alumno, List<Curso> listaAlumnoCursos);
	
}
