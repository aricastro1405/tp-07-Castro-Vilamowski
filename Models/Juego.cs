public static class Juego{
    private static string _username{get;set;}
    private static int _puntajeActual{get;set;}
    private static int _cantidadPreguntasCorrectas{get;set;}
    private static List<Pregunta> _preguntas{get;set;}
    private static List<Respuesta> _respuestas{get;set;}
    public static void InicializarJuego(){
        _username = "";
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
    }
    public static List<Categoria> ObtenerCategorias(){
        return BD.ObtenerCategorias();
    }
    public static List<Dificultad> ObtenerDificultades(){
        return BD.ObtenerDificultades();
    }
    public static void CargarPartida(string username, int dificultad, int categoria){
        _preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
    }
    public static List<Pregunta> ObtenerProximaPregunta(){
        int cantidad = BD._ListadoPreguntas.Count;
        Random rnd = new Random();
        int num = rnd.Next(0, cantidad);
        return _ListadoPreguntas[num];
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
       foreach(rta Respuesta in _respuestas){
            if(rta.IdPregunta==idPregunta){
                _respuestas.Add(rta);
            }
       } 
       return _respuestas;
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
        bool correcta = false;
        foreach(rta Respuesta in _respuestas){
            if(rta.IdRespuesta == idRespuesta){
                correcta=rta.Correcta == true;
            }
        }
        if(correcta){
            _puntajeActual += 5;
            _cantidadPreguntasCorrectas++;
            foreach(preg Pregunta in _preguntas){
                if(preg.IdPregunta == idPregunta) _preguntas.Remove(preg);
            }
        }
       return correcta;
    }
}