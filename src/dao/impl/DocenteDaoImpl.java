package dao.impl;

import java.util.List;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import dao.DocenteDao;
import generico.GenericoDaoImpl;
import servicio.impl.DocenteCursoServiceImpl;

public class DocenteDaoImpl extends GenericoDaoImpl<Docente> implements DocenteDao {

	@Override
	public void guardarAsignacionCurso(Docente docente, List<Curso> listaCursosDocente) {
		DocenteCursoServiceImpl.getInstance().eliminarCursosAsignados(docente);
		for (Curso curso : listaCursosDocente) {
			DocenteCurso bean = new DocenteCurso();
			bean.getPk().setIdcurso(curso.getPk().getIdcurso());
			bean.getPk().setIddocente(docente.getPk().getIddocente());
			DocenteCursoServiceImpl.getInstance().registrar(bean);
		}
	}
	
	
}
