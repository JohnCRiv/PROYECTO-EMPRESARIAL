package dao.impl;

import java.util.List;

import bean.Rol;
import dao.RolDao;
import generico.GenericoDaoImpl;

public class RolDaoImpl extends GenericoDaoImpl<Rol> implements RolDao {

	@Override
	public Rol obtenerRolMaxID() {
		List<Rol> listaRolMaxID = this.listarPorQuery("SELECT rol FROM Rol rol order by rol.pk.idrol desc");
		return listaRolMaxID.get(0);
	}
	
}
