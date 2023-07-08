using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominios;

namespace negocios
{
    public class PeleadoresNegocio
    {
        public List<Peleador> obtenerPeleadoresTodos() //Para llenar el DataGridView
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Peleador> lista = new List<Peleador>();
                conexion.setearProcedure("ObtenerPeleadoresTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Peleador p = new Peleador();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (int)conexion.Lector["Codigo"];
                    p.Nombre = (string)conexion.Lector["Nombre"];
                    p.Apellido = (string)conexion.Lector["Apellido"];
                    p.NombreCompleto = (string)conexion.Lector["NombreCompleto"];
                    p.Peso = (decimal)conexion.Lector["Peso"];
                    p.Altura = (int)conexion.Lector["Altura"];
                    p.Edad = (int)conexion.Lector["Edad"];
                    p.CantidadPeleas = (int)conexion.Lector["CantidadPeleas"];
                    p.Observaciones = (string)conexion.Lector["Observaciones"];

                    p.Categoria = new Categoria();
                    p.Categoria.Id = (int)conexion.Lector["IdCategoria"];
                    p.Categoria.Descripcion = (string)conexion.Lector["Categoria"];

                    p.TipoPelea = new TipoPelea();
                    p.TipoPelea.Id = (int)conexion.Lector["IdTipoPelea"];
                    p.TipoPelea.Descripcion = (string)conexion.Lector["TipoPelea"];

                    p.Dojo = new Dojo();
                    p.Dojo.Id = (int)conexion.Lector["IdDojo"];
                    p.Dojo.Nombre = (string)conexion.Lector["Dojo"];

                    p.Genero = new Genero();
                    p.Genero.Id = (int)conexion.Lector["IdGenero"];
                    p.Genero.GeneroPersona = (string)conexion.Lector["Genero"];

                    lista.Add(p);
                }
                return lista;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public List<Peleador> obtenerPeleadoresTodosXDojo(int IdDojo) //Para llenar el DataGridView x Profesor
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Peleador> lista = new List<Peleador>();
                conexion.setearProcedure("obtenerPeleadoresTodosXDojo");
                conexion.setearParametro("@IdDojo", IdDojo);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Peleador p = new Peleador();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (int)conexion.Lector["Codigo"];
                    p.Nombre = (string)conexion.Lector["Nombre"];
                    p.Apellido = (string)conexion.Lector["Apellido"];
                    p.NombreCompleto = (string)conexion.Lector["NombreCompleto"];
                    p.Peso = (decimal)conexion.Lector["Peso"];
                    p.Altura = (int)conexion.Lector["Altura"];
                    p.Edad = (int)conexion.Lector["Edad"];
                    p.CantidadPeleas = (int)conexion.Lector["CantidadPeleas"];
                    p.Observaciones = (string)conexion.Lector["Observaciones"];

                    p.Categoria = new Categoria();
                    p.Categoria.Id = (int)conexion.Lector["IdCategoria"];
                    p.Categoria.Descripcion = (string)conexion.Lector["Categoria"];

                    p.TipoPelea = new TipoPelea();
                    p.TipoPelea.Id = (int)conexion.Lector["IdTipoPelea"];
                    p.TipoPelea.Descripcion = (string)conexion.Lector["TipoPelea"];

                    p.Dojo = new Dojo();
                    p.Dojo.Id = (int)conexion.Lector["IdDojo"];
                    p.Dojo.Nombre = (string)conexion.Lector["Dojo"];

                    p.Genero = new Genero();
                    p.Genero.Id = (int)conexion.Lector["IdGenero"];
                    p.Genero.GeneroPersona = (string)conexion.Lector["Genero"];

                    lista.Add(p);
                }
                return lista;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public Peleador obtenerPeleadorPorId(int IdPeleador) //Para llenar el Modal de Peleador
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleadorPorId");
                conexion.setearParametro("@IdPeleador", IdPeleador);
                dt.Load(conexion.ejecutarConexion());

                Peleador p = new Peleador();

                p.Id = Convert.ToInt32(dt.Rows[0]["IdPeleador"]);
                p.Codigo = Convert.ToInt32(dt.Rows[0]["Codigo"]);
                p.Nombre = dt.Rows[0]["Nombre"].ToString();
                p.Apellido = dt.Rows[0]["Apellido"].ToString();
                p.NombreCompleto = dt.Rows[0]["NombreCompleto"].ToString();
                p.Peso = Convert.ToInt32(dt.Rows[0]["Peso"]);
                p.Edad = Convert.ToInt32(dt.Rows[0]["Edad"]);
                p.Altura = Convert.ToInt32(dt.Rows[0]["Altura"]);
                p.CantidadPeleas = Convert.ToInt32(dt.Rows[0]["CantidadPeleas"]);
                p.Observaciones = dt.Rows[0]["Observaciones"].ToString();

                p.Categoria = new Categoria();
                p.Categoria.Descripcion = dt.Rows[0]["Categoria"].ToString();
                p.Categoria.Id = Convert.ToInt32(dt.Rows[0]["IdCategoria"]);

                p.TipoPelea = new TipoPelea();
                p.TipoPelea.Descripcion = dt.Rows[0]["TipoPelea"].ToString();
                p.TipoPelea.Id = Convert.ToInt32(dt.Rows[0]["IdTipoPelea"]);

                p.Dojo = new Dojo();
                p.Dojo.Nombre = dt.Rows[0]["Dojo"].ToString();
                p.Dojo.Id = Convert.ToInt32(dt.Rows[0]["IdDojo"]);

                p.Genero = new Genero();
                p.Genero.GeneroPersona = dt.Rows[0]["Genero"].ToString();
                p.Genero.Id = Convert.ToInt32(dt.Rows[0]["IdGenero"]);

                return p;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public int agregarPeleador(Peleador p)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarPeleador");
                conexion.setearParametro("@Nombre", p.Nombre);
                conexion.setearParametro("@Apellido", p.Apellido);
                conexion.setearParametro("@Peso", p.Peso);
                conexion.setearParametro("@Altura", p.Altura);
                conexion.setearParametro("@Edad", p.Edad);
                conexion.setearParametro("@CantidadPeleas", p.CantidadPeleas);
                conexion.setearParametro("@IdCategoria", p.Categoria.Id);
                conexion.setearParametro("@IdTipoPelea", p.TipoPelea.Id);
                conexion.setearParametro("@IdDojo", p.Dojo.Id);
                conexion.setearParametro("@IdGenero", p.Genero.Id);
                conexion.setearParametro("@Observaciones", p.Observaciones);

                int IdPeleador = conexion.ejecutarScalar();

                return IdPeleador;
            }
            catch (Exception)
            {
                return -1;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public bool modificarPeleador(Peleador p)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarPeleador");
                conexion.setearParametro("@IdPeleador", p.Id);
                conexion.setearParametro("@Nombre", p.Nombre);
                conexion.setearParametro("@Apellido", p.Apellido);
                conexion.setearParametro("@Peso", p.Peso);
                conexion.setearParametro("@Edad", p.Edad);
                conexion.setearParametro("@Altura", p.Altura);
                conexion.setearParametro("@CantidadPeleas", p.CantidadPeleas);
                conexion.setearParametro("@IdCategoria", p.Categoria.Id);
                conexion.setearParametro("@IdTipoPelea", p.TipoPelea.Id);
                conexion.setearParametro("@IdDojo", p.Dojo.Id);
                conexion.setearParametro("@IdGenero", p.Genero.Id);
                conexion.setearParametro("@Observaciones", p.Observaciones);

                conexion.ejecutarConexion();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public bool VerificarPeleasAlEliminarPeleadores(int IdPeleador)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("VerificarPeleasAlEliminarPeleadores");
                conexion.setearParametro("@IdPeleador", IdPeleador);
                dt.Load(conexion.ejecutarConexion());

                if (dt.Rows.Count>0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public bool eliminarPeleador(int IdPeleador)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarPeleador");
                conexion.setearParametro("@IdPeleador", IdPeleador);

                conexion.ejecutarConexion();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerCategorias() //Para llenar DropDownList de las categorias de los peleadores
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerCategoriasPeleadores");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable obtenerGeneros() //Para llenar DropDownList de Generos
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerGenerosPeleadores");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable ExportarPeleadoresAExcel()
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ExportarPeleadoresAExcel");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}