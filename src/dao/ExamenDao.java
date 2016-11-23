package dao;

import java.util.List;

import bean.Curso;
import bean.Examen;
import dto.DtoPregunta;
import generico.GenericoDao;

public interface ExamenDao extends GenericoDao<Examen> {
	
	public Examen obtenerExamenMaxId();
	
	public void registrarExamen(Examen examen, Curso curso, List<DtoPregunta> listaPreguntasExamen);
	
}
