using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Direccion
    {
        public int Id { get; set; }
        public string DireccionDojo { get; set; }
        public string DireccionCompleta { get; set; }
        public string Localidad { get; set; }
        public int IdLocalidad { get; set; }
        public string Provincia { get; set; }
        public int IdProvincia { get; set; }
        public string Observaciones { get; set; }
    }
}
