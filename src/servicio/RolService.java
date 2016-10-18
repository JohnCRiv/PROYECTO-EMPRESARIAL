package servicio;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import generico.GenericoService;

public interface RolService extends GenericoService<Rol> {

	public Rol obtenerRolMaxID();
	
	public void registrarRol(Rol rol, List<Enlace> listaEnlace);
	
	public void actualizarRol(Rol rol, List<Enlace> listaEnlace);
	
}
