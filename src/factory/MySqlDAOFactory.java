package factory;

import dao.AlumnoCursoDao;
import dao.AlumnoDao;
import dao.AlumnoExamenDao;
import dao.AlumnoRespuestaDao;
import dao.CursoDao;
import dao.CursoExamenDao;
import dao.CursoPreguntaDao;
import dao.DocenteCursoDao;
import dao.DocenteDao;
import dao.EnlaceDao;
import dao.ExamenDao;
import dao.ExamenPreguntaDao;
import dao.PreguntaDao;
import dao.PreguntaOpcionDao;
import dao.RolDao;
import dao.RolEnlaceDao;
import dao.SedeDao;
import dao.UsuarioDao;
import dao.impl.AlumnoCursoDaoImpl;
import dao.impl.AlumnoDaoImpl;
import dao.impl.AlumnoExamenDaoImpl;
import dao.impl.AlumnoRespuestaDaoImpl;
import dao.impl.CursoDaoImpl;
import dao.impl.CursoExamenDaoImpl;
import dao.impl.CursoPreguntaDaoImpl;
import dao.impl.DocenteCursoDaoImpl;
import dao.impl.DocenteDaoImpl;
import dao.impl.EnlaceDaoImpl;
import dao.impl.ExamenDaoImpl;
import dao.impl.ExamenPreguntaDaoImpl;
import dao.impl.PreguntaDaoImpl;
import dao.impl.PreguntaOpcionDaoImpl;
import dao.impl.RolDaoImpl;
import dao.impl.RolEnlaceDaoImpl;
import dao.impl.SedeDaoImpl;
import dao.impl.UsuarioDaoImpl;

/**
 * <strong>MySqlDAOFactory</strong> <br>
 * Fábrica de Dao's MySQL
 * 
 * @author CruzadoJ
 */
public class MySqlDAOFactory extends Factory {
	
	@Override
	public AlumnoDao getAlumnoDAO() {
		return new AlumnoDaoImpl();
	}

	@Override
	public CursoDao getCursoDAO() {
		return new CursoDaoImpl();
	}

	@Override
	public AlumnoCursoDao getAlumnoCursoDAO() {
		return new AlumnoCursoDaoImpl();
	}

	@Override
	public ExamenDao getExamenDAO() {
		return new ExamenDaoImpl();
	}

	@Override
	public CursoExamenDao getCursoExamenDAO() {
		return new CursoExamenDaoImpl();
	}

	@Override
	public AlumnoExamenDao getAlumnoExamenDAO() {
		return new AlumnoExamenDaoImpl();
	}

	@Override
	public PreguntaDao getPreguntaDAO() {
		return new PreguntaDaoImpl();
	}

	@Override
	public CursoPreguntaDao getCursoPreguntaDAO() {
		return new CursoPreguntaDaoImpl();
	}

	@Override
	public ExamenPreguntaDao getExamenPreguntaDAO() {
		return new ExamenPreguntaDaoImpl();
	}

	@Override
	public PreguntaOpcionDao getPreguntaOpcionDAO() {
		return new PreguntaOpcionDaoImpl();
	}

	@Override
	public AlumnoRespuestaDao getAlumnoRespuestaDAO() {
		return new AlumnoRespuestaDaoImpl();
	}

	@Override
	public RolDao getRolDAO() {
		return new RolDaoImpl();
	}

	@Override
	public UsuarioDao getUsuarioDAO() {
		return new UsuarioDaoImpl();
	}

	@Override
	public EnlaceDao getEnlaceDAO() {
		return new EnlaceDaoImpl();
	}

	@Override
	public RolEnlaceDao getRolEnlaceDAO() {
		return new RolEnlaceDaoImpl();
	}

	@Override
	public DocenteDao getDocenteDAO() {
		return new DocenteDaoImpl();
	}

	@Override
	public SedeDao getSedeDAO() {
		return new SedeDaoImpl();
	}

	@Override
	public DocenteCursoDao getDocenteCursoDAO() {
		return new DocenteCursoDaoImpl();
	}
	
}
