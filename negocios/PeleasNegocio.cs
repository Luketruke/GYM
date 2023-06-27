﻿using System;
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

                    p.Peleador1 = new Peleador();
                    p.Peleador1.Id = (int)conexion.Lector["IdPeleador1"];
                    p.Peleador1.NombreCompleto = (string)conexion.Lector["Peleador1Nombre"];
                    p.Peleador1.Dojo = new Dojo();
                    p.Peleador1.Dojo.Id = (int)conexion.Lector["IdDojoP1"];
                    p.Peleador1.Dojo.Nombre = (string)conexion.Lector["DojoP1"];

                    p.Peleador2 = new Peleador();
                    p.Peleador2.Id = (int)conexion.Lector["IdPeleador2"];
                    p.Peleador2.NombreCompleto = (string)conexion.Lector["Peleador2Nombre"];
                    p.Peleador2.Dojo = new Dojo();
                    p.Peleador2.Dojo.Id = (int)conexion.Lector["IdDojoP2"];
                    p.Peleador2.Dojo.Nombre = (string)conexion.Lector["DojoP2"];

                    p.Dojo = new Dojo();
                    p.Dojo.Id = (int)conexion.Lector["IdDojo"];
                    p.Dojo.Nombre = (string)conexion.Lector["Dojo"];

                    p.TipoPelea = new TipoPelea();
                    p.TipoPelea.Id = (int)conexion.Lector["IdTipoPelea"];
                    p.TipoPelea.Descripcion = (string)conexion.Lector["TipoPelea"];

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
        public bool eliminarPelea(int IdPelea)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarPelea");
                conexion.setearParametro("@IdPelea", IdPelea);
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
                conexion.setearParametro("@IdTipoPelea", p.TipoPelea.Id);
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

        public List<Peleador> obtenerPeleadoresSimilares(int IdPeleador1, int FiltrarXPeso, int FiltrarXPeleas, int FiltrarXEdad, int FiltrarXCategoria, int FiltrarXModalidad, decimal Peso, int Edad, int CantidadPeleas)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Peleador> lista = new List<Peleador>();
                conexion.setearProcedure("ObtenerPeleadoresSimilares");
                conexion.setearParametro("@IdPeleador1", IdPeleador1);
                conexion.setearParametro("@FiltrarXPeso", FiltrarXPeso);
                conexion.setearParametro("@FiltrarXPeleas", FiltrarXPeleas);
                conexion.setearParametro("@FiltrarXEdad", FiltrarXEdad);
                conexion.setearParametro("@FiltrarXCategoria", FiltrarXCategoria);
                conexion.setearParametro("@FiltrarXModalidad", FiltrarXModalidad);
                conexion.setearParametro("@PesoFiltro", Peso);
                conexion.setearParametro("@EdadFiltro", Edad);
                conexion.setearParametro("@CantidadPeleasFitro", CantidadPeleas);
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
                    p.Edad = (int)conexion.Lector["Edad"];
                    p.Altura = (int)conexion.Lector["Altura"];
                    p.AlturaTexto = (Convert.ToDecimal(p.Altura) / 100).ToString() + "M";
                    p.PesoTexto = p.Peso.ToString() + "KG";
                    p.CantidadPeleas = (int)conexion.Lector["CantidadPeleas"];

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
        public Pelea obtenerPeleaPorId(int IdPelea)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerPeleaPorId");
                conexion.setearParametro("@IdPelea", IdPelea);
                dt.Load(conexion.ejecutarConexion());

                Pelea p = new Pelea();

                p.Id = Convert.ToInt32(dt.Rows[0]["Id"]);
                p.Codigo = Convert.ToInt32(dt.Rows[0]["Codigo"]);
                //p.FechaPelea = Convert.ToD ateTime(dt.Rows[0]["FechaPelea"]);
                p.Observaciones = dt.Rows[0]["Observaciones"].ToString();

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(dt.Rows[0]["IdDojo"]);
                p.Dojo.Nombre = dt.Rows[0]["Dojo"].ToString();

                //Peleador1

                p.Peleador1 = new Peleador();
                p.Peleador1.Id = (int)conexion.Lector["IdP1"];
                p.Peleador1.Codigo = (int)conexion.Lector["CodigoP1"];
                p.Peleador1.NombreCompleto = (string)conexion.Lector["Peleador1Nombre"];
                p.Peleador1.Peso = (decimal)conexion.Lector["PesoP1"];
                p.Peleador1.Altura = (int)conexion.Lector["AlturaP1"];
                p.Peleador1.CantidadPeleas = (int)conexion.Lector["CantidadPeleasP1"];

                p.Peleador1.Categoria = new Categoria();
                p.Peleador1.Categoria.Id = (int)conexion.Lector["IdCategoriaP1"];
                p.Peleador1.Categoria.Descripcion = (string)conexion.Lector["CategoriaP1"];

                p.Peleador1.TipoPelea = new TipoPelea();
                p.Peleador1.TipoPelea.Id = (int)conexion.Lector["IdTipoPeleaP1"];
                p.Peleador1.TipoPelea.Descripcion = (string)conexion.Lector["TipoPeleaP1"];

                p.Peleador1.Dojo = new Dojo();
                p.Peleador1.Dojo.Id = (int)conexion.Lector["IdDojoP1"];
                p.Peleador1.Dojo.Nombre = (string)conexion.Lector["DojoP1"];
               
                p.Peleador1.Genero = new Genero();
                p.Peleador1.Genero.Id = (int)conexion.Lector["IdGeneroP1"];
                p.Peleador1.Genero.GeneroPersona = (string)conexion.Lector["GeneroP1"];

                //Peleador2

                p.Peleador2 = new Peleador();
                p.Peleador2.Id = (int)conexion.Lector["IdP2"];
                p.Peleador2.Codigo = (int)conexion.Lector["CodigoP2"];
                p.Peleador2.NombreCompleto = (string)conexion.Lector["Peleador2Nombre"];
                p.Peleador2.Peso = (decimal)conexion.Lector["PesoP2"];
                p.Peleador2.Altura = (int)conexion.Lector["AlturaP2"];
                p.Peleador2.CantidadPeleas = (int)conexion.Lector["CantidadPeleasP2"];
                          
                p.Peleador2.Categoria = new Categoria();
                p.Peleador2.Categoria.Id = (int)conexion.Lector["IdCategoriaP2"];
                p.Peleador2.Categoria.Descripcion = (string)conexion.Lector["CategoriaP2"];

                p.Peleador2.TipoPelea = new TipoPelea();
                p.Peleador2.TipoPelea.Id = (int)conexion.Lector["IdTipoPeleaP2"];
                p.Peleador2.TipoPelea.Descripcion = (string)conexion.Lector["TipoPeleaP2"];

                p.Peleador2.Dojo = new Dojo();
                p.Peleador2.Dojo.Id = (int)conexion.Lector["IdDojoP2"];
                p.Peleador2.Dojo.Nombre = (string)conexion.Lector["DojoP2"];
                          
                p.Peleador2.Genero = new Genero();
                p.Peleador2.Genero.Id = (int)conexion.Lector["IdGeneroP2"];
                p.Peleador2.Genero.GeneroPersona = (string)conexion.Lector["GeneroP2"];

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
        public DataTable obtenerTipoPeleas() //Para llenar dropdownlist de tipoPeleas
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerTipoPeleas");
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
        public bool modificarPelea(Pelea p)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarPelea");
                conexion.setearParametro("@Id", p.Id);
                conexion.setearParametro("@IdPeleador1", p.Peleador1.Id);
                conexion.setearParametro("@IdPeleador2", p.Peleador2.Id);
                conexion.setearParametro("@IdDojo", p.Dojo.Id);
                conexion.setearParametro("@IdTipoPelea", p.TipoPelea.Id);
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
    }
}
