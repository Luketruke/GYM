using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Dojo
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public Direccion Direccion { get; set; }
        public string NombreProfesor { get; set; }
        public string TelefonoProfesor { get; set; }
        public string TelefonoDojo { get; set; }
        public string Observaciones { get; set; }
    }
}
