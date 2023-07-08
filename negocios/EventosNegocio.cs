using dominios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocios
{
    //Logica para los eventos
    //IdEstadoEvento = 1 = Pendiente
    //IdEstadoEvento = 1 = Finalizado
    public class EventosNegocio
    {
        public List<Evento> obtenerEventosTodos() //Para llenar los DataGridView
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Evento> lista = new List<Evento>();
                conexion.setearProcedure("obtenerEventosTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Evento e = new Evento();

                    e.Id = (int)conexion.Lector["Id"];
                    e.Descripcion = (string)conexion.Lector["Descripcion"];
                    e.FechaEvento = (DateTime)conexion.Lector["FechaEvento"];
                    e.IdEstadoEvento = e.Id = (int)conexion.Lector["IdEstadoEvento"];
                    e.EstadoEvento = (string)conexion.Lector["EstadoEvento"];
                    e.Observaciones = (string)conexion.Lector["Observaciones"];

                    lista.Add(e);
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
        public Evento obtenerEventoXId(int IdEvento) //Para llenar el Modal de Peleador
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("obtenerEventoXId");
                conexion.setearParametro("@IdEvento", IdEvento);
                dt.Load(conexion.ejecutarConexion());

                Evento e = new Evento();

                e.Id = Convert.ToInt32(dt.Rows[0]["Id"]);
                e.Descripcion = dt.Rows[0]["Descripcion"].ToString();
                e.FechaEvento = Convert.ToDateTime(dt.Rows[0]["FechaEvento"]);
                e.IdEstadoEvento = Convert.ToInt32(dt.Rows[0]["IdEstadoEvento"]);
                e.EstadoEvento = dt.Rows[0]["EstadoEvento"].ToString();
                e.Observaciones = dt.Rows[0]["Observaciones"].ToString();

                return e;
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
        public int AgregarEvento(Evento ev)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarEvento");
                conexion.setearParametro("@Descripcion", ev.Descripcion);
                conexion.setearParametro("@FechaEvento", ev.FechaEvento);
                conexion.setearParametro("@Observaciones", ev.Observaciones);

                int IdEvento = conexion.ejecutarScalar();

                return IdEvento;
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
        public bool VerificarEventosPendientes()
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("VerificarEventosPendientes");
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
    }
}
