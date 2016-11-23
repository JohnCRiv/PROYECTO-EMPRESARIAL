package dao.impl;

import java.util.ArrayList;
import java.util.List;

import bean.Enlace;
import bean.Rol;
import bean.RolEnlace;
import bean.pk.EnlacePK;
import dao.EnlaceDao;
import generico.GenericoDaoImpl;
import servicio.RolEnlaceService;
import servicio.impl.RolEnlaceServiceImpl;

public class EnlaceDaoImpl extends GenericoDaoImpl<Enlace> implements EnlaceDao {
	
	private RolEnlaceService rolEnlaceService;

	@Override
	public List<Enlace> obtenerEnlacesPorRol(Rol rol) {
		rolEnlaceService = RolEnlaceServiceImpl.getInstance();
		
		List<Enlace> listaEnlace = new ArrayList<>();
		List<RolEnlace> listaRolEnlace = rolEnlaceService.listarPorWhereQuery("entity.pk.idrol = " + rol.getPk().getIdrol());
		for (RolEnlace rolEnlace : listaRolEnlace) {
			EnlacePK pk = new EnlacePK();
			pk.setIdenlace(rolEnlace.getPk().getIdenlace());
			Enlace enlace = this.buscar(pk);
			listaEnlace.add(enlace);
		}
		return listaEnlace;
	}
	
}
