package dao.impl;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import dao.RolDao;
import generico.GenericoDaoImpl;
import servicio.RolEnlaceService;
import servicio.impl.RolEnlaceServiceImpl;

public class RolDaoImpl extends GenericoDaoImpl<Rol> implements RolDao {
	
	private RolEnlaceService rolEnlaceService;

	@Override
	public Rol obtenerRolMaxID() {
		List<Rol> listaRolMaxID = this.listarPorQuery("SELECT rol FROM Rol rol order by rol.pk.idrol desc");
		return listaRolMaxID.get(0);
	}

	@Override
	public void registrarRol(Rol rol, List<Enlace> listaEnlace) {
		rolEnlaceService = RolEnlaceServiceImpl.getInstance();
		
		this.registrar(rol);
		Rol ultimoRol = this.obtenerRolMaxID();
		rolEnlaceService.registrarRolEnlace(ultimoRol, listaEnlace);
	}

	@Override
	public void actualizarRol(Rol rol, List<Enlace> listaEnlace) {
		rolEnlaceService = RolEnlaceServiceImpl.getInstance();
		
		this.actualizar(rol);
		rolEnlaceService.eliminarSegunRol(rol);
		rolEnlaceService.registrarRolEnlace(rol, listaEnlace);
	}
	
}
