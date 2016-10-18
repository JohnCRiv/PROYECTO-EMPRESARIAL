package dao.impl;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import bean.RolEnlace;
import dao.RolEnlaceDao;
import generico.GenericoDaoImpl;

public class RolEnlaceDaoImpl extends GenericoDaoImpl<RolEnlace> implements RolEnlaceDao {

	@Override
	public void eliminarSegunRol(Rol rol) {
		List<RolEnlace> listaRolEnlace = this.listarPorWhereQuery("entity.pk.idrol = " + rol.getPk().getIdrol());
		for (RolEnlace rolEnlace : listaRolEnlace) {
			this.eliminar(rolEnlace);
		}
	}

	@Override
	public void registrarRolEnlace(Rol rol, List<Enlace> listaEnlaces) {
		for (Enlace enlace : listaEnlaces) {
			if (enlace.esSeleccionado()) {
				RolEnlace rolenlace = new RolEnlace();
				rolenlace.getPk().setIdrol(rol.getPk().getIdrol());
				rolenlace.getPk().setIdenlace(enlace.getPk().getIdenlace());
				this.registrar(rolenlace);
			}
		}
	}

	@Override
	public List<RolEnlace> obtenerRolEnlacePorRol(Rol rol) {
		List<RolEnlace> listaRolEnlace = this.listarPorWhereQuery("entity.pk.idrol = " + rol.getPk().getIdrol());
		return listaRolEnlace;
	}
	
	
}
