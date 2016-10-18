package servicio;

import java.util.List;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import generico.GenericoService;

public interface DocenteCursoService extends GenericoService<DocenteCurso> {

	public List<Curso> obtenerCursosAsignados(Docente docente);
	
	public void eliminarCursosAsignados(Docente docente);
	
}
