package dao.impl;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import dao.RolDao;
import generico.GenericoDaoImpl;
import servicio.impl.RolEnlaceServiceImpl;
import servicio.impl.RolServiceImpl;

public class RolDaoImpl extends GenericoDaoImpl<Rol> implements RolDao {

	@Override
	public Rol obtenerRolMaxID() {
		List<Rol> listaRolMaxID = this.listarPorQuery("SELECT rol FROM Rol rol order by rol.pk.idrol desc");
		return listaRolMaxID.get(0);
	}

	@Override
	public void registrarRol(Rol rol, List<Enlace> listaEnlace) {
		this.registrar(rol);
		Rol ultimoRol = RolServiceImpl.getInstance().obtenerRolMaxID();
		RolEnlaceServiceImpl.getInstance().registrarRolEnlace(ultimoRol, listaEnlace);
	}

	@Override
	public void actualizarRol(Rol rol, List<Enlace> listaEnlace) {
		this.actualizar(rol);
		RolEnlaceServiceImpl.getInstance().eliminarSegunRol(rol);
		RolEnlaceServiceImpl.getInstance().registrarRolEnlace(rol, listaEnlace);
	}
	
}
