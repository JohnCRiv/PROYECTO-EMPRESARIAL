package dao;

import java.util.List;

import bean.PreguntaOpcion;
import generico.GenericoDao;

public interface PreguntaOpcionDao extends GenericoDao<PreguntaOpcion> {
	
	public List<PreguntaOpcion> listarOpciones(Integer idcurso, Integer idpregunta);
	
}
