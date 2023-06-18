﻿using System;
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
        public List<Peleador> obtenerPeleadoresTodos()
        {
            List<Peleador> lista = new List<Peleador>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
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
                lista = null;
                return lista;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerCategorias() //Para llenar dropdownlist de categorias
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerCategoriasPeleadores");
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerGeneros() //Para llenar dropdownlist de generos
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerGenerosPeleadores");
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerPeleadores1Pelea() //Para llenar dropdownlist de peleador1 en PeleasABM
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("obtenerPeleadores1Pelea");
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public int agregarPeleador(Peleador p)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarPeleador");
                conexion.setearParametro("@Nombre", p.Nombre) ;
                conexion.setearParametro("@Apellido", p.Apellido);
                conexion.setearParametro("@Peso", p.Peso);
                conexion.setearParametro("@Altura", p.Altura);
                conexion.setearParametro("@CantidadPeleas", p.CantidadPeleas);
                conexion.setearParametro("@IdCategoria", p.Categoria.Id);
                conexion.setearParametro("@IdDojo", p.Dojo.Id);
                conexion.setearParametro("@IdGenero", p.Genero.Id);

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
                conexion.setearParametro("@Altura", p.Altura);
                conexion.setearParametro("@CantidadPeleas", p.CantidadPeleas);
                conexion.setearParametro("@IdCategoria", p.Categoria.Id);
                conexion.setearParametro("@IdDojo", p.Dojo.Id);
                conexion.setearParametro("@IdGenero", p.Genero.Id);

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
        public Peleador obtenerPeleadorPorId(int IdPeleador)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
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
                p.Altura = Convert.ToInt32(dt.Rows[0]["Altura"]);
                p.CantidadPeleas = Convert.ToInt32(dt.Rows[0]["CantidadPeleas"]);

                p.Categoria = new Categoria();               
                p.Categoria.Descripcion = dt.Rows[0]["Categoria"].ToString();
                p.Categoria.Id = Convert.ToInt32(dt.Rows[0]["IdCategoria"]);

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
    }
}