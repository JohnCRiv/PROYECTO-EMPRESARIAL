package dao.impl;

import java.util.Arrays;
import java.util.List;

import bean.ExamenPregunta;
import dao.ExamenPreguntaDao;
import generico.GenericoDaoImpl;
import util.Parametro;

public class ExamenPreguntaDaoImpl extends GenericoDaoImpl<ExamenPregunta> implements ExamenPreguntaDao {

	@Override
	public List<ExamenPregunta> listarPreguntas(Integer idcurso, Integer idexamen) {
		List<Parametro> parametros = Arrays.asList(
				new Parametro("idcurso", idcurso),
				new Parametro("idexamen", idexamen));
		List<ExamenPregunta> listaPreguntas = this.listarPorWhereQuery(
				"entity.pk.idcurso = :idcurso and entity.pk.idexamen = :idexamen", parametros);
		return listaPreguntas;
	}
	
}
