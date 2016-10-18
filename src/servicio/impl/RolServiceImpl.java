package servicio.impl;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import dao.RolDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.RolService;
import util.Constantes;

public class RolServiceImpl extends GenericoServiceImpl<Rol> implements RolService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private RolDao dao = factory.getRolDAO();
	private static RolServiceImpl service;
	
	private RolServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static RolServiceImpl getInstance() {
		if(service == null) 
			service = new RolServiceImpl();
		
		return service;
	}

	@Override
	public Rol obtenerRolMaxID() {
		return dao.obtenerRolMaxID();
	}

	@Override
	public void registrarRol(Rol rol, List<Enlace> listaEnlace) {
		dao.registrarRol(rol, listaEnlace);
	}

	@Override
	public void actualizarRol(Rol rol, List<Enlace> listaEnlace) {
		dao.actualizarRol(rol, listaEnlace);
	}
	
}
