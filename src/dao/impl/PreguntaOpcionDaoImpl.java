package dao.impl;

import java.util.Arrays;
import java.util.List;

import bean.PreguntaOpcion;
import dao.PreguntaOpcionDao;
import generico.GenericoDaoImpl;
import util.Parametro;

public class PreguntaOpcionDaoImpl extends GenericoDaoImpl<PreguntaOpcion> implements PreguntaOpcionDao {

	@Override
	public List<PreguntaOpcion> listarOpciones(Integer idcurso, Integer idpregunta) {
		List<Parametro> parametros = Arrays.asList(
				new Parametro("idcurso", idcurso),
				new Parametro("idpregunta", idpregunta));
		List<PreguntaOpcion> listaOpciones = this.listarPorWhereQuery(
				"entity.pk.idcurso = :idcurso and entity.pk.idpregunta = :idpregunta", parametros);
		return listaOpciones;
	}
	
}
