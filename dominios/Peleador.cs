using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Peleador
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string NombreCompleto { get; set; }
        public decimal Peso { get; set; }
        public string PesoTexto { get; set; }
        public int Altura { get; set; }
        public int DNI { get; set; }
        public string AlturaTexto { get; set; }
        public int Edad { get; set; }
        public int CantidadPeleas { get; set; }
        public Dojo Dojo { get; set; }
        public TipoPelea TipoPelea { get; set; }
        public Categoria Categoria { get; set; }
        public Genero Genero { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaInformacion { get; set; }

    }
}
