using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Evento
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaEvento { get; set; }
        public int IdEstadoEvento { get; set; }
        public string EstadoEvento { get; set; }
        public string Observaciones { get; set; }
    }
}
