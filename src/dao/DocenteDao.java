package dao;

import java.util.List;

import bean.Curso;
import bean.Docente;
import generico.GenericoDao;

public interface DocenteDao extends GenericoDao<Docente> {
	
	public void guardarAsignacionCurso(Docente docente, List<Curso> listaCursosDocente);
	
	public Docente obtenerDocentePorDocumento(String numerodocumento);
	
	
}
