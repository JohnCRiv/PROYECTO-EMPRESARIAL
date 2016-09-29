package generico;

import java.util.List;

import util.Parametro;

public interface GenericoService<T> {
	
	/**
	 * <strong>Registrar</strong> <br>
	 * M�todo que registra una entidad.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param bean
	 * 			Entidad a registrar.
	 */
	public void registrar(T bean);
	
	/**
	 * <strong>Actualizar</strong> <br>
	 * M�todo que actualiza una entidad.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param bean
	 * 			Entidad a actualizar.
	 */
	public void actualizar(T bean);
	
	/**
	 * <strong>Buscar</strong> <br>
	 * M�todo que busca una entidad.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param pk
	 * 			Objeto Pk de la entidad a buscar.
	 */
	public T buscar(Object pk);
	
	/**
	 * <strong>Eliminar</strong> <br>
	 * M�todo que elimina una entidad.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param bean
	 * 			Entidad a eliminar.
	 */
	public void eliminar(T bean);
	
	/**
	 * <strong>Listar Todos</strong> <br>
	 * M�todo que lista todos los registros de una entidad.
	 * 
	 * @author CruzadoJ
	 * 
	 */
	public List<T> listarTodos();
	
	/**
	 * <strong>Listar Por Query</strong> <br>
	 * M�todo que lista los registros de una entidad
	 * por sentencia completa JPQL. <br>
	 * El query de la sentencia JPQL debe tener la forma : <br>
	 * 'Select e from entity e where...' <br>
	 * Donde 'entity' es la entidad a consultar.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param query
	 * 			Sentencia completa JPQL.
	 * 
	 * @return {@link List} Lista de los registros obtenidos 
	 * 					    de la sentencia JPQL.
	 */
	public List<T> listarPorQuery(String query);
	
	/**
	 * <strong>Listar Por Where Query</strong> <br>
	 * M�todo que lista los registros de una entidad
	 * por sentencia where JPQL. <br>
	 * El query de la sentencia JPQL debe tener la forma : <br>
	 * 'where {@linkplain entity}.attribute = value' <br>
	 * Donde '{@linkplain entity}' es el alias por defecto y obligatorio para ejecutar
	 * correctamente la sentencia. <br>
	 * 'Attribute' es el atributo de la entidad a condicionar. <br>
	 * 'Value' es el valor condicional del atributo.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param whereQuery
	 * 			Sentencia Where JPQL
	 * 
	 * @return {@link List} Lista de los registros obtenidos 
	 * 					    de la sentencia where JPQL. 
	 */
	public List<T> listarPorWhereQuery(String whereQuery);
	
	/**
	 * <strong>Listar Por Where Query</strong> <br>
	 * M�todo que lista los registros de una entidad
	 * por sentencia where JPQL. <br>
	 * El query de la sentencia JPQL debe tener la forma : <br>
	 * 'where {@linkplain entity}.attribute = ?' <br>
	 * Donde '{@linkplain entity}' es el alias por defecto y obligatorio para ejecutar
	 * correctamente la sentencia. <br>
	 * 'Attribute' es el atributo de la entidad a condicionar. <br>
	 * '?' es el par�metro condicional del atributo.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param whereQuery
	 * 			Sentencia Where JPQL
	 * 
	 * @param parametros
	 * 			Lista de parametros de la sentencia JPQL.
	 * 
	 * @return {@link List} Lista de los registros obtenidos 
	 * 					    de la sentencia where JPQL. 
	 */
	public List<T> listarPorWhereQuery(String whereQuery, List<Parametro> parametros);
	
}
