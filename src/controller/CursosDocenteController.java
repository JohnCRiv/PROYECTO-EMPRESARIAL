package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import bean.Docente;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class CursosDocenteController extends BaseController implements GenericoController {

	private List<Curso> listaCursos;
	
	public CursosDocenteController() {
		pantallaListado = "pretty:cursos_docente";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String editar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String guardar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String ver() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String eliminar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inactivar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String salir() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean validar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicializarFiltrosListado() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicializarDatosMantenimiento() throws Exception {
		Docente docente = getDocenteService().obtenerDocentePorDocumento(getUsuarioActual().getNumerodocumento());
		listaCursos = getDocenteCursoService().obtenerCursosAsignados(docente);
		return null;
	}

	public List<Curso> getListaCursos() {
		return listaCursos;
	}

	public void setListaCursos(List<Curso> listaCursos) {
		this.listaCursos = listaCursos;
	}
	
}
