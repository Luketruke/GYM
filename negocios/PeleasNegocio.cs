using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominios;

namespace negocios
{
    public class PeleasNegocio
    {
        public List<Pelea> obtenerPeleasTodas() //Para llenar el datagridview Peleas
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Pelea> lista = new List<Pelea>();
                conexion.setearProcedure("obtenerPeleasTodas");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Pelea p = new Pelea();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (int)conexion.Lector["Codigo"];
                    p.Observaciones = (string)conexion.Lector["Observaciones"];
                    p.FechaPelea = (DateTime)conexion.Lector["FechaPelea"];

                    p.Peleador1 = new Peleador();
                    p.Peleador1.NombreCompleto = (string)conexion.Lector["Peleador1Nombre"];

                    p.Peleador2 = new Peleador();
                    p.Peleador2.NombreCompleto = (string)conexion.Lector["Peleador2Nombre"];

                    p.Dojo = new Dojo();
                    p.Dojo.Id = (int)conexion.Lector["IdDojo"];
                    p.Dojo.Nombre = (string)conexion.Lector["Dojo"];

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
        public bool agregarPelea(Pelea p)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarPelea");
                conexion.setearParametro("@Codigo", 0);
                conexion.setearParametro("@IdPeleador1", p.Peleador1.Id);
                conexion.setearParametro("@IdPeleador2", p.Peleador2.Id);
                conexion.setearParametro("@IdDojo", p.Dojo.Id);
                conexion.setearParametro("@Observaciones", p.Observaciones);
                conexion.setearParametro("@FechaPelea", p.FechaPelea);
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
        public DataTable obtenerPeleadores1() //Para llenar dropdownlist de peleador1 en PeleasABM
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleadores1Pelea");
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
        public DataTable obtenerPeleadores2(int IdPeleador1) //Para llenar dropdownlist de peleador2 en PeleasABM
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleadores2Pelea");
                conexion.setearParametro("@IdPeleador1", IdPeleador1);
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
        public DataTable obtenerPeleadores1Filtrados(string txtBuscar) //Para llenar dropdownlist de peleador1 en PeleasABM
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleadores1PeleaFiltrados");
                conexion.setearParametro("@txtBuscar", txtBuscar);
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
        public DataTable obtenerPeleadores2Filtrados(int IdPeleador, string txtBuscar) //Para llenar dropdownlist de peleador1 en PeleasABM
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleadores1PeleaFiltrados");
                conexion.setearParametro("@IdPeleador", IdPeleador);
                conexion.setearParametro("@txtBuscar", txtBuscar);
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

        public List<Peleador> obtenerPeleadoresSimilares(int IdPeleador1)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Peleador> lista = new List<Peleador>();
                conexion.setearProcedure("ObtenerPeleadoresSimilares");
                conexion.setearParametro("@IdPeleador1", IdPeleador1);
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
                    p.CantidadPeleas = (int)conexion.Lector["CantidadPeleas"];

                    p.Categoria = new Categoria();
                    p.Categoria.Id = (int)conexion.Lector["IdCategoria"];
                    p.Categoria.Descripcion = (string)conexion.Lector["Categoria"];

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
        public DataTable obtenerPeleadorPorId(int IdPeleador)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleadorPorId");
                conexion.setearParametro("@IdPeleador", IdPeleador);
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
