package servicio;

import bean.Rol;
import generico.GenericoService;

public interface RolService extends GenericoService<Rol> {

	public Rol obtenerRolMaxID();
	
}
