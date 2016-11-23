package dao.impl;

import java.util.List;

import bean.Curso;
import bean.CursoExamen;
import bean.Examen;
import bean.ExamenPregunta;
import dao.ExamenDao;
import dto.DtoPregunta;
import generico.GenericoDaoImpl;
import servicio.CursoExamenService;
import servicio.ExamenPreguntaService;
import servicio.impl.CursoExamenServiceImpl;
import servicio.impl.ExamenPreguntaServiceImpl;

public class ExamenDaoImpl extends GenericoDaoImpl<Examen> implements ExamenDao {
	
	private CursoExamenService cursoExamenService;
	private ExamenPreguntaService examenPreguntaService;
	
	@Override
	public Examen obtenerExamenMaxId() {
		List<Examen> listaExamen = this.listarPorQuery("SELECT examen FROM Examen examen order by examen.pk.idexamen desc");
		return listaExamen.get(0);
	}

	@Override
	public void registrarExamen(Examen examen, Curso curso, List<DtoPregunta> listaPreguntasExamen) {
		this.registrar(examen);
		
		cursoExamenService = CursoExamenServiceImpl.getInstance();
		examenPreguntaService = ExamenPreguntaServiceImpl.getInstance();
		
		Examen examenMaxId = this.obtenerExamenMaxId();
		
		CursoExamen cursoexamen = new CursoExamen();
		cursoexamen.getPk().setIdcurso(curso.getPk().getIdcurso());
		cursoexamen.getPk().setIdexamen(examenMaxId.getPk().getIdexamen());
		cursoExamenService.registrar(cursoexamen);
		
		for (DtoPregunta dtoPregunta : listaPreguntasExamen) {
			ExamenPregunta examenpregunta = new ExamenPregunta();
			examenpregunta.getPk().setIdcurso(curso.getPk().getIdcurso());
			examenpregunta.getPk().setIdexamen(examenMaxId.getPk().getIdexamen());
			examenpregunta.getPk().setIdpregunta(dtoPregunta.getIdpregunta());
			examenpregunta.setPuntaje(dtoPregunta.getPuntaje());
			examenPreguntaService.registrar(examenpregunta);
		}
		
	}
	
}
