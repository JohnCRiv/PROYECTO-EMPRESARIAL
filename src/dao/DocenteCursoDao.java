package dao;

import java.util.List;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import generico.GenericoDao;

public interface DocenteCursoDao extends GenericoDao<DocenteCurso> {
	
	public List<Curso> obtenerCursosAsignados(Docente docente);
	
	public void eliminarCursosAsignados(Docente docente);
	
}
