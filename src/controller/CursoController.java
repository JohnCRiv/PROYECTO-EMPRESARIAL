package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class CursoController extends BaseController implements GenericoController {

	private List<Curso> listaCurso;
	private Curso curso;

	public CursoController()  {
		pantallaListado = "pretty:curso_listado";
		pantallaMantenimiento = "pretty:curso_mantenimiento";
	}

	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaCurso = getCursoService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		curso = new Curso();
		setAccionSolicitada(AccionSolicitada.NUEVO);
		return pantallaMantenimiento;
	}

	@Override
	public String editar() throws Exception {
		setAccionSolicitada(AccionSolicitada.EDITAR);
		return pantallaMantenimiento;
	}

	@Override
	public String ver() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String eliminar() throws Exception {
		getCursoService().eliminar(curso);
		buscar();
		enviarMensajeExitoso("Éxito", "Se eliminó!");
		
		return null;
	}

	@Override
	public String inactivar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String guardar() throws Exception {
		curso.setHorastotal(curso.getHorasteoria() + curso.getHoraslaboratorio());
		if(accionSolicitada.equals(AccionSolicitada.NUEVO)){
			getCursoService().registrar(curso);
			enviarMensajeExitoso("Éxito", "Se registró");
			
			
		}else{
			getCursoService().actualizar(curso);
			enviarMensajeExitoso("Éxito", "Se actualizó");
		}
		buscar();
		return pantallaListado;
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
		listaCurso = getCursoService().listarTodos();
		return null;
	}

	public List<Curso> getListaCurso() {
		return listaCurso;
	}

	public void setListaCurso(List<Curso> listaCurso) {
		this.listaCurso = listaCurso;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
}
