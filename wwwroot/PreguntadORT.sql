USE [master]
GO
/****** Object:  Database [PreguntadORT]    Script Date: 3/8/2023 15:11:01 ******/
CREATE DATABASE [PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadORT', N'ON'
GO
ALTER DATABASE [PreguntadORT] SET QUERY_STORE = OFF
GO
USE [PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 3/8/2023 15:11:01 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/8/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 3/8/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 3/8/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [text] NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 3/8/2023 15:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Arte', N'https://static.wikia.nocookie.net/preguntados-juego/images/2/2e/Arte.png/revision/latest?cb=20171009212238&path-prefix=es')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Entretenimiento', N'https://static.wikia.nocookie.net/preguntados-juego/images/e/e0/Entretenimiento.png/revision/latest?cb=20171009154517&path-prefix=es')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Deporte', N'https://static.wikia.nocookie.net/preguntados-juego/images/a/a3/Deportes.png/revision/latest?cb=20171009155146&path-prefix=es')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Historia', N'https://static.wikia.nocookie.net/preguntados-juego/images/3/31/Hector.png/revision/latest/scale-to-width-down/250?cb=20180802234908&path-prefix=es')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Ciencia', N'https://static.wikia.nocookie.net/preguntados-juego/images/3/30/Ciencia.png/revision/latest?cb=20171009212518&path-prefix=es')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (6, N'Geografia', N'https://2.bp.blogspot.com/-WtQS6pQgLpc/U3sQoEKELWI/AAAAAAAAAE4/CLSZmwfV9D4/s1600/geografia.png')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultad] ON 

INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (2, N'Intermedio')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 1, 1, N' ¿Quién pintó “la última cena”?', N'https://cdn.culturagenial.com/es/imagenes/1200px-the-last-supper-leonardo-da-vinci-high-resolution-32x16-cke.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 1, 2, N'¿Cuál es la pintura más cara vendida en la actualidad?', N'https://www.newbondstreetpawnbrokers.com/wp-content/uploads/2018/08/expensive-art1-1024x832.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿Quién pintó la Capilla Sixtina?', N'https://historia.nationalgeographic.com.es/medio/2020/11/16/los-frescos-de-la-capilla-sixtina_524a057f_1104x868.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 2, 1, N'¿En qué ciudad vive el mago de Oz?', N'https://www.sintetia.com/wp-content/uploads/2022/12/mago-de-oz.jpeg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 2, 2, N'¿Cuál es el nombre del perro de Tintín? ', N'https://www.diariodesevilla.es/2017/05/23/vital/curiosity/Tintin-inseparable-Milu_1138396797_68930192_667x375.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 2, 3, N'¿En qué calle ficticia vivía Sherlock Holmes?', N'https://static.wikia.nocookie.net/doblaje/images/f/fa/Sherlock_Holmes_character.jpg/revision/latest?cb=20111016214250&path-prefix=es')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 3, 1, N'¿En qué ciudad nació Leo Messi?', N'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 3, 2, N'¿Qué selección ha ganado más mundiales de fútbol? ', N'https://t2.uc.ltmcdn.com/es/posts/4/2/9/cuales_han_sido_los_campeones_del_mundial_de_futbol_52924_orig.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 3, 3, N'¿Cuántos jugadores hay en un equipo de voleibol? ', N'https://www.elgrafico.com.ar/media/cache/pub_news_details_large/media/i/7b/3c/7b3c07e6c3716df97670f11e3ca2d958674e99e7.jpeg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 4, 1, N'¿Quién fue el primer presidente de Estados Unidos?', N'https://media.ambito.com/p/3cf263fef31b7dd025800288af4de349/adjuntos/239/imagenes/040/808/0040808864/eeuu.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 4, 2, N'¿Qué calavera no regresó tras el primer viaje de Colón a América?', N'https://okdiario.com/img/2018/08/06/carabelas-cristobal-colon.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (27, 4, 3, N'¿En qué ciudad vivió Marco Polo?', N'https://historia.nationalgeographic.com.es/medio/2023/06/19/marco-polo_83d58e0d_230619163942_1280x1642.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (28, 5, 1, N'¿Qué célula se encuentra tanto en humanos como en animales?', N'https://plustatic.com/496/conversions/partes-celulas-social.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (30, 5, 2, N'¿En qué mes el Sol está más cerca de la Tierra? ', N'https://okdiario.com/img/2019/11/20/-por-que-brilla-el-sol-esta-es-la-razon-655x368.jpg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (31, 5, 3, N'¿Cuántos elementos tiene la tabla periódica?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Periodic_table_large-es-updated-2018.svg/500px-Periodic_table_large-es-updated-2018.svg.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (32, 6, 1, N'¿Cuál es la capital actual de Marruecos?', N'https://fotografias.larazon.es/clipping/cmsimages01/2022/12/22/DECA45C8-F887-447C-820A-889D821FC7AD/98.jpg?crop=4800,2701,x0,y250&width=1900&height=1069&optimize=low&format=webply')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (33, 6, 2, N'¿En qué países se encuentra el Everest? ', N'https://imagenes.muyinteresante.es/files/composte_image/uploads/2023/04/24/64468dc254c55.jpeg')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (34, 6, 3, N'¿Dónde se encuentran las ruinas de Angkor? ', N'https://cadenaser00.epimg.net/ser/imagenes/2014/02/19/viajes/1392793243_941794_1476973289_noticia_normal.jpg')
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (2, 10, 1, N'Leonardo da Vinci', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 10, 2, N'Leonardo DiCaprio', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 10, 3, N'Pablo Picasso', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 10, 4, N'Vincent van Gogh', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (7, 11, 1, N'La Gioconda', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 11, 2, N'Guernica', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (9, 11, 3, N'Salvator Mundi', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 11, 4, N'Las Meninas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (11, 13, 1, N' Kustav Klimt', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 13, 2, N'Diego Velázquez', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 13, 3, N'Sandro Botticelli', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (14, 13, 4, N'Miguel Ángel', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 16, 1, N'Buenos Aires', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (16, 16, 2, N'Esmeralda', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (17, 16, 3, N'Monaco', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 16, 4, N'Estrella', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 17, 1, N'Milo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 17, 2, N'Mili', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 17, 3, N'Melanie', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 17, 4, N'Milú', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (23, 18, 1, N'Baker Street', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 18, 2, N'Parker Street', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 18, 3, N'Bakery Street', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (27, 18, 4, N'Bake Street', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (28, 19, 1, N'Buenos Aires', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 19, 2, N'Mendoza', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (30, 19, 3, N'Rosario', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 19, 4, N'La Pampa', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 21, 1, N'Brasil', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (33, 21, 2, N'China', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (34, 21, 3, N'Perú', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 21, 4, N'Argentina', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (36, 22, 1, N'8', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (37, 22, 2, N'6', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (39, 22, 3, N'7', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (40, 22, 4, N'5', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (41, 23, 1, N'Donald Trump', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (42, 23, 2, N'Barack Obama', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (43, 23, 3, N'George Washington', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (44, 23, 4, N'Tom Holland', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (45, 24, 1, N'La Santa María', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (46, 24, 2, N'La Triple Alianza', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (47, 24, 3, N'La Superpotente', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (48, 24, 4, N'La María', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (49, 27, 1, N'Roma', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (50, 27, 2, N'Venecia', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (51, 27, 3, N'Buenos Aires', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (52, 27, 4, N'Montevideo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (54, 28, 1, N'Eucariotas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (55, 28, 2, N'Procariotas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (57, 28, 3, N'Protistas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (58, 28, 4, N'Neuronas', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (59, 30, 1, N'Enero', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (60, 30, 2, N'Febrero', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (61, 30, 3, N'Noviembre', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (62, 30, 4, N'Diciembre', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (63, 31, 1, N'300', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (64, 31, 2, N'116', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (65, 31, 3, N'118', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (66, 31, 4, N'120', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (67, 32, 1, N'Rabit', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (68, 32, 2, N'Rabat', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (69, 32, 3, N'Roma', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (70, 32, 4, N'Roatan', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (71, 33, 1, N'China y Japón', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (72, 33, 2, N'China y EEUU', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (73, 33, 3, N'Nepal y Japón', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (74, 33, 4, N'China y Nepal', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (76, 34, 1, N'Colombia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (77, 34, 2, N'Cuba', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (78, 34, 3, N'Camboya', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (79, 34, 4, N'Comboya', 0)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
USE [master]
GO
ALTER DATABASE [PreguntadORT] SET  READ_WRITE 
GO
