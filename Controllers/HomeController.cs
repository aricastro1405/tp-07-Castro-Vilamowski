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

    public IActionResult Comenzar(string username, int IdDificultad, int IdCategoria)
    {
        Juego.CargarPartida(username, IdDificultad, IdCategoria);
        ViewBag.user = username;
        if(Juego.ObtenerProximaPregunta() == null){
            return RedirectToAction("ConfigurarJuego");
        }
        else{
            return RedirectToAction("Jugar");
        }
    }

    public IActionResult Jugar()
    {
        ViewBag.preg = Juego.ObtenerProximaPregunta();
        if(ViewBag.preg != null){
            ViewBag.rtas = Juego.ObtenerProximasRespuestas(ViewBag.preg.IdPregunta);
            return View("Juego");
        }
        else{
            return View("Fin");
        }
    }
    
    public IActionResult  VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.rtaCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
    }
}
