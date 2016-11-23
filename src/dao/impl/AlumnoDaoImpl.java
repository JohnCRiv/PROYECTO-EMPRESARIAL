package dao.impl;

import java.util.Arrays;
import java.util.List;

import bean.Alumno;
import bean.AlumnoCurso;
import bean.Curso;
import dao.AlumnoDao;
import generico.GenericoDaoImpl;
import servicio.AlumnoCursoService;
import servicio.impl.AlumnoCursoServiceImpl;
import util.Parametro;

public class AlumnoDaoImpl extends GenericoDaoImpl<Alumno> implements AlumnoDao {

	private AlumnoCursoService alumnoCursoService;
	
	@Override
	public void guardarAsignacionCurso(Alumno alumno, List<Curso> listaAlumnoCursos) {
		alumnoCursoService = AlumnoCursoServiceImpl.getInstance();
		
		alumnoCursoService.eliminarCursosAsignados(alumno);
		for (Curso curso : listaAlumnoCursos) {
			AlumnoCurso bean = new AlumnoCurso();
			bean.getPk().setIdalumno(alumno.getPk().getIdalumno());
			bean.getPk().setIdcurso(curso.getPk().getIdcurso());
			alumnoCursoService.registrar(bean);
		}
	}

	@Override
	public Alumno obtenerAlumnoPorDocumento(String numerodocumento) {
		List<Parametro> parametros = Arrays.asList(new Parametro("numerodocumento", numerodocumento));
		List<Alumno> listaAlumno = this.listarPorWhereQuery("entity.numerodocumento = :numerodocumento", parametros);
		if (!listaAlumno.isEmpty())
			return listaAlumno.get(0);
		return null;
	}
	
}
