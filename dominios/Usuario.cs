using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Usuario
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string User { get; set; }
        public string Contrasenia { get; set; }
        public TipoUsuario TipoUsuario { get; set; }
        public Usuario(string user, string pass)
        {
            User = user;
            Contrasenia = pass;
        }
    }
}
