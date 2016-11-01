package dao.impl;

import java.util.List;

import bean.Alumno;
import bean.AlumnoCurso;
import bean.Curso;
import dao.AlumnoDao;
import generico.GenericoDaoImpl;
import servicio.impl.AlumnoCursoServiceImpl;

public class AlumnoDaoImpl extends GenericoDaoImpl<Alumno> implements AlumnoDao {

	@Override
	public void guardarAsignacionCurso(Alumno alumno, List<Curso> listaAlumnoCursos) {
		AlumnoCursoServiceImpl.getInstance().eliminarCursosAsignados(alumno);
		for (Curso curso : listaAlumnoCursos) {
			AlumnoCurso bean = new AlumnoCurso();
			bean.getPk().setIdalumno(alumno.getPk().getIdalumno());
			bean.getPk().setIdcurso(curso.getPk().getIdcurso());
			AlumnoCursoServiceImpl.getInstance().registrar(bean);
		}
	}
	
}
