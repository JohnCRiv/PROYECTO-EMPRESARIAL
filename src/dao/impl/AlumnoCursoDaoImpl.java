package dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import bean.Alumno;
import bean.AlumnoCurso;
import bean.Curso;
import bean.pk.CursoPK;
import dao.AlumnoCursoDao;
import generico.GenericoDaoImpl;
import servicio.CursoService;
import servicio.impl.CursoServiceImpl;
import util.Parametro;

public class AlumnoCursoDaoImpl extends GenericoDaoImpl<AlumnoCurso> implements AlumnoCursoDao {
	
	private CursoService cursoService;

	@Override
	public List<Curso> obtenerCursosAsignados(Alumno alumno) {
		cursoService = CursoServiceImpl.getInstance();
		
		List<Curso> listaCursos = new ArrayList<>();
		List<Parametro> parametros = Arrays.asList(new Parametro("idalumno", alumno.getPk().getIdalumno()));
		List<AlumnoCurso> listaAlumnoCurso = this.listarPorWhereQuery("entity.pk.idalumno = :idalumno", parametros);
		for (AlumnoCurso alumnoCurso : listaAlumnoCurso) {
			Curso curso = cursoService.buscar(new CursoPK(alumnoCurso.getPk().getIdcurso()));
			listaCursos.add(curso);
		}
		return listaCursos;
	}

	@Override
	public void eliminarCursosAsignados(Alumno alumno) {
		List<Parametro> parametros = Arrays.asList(new Parametro("idalumno", alumno.getPk().getIdalumno()));
		List<AlumnoCurso> listaAlumnoCurso = this.listarPorWhereQuery("entity.pk.idalumno = :idalumno", parametros);
		for (AlumnoCurso alumnoCurso : listaAlumnoCurso) {
			this.eliminar(alumnoCurso);
		}
	}
	
}
