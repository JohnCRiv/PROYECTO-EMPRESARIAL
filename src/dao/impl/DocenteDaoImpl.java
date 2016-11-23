package dao.impl;

import java.util.Arrays;
import java.util.List;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import dao.DocenteDao;
import generico.GenericoDaoImpl;
import servicio.DocenteCursoService;
import servicio.impl.DocenteCursoServiceImpl;
import util.Parametro;

public class DocenteDaoImpl extends GenericoDaoImpl<Docente> implements DocenteDao {
	
	private DocenteCursoService docenteCursoService;

	@Override
	public void guardarAsignacionCurso(Docente docente, List<Curso> listaCursosDocente) {
		docenteCursoService = DocenteCursoServiceImpl.getInstance();
		
		docenteCursoService.eliminarCursosAsignados(docente);
		for (Curso curso : listaCursosDocente) {
			DocenteCurso bean = new DocenteCurso();
			bean.getPk().setIdcurso(curso.getPk().getIdcurso());
			bean.getPk().setIddocente(docente.getPk().getIddocente());
			docenteCursoService.registrar(bean);
		}
	}

	@Override
	public Docente obtenerDocentePorDocumento(String numerodocumento) {
		List<Parametro> parametros = Arrays.asList(new Parametro("numerodocumento", numerodocumento));
		List<Docente> listaDocente = this.listarPorWhereQuery("entity.numerodocumento = :numerodocumento", parametros);
		if (!listaDocente.isEmpty())
			return listaDocente.get(0);
		return null;
	}
	
	
}
