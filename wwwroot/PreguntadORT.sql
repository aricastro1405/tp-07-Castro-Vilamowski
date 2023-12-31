USE [master]
GO
/****** Object:  Database [PreguntadORT]    Script Date: 5/9/2023 09:11:08 ******/
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
/****** Object:  User [alumno]    Script Date: 5/9/2023 09:11:08 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 5/9/2023 09:11:08 ******/
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
/****** Object:  Table [dbo].[Dificultad]    Script Date: 5/9/2023 09:11:08 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 5/9/2023 09:11:08 ******/
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
/****** Object:  Table [dbo].[Respuesta]    Script Date: 5/9/2023 09:11:08 ******/
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

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Arte', N'Arte.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Entretenimiento', N'Entretenimiento.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Deporte', N'Deporte.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Historia', N'Historia.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Ciencia', N'Ciencia.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (6, N'Geografia', N'Geografia.png')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultad] ON 

INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (2, N'Intermedio')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 1, 1, N' ¿Quién pintó “la última cena”?', N'Ultima.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 1, 2, N'¿Cuál es la pintura más cara vendida en la actualidad?', N'Cara.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿Quién pintó la Capilla Sixtina?', N'Capilla.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 2, 1, N'¿En qué ciudad vive el mago de Oz?', N'Mago.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 2, 2, N'¿Cuál es el nombre del perro de Tintín? ', N'Tintin.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 2, 3, N'¿En qué calle ficticia vivía Sherlock Holmes?', N'Holmes.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 3, 1, N'¿En qué ciudad nació Leo Messi?', N'Messi.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 3, 2, N'¿Qué selección ha ganado más mundiales de fútbol? ', N'Mundial.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 3, 3, N'¿Cuántos jugadores hay en un equipo de voleibol? ', N'Voley.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 4, 1, N'¿Quién fue el primer presidente de Estados Unidos?', N'USA.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 4, 2, N'¿Qué calavera no regresó tras el primer viaje de Colón a América?', N'America.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (27, 4, 3, N'¿En qué ciudad vivió Marco Polo?', N'Polo.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (28, 5, 1, N'¿Qué célula se encuentra tanto en humanos como en animales?', N'Celula.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (30, 5, 2, N'¿En qué mes el Sol está más cerca de la Tierra? ', N'Sol.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (31, 5, 3, N'¿Cuántos elementos tiene la tabla periódica?', N'Tabla.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (32, 6, 1, N'¿Cuál es la capital actual de Marruecos?', N'Marruecos.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (33, 6, 2, N'¿En qué países se encuentra el Everest? ', N'Everest.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (34, 6, 3, N'¿Dónde se encuentran las ruinas de Angkor? ', N'Angkor.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (36, 1, 1, N'?Qui?n pint? la Mona Lisa?', N'Mona.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (37, 1, 1, N'?Qu? famoso escultor italiano cre? la estatua de David?', N'David.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (41, 1, 1, N'?En qu? pa?s se origin? el flamenco, un estilo de m?sica y danza?', N'Flamenco.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (42, 1, 2, N'?Qu? movimiento art?stico incluye obras como "La noche estrellada" y "Los girasoles"?', N'Noche.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (43, 1, 2, N'?Qu? famoso pintor surrealista es conocido por sus relojes derretidos en obras como "La persistencia de la memoria"?', N'Relojes.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (44, 1, 2, N'?Cu?l es el nombre de la famosa pintura mural de Leonardo da Vinci que representa la ?ltima Cena de Jes?s?', N'Jesus.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (45, 1, 3, N'?Qu? artista estadounidense fue una figura importante en el movimiento de arte pop y cre? obras como "D?ptico de Marilyn"?', N'Diptico.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (46, 1, 3, N'?Qu? estilo arquitect?nico es famoso por sus c?pulas bulbosas y est? representado en la Catedral de San Basilio en Mosc??', N'Moscu.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (47, 1, 3, N'?Cu?l de estos movimientos art?sticos se caracteriza por el uso del color y la luz para capturar la atm?sfera en una escena en particular?', N'Atmosfera.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (48, 2, 1, N'?Qu? actor interpret? a Iron Man en las pel?culas del Universo Cinematogr?fico de Marvel?', N'IronMan.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (49, 2, 1, N'?Cu?l es el nombre del famoso mago creado por J.K. Rowling en la serie de libros "Harry Potter"?', N'Rowling.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (50, 2, 1, N'¿Qué serie de televisión sigue las vidas de los personajes en el ficticio pueblo de Springfield?', N' Springfield.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (51, 2, 2, N'¿En qué película Leonardo DiCaprio finalmente ganó su primer premio Óscar como Mejor Actor?', N' Leonardo.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (52, 2, 2, N' ¿Cuál es el nombre del director de la trilogía de "El Señor de los Anillos"?', N'Anillos.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (53, 2, 2, N'¿Qué famosa saga cinematográfica tiene personajes como Luke Skywalker, Darth Vader y Princess Leia?', N'Princesa.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (54, 2, 3, N'¿Qué película de ciencia ficción de 1982, dirigida por Ridley Scott, se desarrolla en un mundo futurista y presenta a los replicantes?', N'Pelicula.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (55, 2, 3, N'¿Cuál de estos directores es conocido por películas como "Pulp Fiction" y "Kill Bill"?', N'Directores.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (56, 3, 1, N'¿En qué deporte se otorga el Trofeo de la Copa del Mundo cada cuatro años?', N'Torneo.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (57, 3, 1, N'¿Qué deporte involucra golpear una pelota con un palo y meterla en un hoyo en el menor número de golpes posibles?', N'Pelota.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (58, 3, 1, N'¿En qué deporte los jugadores compiten en un ring y pueden ganar por nocaut, rendición o decisión de los jueces?', N'Ring.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (59, 3, 2, N'¿Cuál es el nombre del evento multideportivo en el que participan atletas discapacitados y que se celebra poco después de los Juegos Olímpicos?', N'Juegos.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (60, 3, 2, N'¿Qué tenista suizo es conocido por su habilidad en canchas de césped y ha ganado múltiples títulos de Grand Slam?', N'Grand.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (61, 3, 2, N'¿En qué deporte los equipos compiten por llevar una pelota ovalada detrás de la línea de gol del oponente para anotar puntos?', N'Ovalada.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (62, 3, 3, N'Qué nadador estadounidense ganó un total de 23 medallas de oro olímpicas a lo largo de su carrera?', N'Nadador.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (63, 3, 3, N'¿Cuál es el nombre del torneo de tenis más antiguo y prestigioso, jugado en césped, que se celebra en el Reino Unido?', N'Reino.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (64, 3, 3, N'¿En qué deporte se compite en una pista de hielo deslizándose sobre zapatos con cuchillas y realizando rutinas coreografiadas?', N'Hielo.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (65, 4, 1, N' ¿En qué año comenzó la Primera Guerra Mundial?', N'Guerra.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (67, 4, 1, N' ¿Qué antigua civilización construyó las famosas pirámides en Egipto?', N'Egipto.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (68, 4, 2, N'¿Cuál fue el período de renovación cultural y artística que floreció en Europa durante los siglos XIV al XVII?', N'Renovacion.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (69, 4, 2, N' ¿Qué imperio conquistó una gran parte de Europa, Asia y África durante los siglos XIII al XV?', N'Imperio.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (70, 4, 2, N'Qué evento histórico de la década de 1920 marcó la prohibición de la fabricación, venta y transporte de alcohol en los Estados Unidos?', N'Ley.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (71, 4, 3, N'¿Quién fue el líder político y militar que desempeñó un papel crucial en la independencia de muchos países de América del Sur, como Argentina, Chile y Perú?', N'Lider.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (72, 4, 3, N' ¿Qué tratado puso fin a la Primera Guerra Mundial en 1919 y estableció las condiciones para la paz?', N'Tratado.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (73, 4, 3, N'Cuál de los siguientes líderes de la Revolución Rusa se convirtió en el primer líder de la Unión Soviética?', N'Revolucion.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (74, 5, 1, N'¿Cuál es la capa exterior sólida de la Tierra?', N'Tierra.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (75, 5, 1, N'¿Qué científico formuló las leyes del movimiento y la ley de la gravitación universal?', N'Cientifico.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (76, 5, 1, N'¿Cuál es el proceso por el cual las plantas convierten la luz solar en energía química para su crecimiento?', N'Fotosintesis.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (77, 5, 2, N'¿Cuál es el nombre de la partícula subatómica que tiene una carga negativa y orbita alrededor del núcleo de un átomo?', N'Particula.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (78, 5, 2, N'¿Qué famoso naturalista propuso la teoría de la evolución a través de la selección natural en su libro "El origen de las especies"?', N'Darwin.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (79, 5, 2, N'¿Cuál es la unidad básica de la herencia genética en los seres vivos?', N'Seres.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (80, 5, 3, N'Qué teoría científica postula que todas las formas de vida comparten un ancestro común y han evolucionado a lo largo del tiempo?', N'Teoria.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (81, 5, 3, N' ¿Cuál de los siguientes elementos químicos es un gas noble y no reacciona fácilmente con otras sustancias químicas?', N'Elementos.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (82, 5, 3, N'¿Cuál es la unidad básica de la energía en el sistema internacional de unidades (SI)?', N'Basica.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (83, 6, 1, N' ¿Cuál es el río más largo del mundo?', N'Rio.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (84, 6, 1, N'¿En qué continente se encuentra el Gran Cañón?', N'Cañon.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (85, 6, 1, N' ¿Cuál es el océano más grande del mundo?', N'Oceano.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (86, 6, 2, N' ¿Cuál es la cadena montañosa más larga del mundo, que recorre varios países de América del Sur?', N'Montañosa.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (87, 6, 2, N'¿Cuál es el país más grande del mundo en términos de área terrestre?', N'Pais.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (88, 6, 2, N'¿Qué país europeo es conocido como "la tierra de los mil lagos" debido a su gran cantidad de lagos naturales?', N'MilLagos.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (89, 6, 3, N' ¿Cuál es el país más pequeño del mundo en términos de área y población?', N'Pequeño.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (90, 6, 3, N'¿Qué estrecho conecta el Mar Rojo con el Golfo de Adén y separa la península arábiga de África?', N'Estrecho.png')
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (92, 6, 3, N' ¿Cuál es el punto más alto de la Tierra, ubicado en la cordillera del Himalaya?', N'Alto.png')
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
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (80, 36, 1, N' Vincent van Gogh', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (81, 36, 2, N' Leonardo da Vinci', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (82, 36, 3, N' Pablo Picasso', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (83, 36, 4, N'Salvador Dalí', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (84, 37, 1, N'Michelangelo', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (85, 37, 2, N'Pablo Picasso', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (86, 37, 3, N'Vincent van Gogh', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (87, 37, 4, N'Claude Monet', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (88, 41, 1, N'España', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (90, 41, 2, N' Italia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (91, 41, 3, N'Francia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (92, 41, 4, N' Portugal', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (93, 42, 1, N'Renacimiento', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (94, 42, 2, N' Impresionismo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (96, 42, 3, N'Cubismo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (97, 42, 4, N'Posimpresionismo', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (98, 43, 1, N'René Magritte', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (99, 43, 2, N' Jackson Pollock', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (100, 43, 3, N'Salvador Dalí', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (101, 43, 4, N'Piet Mondrian', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (102, 44, 1, N'La creación de Adán', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (103, 44, 2, N'La Anunciación', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (104, 44, 3, N'La Última Cena', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (105, 44, 4, N'La bóveda de la Capilla Sixtina', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (106, 45, 1, N'Andy Warhol', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (107, 45, 2, N'Jackson Pollock', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (108, 45, 3, N'Roy Lichtenstein', 0)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (109, 45, 4, N'Keith Haring
', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (110, 46, 1, N'Gótico', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (111, 46, 2, N' Renacimiento', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (112, 46, 3, N'Barroco', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (113, 46, 4, N'Arquitectura rusa tradicional', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (114, 47, 1, N'Expresionismo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (115, 47, 2, N'Realismo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (116, 47, 3, N'Impresionismo', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (117, 47, 4, N' Cubismo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (118, 48, 1, N'Chris Hemsworth', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (119, 48, 2, N'Chris Evans', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (120, 48, 3, N'Robert Downey Jr.', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (121, 48, 4, N'Mark Ruffalo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (123, 49, 1, N' Merlin', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (124, 49, 2, N'Albus Dumbledore', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (125, 49, 3, N' Severus Snape', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (126, 49, 4, N'Harry Potter', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (127, 50, 1, N'South Park', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (129, 50, 2, N' Family Guy', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (130, 50, 3, N' The Simpsons', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (131, 50, 4, N'Bob''s Burgers', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (132, 51, 1, N'Inception', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (133, 51, 2, N'Titanic', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (134, 51, 3, N'The Revenant', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (135, 51, 4, N' The Wolf of Wall Street', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (136, 52, 1, N'Christopher Nolan', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (137, 52, 2, N'Steven Spielberg', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (138, 52, 3, N'James Cameron', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (139, 52, 4, N'Peter Jackson', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (140, 53, 1, N'Star Trek', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (141, 53, 2, N'Star Wars', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (142, 53, 3, N'Battlestar Galactica', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (143, 53, 4, N'Guardians of the Galaxy', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (144, 54, 1, N'Blade Runner', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (145, 54, 2, N'The Matrix', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (146, 54, 3, N'E.T. the Extra-Terrestrial', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (147, 54, 4, N'The Terminator', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (148, 55, 1, N'Quentin Tarantino', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (149, 55, 2, N'Martin Scorsese', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (150, 55, 3, N' Steven Spielberg', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (151, 55, 4, N'Christopher Nolan', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (152, 56, 1, N'The Crown', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (153, 56, 2, N'The Walking Dead', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (154, 56, 3, N'Game of Thrones', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (155, 56, 4, N'Stranger Things', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (156, 57, 1, N'Fútbol ', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (157, 57, 2, N'Baloncesto', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (158, 57, 3, N'Tenis', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (159, 57, 4, N'Golf', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (160, 58, 1, N'Béisbol', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (161, 58, 2, N'Fútbol americano', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (162, 58, 3, N'Golf', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (164, 58, 4, N'Rugby', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (165, 59, 1, N'Lucha libre', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (166, 59, 2, N'Boxeo', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (167, 59, 3, N'Karate', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (168, 59, 4, N'Esgrima', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (169, 60, 1, N'Juegos Paralímpicos', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (170, 60, 2, N' Juegos de Invierno', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (171, 60, 3, N'Juegos de la Commonwealth', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (172, 60, 4, N'Juegos Panamericanos', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (173, 61, 1, N'Rafael Nadal', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (174, 61, 2, N'Andy Murray', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (175, 61, 3, N'Novak Djokovic', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (176, 61, 4, N'Roger Federer', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (178, 62, 1, N'Rugby', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (179, 62, 2, N'Fútbol americano', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (180, 62, 3, N'Cricket', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (181, 62, 4, N'Balonmano', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (182, 63, 1, N'Michael Phelps', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (183, 63, 2, N'Ryan Lochte', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (184, 63, 3, N'Ian Thorpe', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (185, 63, 4, N'Mark Spitz', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (186, 64, 1, N'Abierto de Australia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (187, 64, 2, N'Abierto de Francia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (188, 64, 3, N'Wimbledon', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (190, 64, 4, N'Abierto de Estados Unidos', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (191, 65, 1, N'Patinaje artístico', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (192, 65, 2, N'Hockey sobre hielo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (193, 65, 3, N' Bobsleigh', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (194, 65, 4, N' Skeleton', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (195, 67, 1, N'1914', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (196, 67, 2, N'1939', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (197, 67, 3, N'1918', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (199, 67, 4, N'1945', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (200, 68, 1, N'Thomas Jefferson', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (201, 68, 2, N'Abraham Lincoln', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (202, 68, 3, N' George Washington', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (203, 68, 4, N' John F. Kennedy', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (204, 69, 1, N'Romanos', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (205, 69, 2, N'Griegos', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (206, 69, 3, N'Egipcios', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (207, 69, 4, N'Mayas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (208, 70, 1, N'Renacimiento', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (209, 70, 2, N'Edad Media', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (210, 70, 3, N'Barroco', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (211, 70, 4, N'Ilustración', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (212, 71, 1, N' Imperio Mongol', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (213, 71, 2, N'Imperio Romano', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (214, 71, 3, N' Imperio Persa', 0)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (215, 71, 4, N' Imperio Bizantino', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (216, 72, 1, N'La Revolución Rusa', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (217, 72, 2, N'La Gran Depresión', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (218, 72, 3, N'El movimiento de derechos civiles', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (219, 72, 4, N'La Ley Seca', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (220, 73, 1, N' Simón Bolívar', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (221, 73, 2, N' José de San Martín', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (222, 73, 3, N'Miguel Hidalgo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (223, 73, 4, N' Toussaint Louverture', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (224, 74, 1, N'Tratado de Versalles', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (225, 74, 2, N'Tratado de Tordesillas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (226, 74, 3, N'Tratado de Nankín', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (227, 74, 4, N'Tratado de París', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (228, 75, 1, N'León Trotsky', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (229, 75, 2, N' Joseph Stalin', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (230, 75, 3, N'Vladimir Lenin', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (231, 75, 4, N'Nikita Khrushchev', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (232, 76, 1, N'Núcleo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (233, 76, 2, N'Manto', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (234, 76, 3, N'Corteza', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (235, 76, 4, N' Núcleo interno', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (236, 77, 1, N'Albert Einstein', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (237, 77, 2, N'Isaac Newton', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (238, 77, 3, N'Galileo Galilei', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (239, 77, 4, N'Nikola Tesla', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (240, 78, 1, N'Fotosíntesis', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (242, 78, 2, N'Respiración', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (243, 78, 3, N'Fermentación', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (244, 78, 4, N'Oxidación', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (245, 79, 1, N'Protón', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (246, 79, 2, N'Neutrón', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (247, 79, 3, N'Electrón', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (248, 79, 4, N'Quark', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (250, 80, 1, N'Charles Darwin', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (251, 80, 2, N' Alfred Russel Wallace', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (252, 80, 3, N'Gregor Mendel', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (253, 80, 4, N' Carl Linnaeus', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (254, 81, 1, N'Célula', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (255, 81, 2, N'Gen', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (257, 81, 3, N'Cromosoma', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (259, 81, 4, N'Átomo', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (260, 82, 1, N' Teoría de la relatividad', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (261, 82, 2, N' Teoría de cuerdas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (262, 82, 3, N' Teoría del Big Bang', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (263, 82, 4, N'Teoría de la evolución', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (264, 83, 1, N'Oxígeno', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (265, 83, 2, N'Hidrógeno', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (266, 83, 3, N'Helio', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (267, 83, 4, N'Carbono', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (268, 84, 1, N'Vatio', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (269, 84, 2, N'Joule', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (270, 84, 3, N'Newton', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (271, 84, 4, N'Amperio', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (272, 85, 1, N'África', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (273, 85, 2, N'Asia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (274, 85, 3, N'América del Norte', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (275, 85, 4, N'Europa', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (277, 86, 1, N'Montañas Rocosas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (278, 86, 2, N'Himalayas', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (279, 86, 3, N'Alpes', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (280, 86, 4, N'Cordillera de los Andes', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (281, 87, 1, N'China', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (282, 87, 2, N'Canadá', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (283, 87, 3, N'Rusia', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (284, 87, 4, N'Estados Unidos', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (285, 88, 1, N' Noruega', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (286, 88, 2, N'Suecia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (287, 88, 3, N'Finlandia', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (288, 88, 4, N'Islandia', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (289, 89, 1, N'Mónaco', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (290, 89, 2, N'Vaticano', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (291, 89, 3, N' San Marino', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (292, 89, 4, N'Nauru', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (293, 90, 1, N'Estrecho de Gibraltar', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (294, 90, 2, N'Estrecho de Bering', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (295, 90, 3, N' Estrecho de Hormuz', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (296, 90, 4, N' Estrecho de Bab el Mandeb', 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (297, 92, 1, N'Monte Aconcagua', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (298, 92, 2, N'Mont Blanc', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (299, 92, 3, N'Monte Kilimanjaro', 0)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (300, 92, 4, N'Monte Everest', 1)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
USE [master]
GO
ALTER DATABASE [PreguntadORT] SET  READ_WRITE 
GO
