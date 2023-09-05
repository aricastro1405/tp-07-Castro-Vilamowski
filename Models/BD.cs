using System.Data.SqlClient;
using Dapper;
public static class BD{
    private static string _connectionString=@"Server=localhost; Database=PreguntadORT; Trusted_Connection=True;";
    private static List<Categoria> _ListadoCategorias = new List<Categoria>();
    public static List<Categoria> ObtenerCategorias(){
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SELECT * FROM Categoria";
            _ListadoCategorias = db.Query<Categoria>(sql).ToList();
        }
        return _ListadoCategorias;
    }
    private static List<Dificultad> _ListadoDificultades = new List<Dificultad>();
    public static List<Dificultad> ObtenerDificultades(){
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SELECT * FROM Dificultad";
            _ListadoDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return _ListadoDificultades;
    }
 
    public static List<Pregunta>  ObtenerPreguntas(int IdDificultad, int IdCategoria){
        List<Pregunta> _ListadoPreguntas = new List<Pregunta>();
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SELECT * FROM Pregunta";
            if (IdDificultad != -1) {
                sql = sql + " WHERE IdDificultad=@pIdDificultad";
                if (IdCategoria != -1) sql = sql + " AND IdCategoria=@pIdCategoria";
            }
            else if (IdCategoria != -1) sql = sql + " WHERE IdCategoria=@pIdCategoria";
            _ListadoPreguntas =db.Query<Pregunta>(sql, new {pIdDificultad = IdDificultad , pIdCategoria=IdCategoria}).ToList();
        }
        return _ListadoPreguntas;
    }
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> _ListadoPreguntas){
        List<Respuesta> _ListadoRespuestas = new List<Respuesta>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
        foreach(Pregunta preg in _ListadoPreguntas){
            string sql = "SELECT * FROM Respuesta WHERE IdPregunta = " + preg.IdPregunta;
            _ListadoRespuestas.AddRange(db.Query<Respuesta>(sql).ToList());

        }
        }
        return _ListadoRespuestas;
    }
}