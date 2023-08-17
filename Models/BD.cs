using System.Data.SqlClient;
using Dapper;
public static class BD{
    private static string _connectionString=@"Server=localhost; Database=PreguntadORT; Trusted_Connection=True;";
    private static List<Categoria> _ListadoCategorias = new List<Categoria>
    public static List<Categoria> ObtenerCategorias(){
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SELECT * FROM Categoria";
            _ListadoCategorias = db.Query<Categoria>(sql).ToList();
        }
        return _ListadoCategorias;
    }
    private static List<Dificultad> _ListadoDificultades = new List<Dificultad>
    public static List<Dificultad> ObtenerDificultades(){
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SELECT * FROM Dificultad";
            _ListadoDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return _ListadoDificultades;
    }
    private static List<Pregunta> _ListadoPreguntas = new List<Pregunta>
    public static List<Pregunta>  ObtenerPreguntas(int dificultad, int categoria){
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SELECT * FROM Pregunta";
            if (dificultad != -1) {
                sql = sql + " WHERE IdDificultad=@pIdDificultad";
                if (categoria != -1) sql = sql + " AND IdCategoria=@pIdDificultad";
            }
            else if (categoria != -1) sql = sql + " WHERE IdCategoria=@pIdCategoria";
            _ListadoPreguntas =db.Query<Pregunta>(sql, new {pIdDificultad = dificultad}, new{pIdCategoria=cate}).ToList();
        }
        return _ListadoPreguntas;
    }
    private static List<Respuesta> _ListadoRespuestas = new List<Respuesta>
    private static List<Respuesta> _Listadorespuesta = new List<Respuesta>
    public static List<Respuesta>ObtenerRespuestas(List<Pregunta> _ListadoPreguntas){
        using(SqlConnection db = new SqlConnection(_connectionString)){
        foreach(preg Pregunta in _ListadoPreguntas){
            string sql = "SELECT * FROM Respuesta WHERE IdPregunta = @preg.IdPregunta";
            _Listadorespuesta.AddRange(sql);
            _ListadoRespuestas = db.Query<Respuesta>(sql).ToList();
        }
        }
        return _ListadoRespuestas;
    }
}