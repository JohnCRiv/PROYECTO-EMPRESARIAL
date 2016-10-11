package servicio;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import bean.RolEnlace;
import generico.GenericoService;

public interface RolEnlaceService extends GenericoService<RolEnlace> {

	public void eliminarSegunRol(Rol rol);
	
	public void registrarRolEnlace(Rol rol, List<Enlace> listaEnlaces);
	
}
