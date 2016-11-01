package servicio;

import java.util.List;

import bean.Curso;
import bean.Docente;
import generico.GenericoService;

public interface DocenteService extends GenericoService<Docente> {

	public void guardarAsignacionCurso(Docente docente, List<Curso> listaCursosDocente);
	
	public Docente obtenerDocentePorDocumento(String numerodocumento);
	
}
