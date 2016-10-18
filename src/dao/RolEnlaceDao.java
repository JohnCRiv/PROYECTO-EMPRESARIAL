package dao;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import bean.RolEnlace;
import generico.GenericoDao;

public interface RolEnlaceDao extends GenericoDao<RolEnlace> {
	
	public void eliminarSegunRol(Rol rol);
	
	public void registrarRolEnlace(Rol rol, List<Enlace> listaEnlaces);
	
	public List<RolEnlace> obtenerRolEnlacePorRol(Rol rol);
	
}
