using Microsoft.AspNetCore.Mvc;

namespace TPBase.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View("Index");
    }
    
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.listaCategorias = Juego.ObtenerCategorias();
        ViewBag.listaDificultades = Juego.ObtenerDificultades();
        return View("ConfigurarJuego");
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        if(BD.ObtenerPreguntas.Count == 0){
            return RedirectToAction("ConfigurarJuego");
        }
        else{
            return View("Jugar");
        }
    }

    public IActionResult Jugar()
    {
        ViewBag.preg = Juego.ObtenerProximaPregunta();
        if(Juego.ObtenerProximaPregunta != null){
            ViewBag.rtas = Juego.ObtenerProximasRespuestas(idPregunta);
            return View("Juego");
        }
        else{
            return View("Fin");
        }
    }
    
    public IActionResult  VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        Juego.VerificarRespuesta(idPregunta, idRespuesta);
        ViewBag.rtaCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
    }
}
