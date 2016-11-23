package servicio;

import java.util.List;

import bean.Alumno;
import bean.Curso;
import generico.GenericoService;

public interface AlumnoService extends GenericoService<Alumno> {

	public void guardarAsignacionCurso(Alumno alumno, List<Curso> listaAlumnoCursos);
	
	public Alumno obtenerAlumnoPorDocumento(String numerodocumento);
	
}
