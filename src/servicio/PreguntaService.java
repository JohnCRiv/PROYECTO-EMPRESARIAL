package servicio;

import java.util.List;

import bean.Curso;
import bean.Pregunta;
import generico.GenericoService;

public interface PreguntaService extends GenericoService<Pregunta> {

	public List<Pregunta> listarPreguntasPorCurso(Curso curso);
	
}
