package servicio;

import java.util.List;

import bean.PreguntaOpcion;
import generico.GenericoService;

public interface PreguntaOpcionService extends GenericoService<PreguntaOpcion> {

	public List<PreguntaOpcion> listarOpciones(Integer idcurso, Integer idpregunta);
	
}
