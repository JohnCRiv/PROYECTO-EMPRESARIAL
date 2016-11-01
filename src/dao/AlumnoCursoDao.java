package dao;

import java.util.List;

import bean.Alumno;
import bean.AlumnoCurso;
import bean.Curso;
import generico.GenericoDao;

public interface AlumnoCursoDao extends GenericoDao<AlumnoCurso> {
	
	public List<Curso> obtenerCursosAsignados(Alumno alumno);
	
	public void eliminarCursosAsignados(Alumno alumno);
	
}
