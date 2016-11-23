package dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import bean.pk.CursoPK;
import dao.DocenteCursoDao;
import generico.GenericoDaoImpl;
import servicio.CursoService;
import servicio.impl.CursoServiceImpl;
import util.Parametro;

public class DocenteCursoDaoImpl extends GenericoDaoImpl<DocenteCurso> implements DocenteCursoDao {
	
	private CursoService cursoService;
	
	@Override
	public List<Curso> obtenerCursosAsignados(Docente docente) {
		cursoService = CursoServiceImpl.getInstance();
		
		List<Curso> listaCursos = new ArrayList<>();
		List<Parametro> parametros = Arrays.asList(new Parametro("iddocente", docente.getPk().getIddocente()));
		List<DocenteCurso> listaDocenteCurso = this.listarPorWhereQuery("entity.pk.iddocente = :iddocente", parametros);
		for (DocenteCurso docenteCurso : listaDocenteCurso) {
			Curso curso = cursoService.buscar(new CursoPK(docenteCurso.getPk().getIdcurso()));
			listaCursos.add(curso);
		}
		return listaCursos;
	}

	@Override
	public void eliminarCursosAsignados(Docente docente) {
		List<Parametro> parametros = Arrays.asList(new Parametro("iddocente", docente.getPk().getIddocente()));
		List<DocenteCurso> listaDocenteCurso = this.listarPorWhereQuery("entity.pk.iddocente = :iddocente", parametros);
		for (DocenteCurso docenteCurso : listaDocenteCurso) {
			this.eliminar(docenteCurso);
		}
	}	
	
}
