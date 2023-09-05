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
        _preguntas = new List<Pregunta>();
        _respuestas = new List<Respuesta>();
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
        _username=username;
    }
    public static Pregunta ObtenerProximaPregunta(){
        int cantidad = _preguntas.Count;
        Random rnd = new Random();
        int num = rnd.Next(0, cantidad);
        if(cantidad==0){
            _preguntas[num]=null;
        }
        return _preguntas[num];
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
       List<Respuesta> _respuestasPregunta = new List<Respuesta>();
       foreach(Respuesta rta  in _respuestas){
            if(rta.IdPregunta==idPregunta){
                _respuestasPregunta.Add(rta);
            }
       } 
       return _respuestasPregunta;
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
        bool Correcta = false;
        foreach(Respuesta rta  in _respuestas){
            if(rta.IdRespuesta == idRespuesta){
                Correcta=(rta.correcta == true);
            }
        }
        if(Correcta){
            _puntajeActual += 5;
            _cantidadPreguntasCorrectas++;
            Pregunta remover = null;
            foreach(Pregunta preg  in _preguntas){
                if(preg.IdPregunta == idPregunta) remover = preg;
            }
            _preguntas.Remove(remover);
        }
       return Correcta;
    }
}