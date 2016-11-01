package servicio;

import java.util.List;

import bean.Alumno;
import bean.AlumnoCurso;
import bean.Curso;
import generico.GenericoService;

public interface AlumnoCursoService extends GenericoService<AlumnoCurso> {

	public List<Curso> obtenerCursosAsignados(Alumno alumno);
	
	public void eliminarCursosAsignados(Alumno alumno);
	
}
