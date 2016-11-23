package dao;

import java.util.List;

import bean.ExamenPregunta;
import generico.GenericoDao;

public interface ExamenPreguntaDao extends GenericoDao<ExamenPregunta> {
	
	public List<ExamenPregunta> listarPreguntas(Integer idcurso, Integer idexamen);
	
}
