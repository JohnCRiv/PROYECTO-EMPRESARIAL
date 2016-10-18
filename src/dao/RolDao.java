package dao;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import generico.GenericoDao;

public interface RolDao extends GenericoDao<Rol> {
	
	public Rol obtenerRolMaxID();
	
	public void registrarRol(Rol rol, List<Enlace> listaEnlace);
	
	public void actualizarRol(Rol rol, List<Enlace> listaEnlace);
	
}
