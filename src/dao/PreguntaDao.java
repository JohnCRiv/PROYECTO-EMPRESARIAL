package dao;

import java.util.List;

import bean.Curso;
import bean.Pregunta;
import generico.GenericoDao;

public interface PreguntaDao extends GenericoDao<Pregunta> {
	
	public List<Pregunta> listarPreguntasPorCurso(Curso curso);
	
}
