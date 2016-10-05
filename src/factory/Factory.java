package factory;

import dao.AlumnoCursoDao;
import dao.AlumnoDao;
import dao.AlumnoExamenDao;
import dao.AlumnoRespuestaDao;
import dao.CursoDao;
import dao.CursoExamenDao;
import dao.CursoPreguntaDao;
import dao.EnlaceDao;
import dao.ExamenDao;
import dao.ExamenPreguntaDao;
import dao.PreguntaDao;
import dao.PreguntaOpcionDao;
import dao.RolDao;
import dao.RolEnlaceDao;
import dao.UsuarioDao;

/**
 * <strong>Factory</strong> <br>
 * Clase Fábrica DAO
 * 
 * @author CruzadoJ
 *
 */
public abstract class Factory {

	public static final String MYSQL = "MYSQL";
	public static final String SQLSERVER = "SQLSERVER";
	public static final String ORACLE = "ORACLE";
	
	public abstract AlumnoDao getAlumnoDAO();
	public abstract CursoDao getCursoDAO();
	public abstract AlumnoCursoDao getAlumnoCursoDAO();
	public abstract ExamenDao getExamenDAO();
	public abstract CursoExamenDao getCursoExamenDAO();
	public abstract AlumnoExamenDao getAlumnoExamenDAO();
	public abstract PreguntaDao getPreguntaDAO();
	public abstract CursoPreguntaDao getCursoPreguntaDAO();
	public abstract ExamenPreguntaDao getExamenPreguntaDAO();
	public abstract PreguntaOpcionDao getPreguntaOpcionDAO();
	public abstract AlumnoRespuestaDao getAlumnoRespuestaDAO();
	public abstract RolDao getRolDAO();
	public abstract UsuarioDao getUsuarioDAO();
	public abstract EnlaceDao getEnlaceDAO();
	public abstract RolEnlaceDao getRolEnlaceDAO();
	
	public static Factory getFactory(String database) {
		
		switch (database) {
			case MYSQL:
				return new MySqlDAOFactory();
			case SQLSERVER:
				// TODO: return new SqlServerDAOFactory();
			case ORACLE:
				// TODO: return new OracleDAOFactory();
		}

		return null;
	}
}
