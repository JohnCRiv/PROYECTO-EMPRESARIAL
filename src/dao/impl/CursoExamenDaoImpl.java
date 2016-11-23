package dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import bean.Alumno;
import bean.Curso;
import bean.CursoExamen;
import bean.Examen;
import bean.pk.ExamenPK;
import dao.CursoExamenDao;
import generico.GenericoDaoImpl;
import servicio.impl.ExamenServiceImpl;
import servicio.ExamenService;
import util.Parametro;
import util.Validador;

public class CursoExamenDaoImpl extends GenericoDaoImpl<CursoExamen> implements CursoExamenDao {
	
	private ExamenService examenService;

	@Override
	public List<CursoExamen> listarExamenesProgramados(Curso curso) {
		examenService = ExamenServiceImpl.getInstance();
		
		List<Parametro> parametros = Arrays.asList(new Parametro("idcurso", curso.getPk().getIdcurso()));
		List<CursoExamen> listaCursoExamen = this.listarPorWhereQuery("entity.pk.idcurso = :idcurso", parametros);
		List<CursoExamen> listaExamenesProgramados = new ArrayList<>();
		for (CursoExamen cursoExamen : listaCursoExamen) {
			ExamenPK pk = new ExamenPK();
			pk.setIdexamen(cursoExamen.getPk().getIdexamen());
			Examen examen = examenService.buscar(pk);
			if (examen.getFechainicio().after(new Date()))
				listaExamenesProgramados.add(cursoExamen);
		}
		
		return listaExamenesProgramados;
	}
	
	@Override
	public List<Examen> listarExamenesEnCurso(Curso curso) {
		examenService = ExamenServiceImpl.getInstance();
		
		List<Parametro> parametros = Arrays.asList(new Parametro("idcurso", curso.getPk().getIdcurso()));
		List<CursoExamen> listaCursoExamen = this.listarPorWhereQuery("entity.pk.idcurso = :idcurso", parametros);
		List<Examen> listaExamenesEnCurso = new ArrayList<>();
		for (CursoExamen cursoExamen : listaCursoExamen) {
			ExamenPK pk = new ExamenPK();
			pk.setIdexamen(cursoExamen.getPk().getIdexamen());
			Examen examen = examenService.buscar(pk);
			if (examen.getFechainicio().before(new Date()) ||
					examen.getFechainicio().equals(new Date())) {
				if (!Validador.esNulo(examen.getFechafin())) {
					if (examen.getFechafin().after(new Date())) {
						listaExamenesEnCurso.add(examen);
					}
				} else {
					listaExamenesEnCurso.add(examen);
				}
			}
				
		}
		
		return listaExamenesEnCurso;
	}

	@Override
	public List<CursoExamen> listarExamenesPendientes(Curso curso, Alumno alumno) {
		examenService = ExamenServiceImpl.getInstance();
		
		List<Parametro> parametros = Arrays.asList(new Parametro("idcurso", curso.getPk().getIdcurso()));
		List<CursoExamen> listaCursoExamen = this.listarPorWhereQuery("entity.pk.idcurso = :idcurso", parametros);
		List<CursoExamen> listaExamenesPendientes = new ArrayList<>();
		for (CursoExamen cursoExamen : listaCursoExamen) {
			ExamenPK pk = new ExamenPK();
			pk.setIdexamen(cursoExamen.getPk().getIdexamen());
			Examen examen = examenService.buscar(pk);
			if (examen.getFechainicio().equals(new Date()) || 
					examen.getFechainicio().before(new Date())) {
				listaExamenesPendientes.add(cursoExamen);
			}
		}
		
		return listaExamenesPendientes;
	}	
	
}
