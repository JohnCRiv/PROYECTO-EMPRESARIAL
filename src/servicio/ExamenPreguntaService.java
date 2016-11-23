package servicio;

import java.util.List;

import bean.ExamenPregunta;
import generico.GenericoService;

public interface ExamenPreguntaService extends GenericoService<ExamenPregunta> {

	public List<ExamenPregunta> listarPreguntas(Integer idcurso, Integer idexamen);
	
}
