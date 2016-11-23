package dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import bean.Curso;
import bean.CursoPregunta;
import bean.Pregunta;
import bean.pk.PreguntaPK;
import dao.PreguntaDao;
import generico.GenericoDaoImpl;
import servicio.CursoPreguntaService;
import servicio.impl.CursoPreguntaServiceImpl;
import util.Parametro;

public class PreguntaDaoImpl extends GenericoDaoImpl<Pregunta> implements PreguntaDao {
	
	private CursoPreguntaService cursoPreguntaService;

	@Override
	public List<Pregunta> listarPreguntasPorCurso(Curso curso) {
		cursoPreguntaService = CursoPreguntaServiceImpl.getInstance();
		
		List<Parametro> parametros = Arrays.asList(
				new Parametro("idcurso", curso.getPk().getIdcurso()));
		
		List<CursoPregunta> listaCursoPregunta = cursoPreguntaService.listarPorWhereQuery("entity.pk.idcurso = :idcurso", parametros);
		
		List<Pregunta> listaPreguntas = new ArrayList<>();
		
		for (CursoPregunta cursoPregunta : listaCursoPregunta) {
			PreguntaPK pk = new PreguntaPK();
			pk.setIdpregunta(cursoPregunta.getPk().getIdpregunta());
			Pregunta pregunta = this.buscar(pk);
			listaPreguntas.add(pregunta);
		}
		
		return listaPreguntas;
	}
	
}
