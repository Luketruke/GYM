using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Pelea
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public Peleador Peleador1 { get; set; }
        public Peleador Peleador2 { get; set; }
        public Dojo Dojo { get; set; }
        public DateTime FechaPelea { get; set; }
        public TipoPelea TipoPelea { get; set; }
        public string Observaciones { get; set; }
    }
}
