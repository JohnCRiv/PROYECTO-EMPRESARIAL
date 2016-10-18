package servicio;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import generico.GenericoService;

public interface EnlaceService extends GenericoService<Enlace> {

	public List<Enlace> obtenerEnlacesPorRol(Rol rol);
	
}
