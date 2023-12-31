USE [master]
GO
/****** Object:  Database [Gimnasio]    Script Date: 11-Jul-23 10:07:49 AM ******/
CREATE DATABASE [Gimnasio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gimnasio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gimnasio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gimnasio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gimnasio_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Gimnasio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gimnasio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gimnasio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gimnasio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gimnasio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gimnasio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gimnasio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gimnasio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gimnasio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gimnasio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gimnasio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gimnasio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gimnasio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gimnasio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gimnasio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gimnasio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gimnasio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gimnasio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gimnasio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gimnasio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gimnasio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gimnasio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gimnasio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gimnasio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gimnasio] SET RECOVERY FULL 
GO
ALTER DATABASE [Gimnasio] SET  MULTI_USER 
GO
ALTER DATABASE [Gimnasio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gimnasio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gimnasio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gimnasio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gimnasio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gimnasio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gimnasio', N'ON'
GO
ALTER DATABASE [Gimnasio] SET QUERY_STORE = OFF
GO
USE [Gimnasio]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](15) NULL,
	[Descripcion] [varchar](25) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dojos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dojos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Profesor] [varchar](80) NULL,
	[TelefonoProfesor] [varchar](25) NULL,
	[Direccion] [varchar](255) NULL,
	[IdLocalidad] [int] NULL,
	[IdProvincia] [int] NULL,
	[TelefonoDojo] [varchar](25) NULL,
	[Observaciones] [varchar](255) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Observaciones] [varchar](255) NULL,
	[EstadoEvento] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[FechaEvento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](25) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProvincia] [int] NOT NULL,
	[Localidad] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peleadores]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peleadores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NULL,
	[Apellido] [varchar](25) NULL,
	[Peso] [decimal](18, 2) NULL,
	[Altura] [int] NULL,
	[Edad] [int] NULL,
	[CantidadPeleas] [int] NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDojo] [int] NOT NULL,
	[IdGenero] [int] NOT NULL,
	[IdTipoPelea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Observaciones] [varchar](255) NULL,
	[IdEvento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peleas]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peleas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[IdPeleador1] [int] NOT NULL,
	[IdPeleador2] [int] NOT NULL,
	[IdDojo] [int] NOT NULL,
	[Observaciones] [varchar](255) NULL,
	[IdTipoPelea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[IdEvento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provincia] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPeleas]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPeleas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuarios]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Usuario] [varchar](40) NULL,
	[Contrasenia] [varchar](40) NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[IdDojo] [int] NOT NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dojos]  WITH CHECK ADD FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[Localidades] ([Id])
GO
ALTER TABLE [dbo].[Dojos]  WITH CHECK ADD FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincias] ([Id])
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincias] ([Id])
GO
ALTER TABLE [dbo].[Peleadores]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Peleadores]  WITH CHECK ADD FOREIGN KEY([IdDojo])
REFERENCES [dbo].[Dojos] ([Id])
GO
ALTER TABLE [dbo].[Peleadores]  WITH CHECK ADD FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Eventos] ([Id])
GO
ALTER TABLE [dbo].[Peleadores]  WITH CHECK ADD FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([Id])
GO
ALTER TABLE [dbo].[Peleadores]  WITH CHECK ADD FOREIGN KEY([IdTipoPelea])
REFERENCES [dbo].[TipoPeleas] ([Id])
GO
ALTER TABLE [dbo].[Peleas]  WITH CHECK ADD FOREIGN KEY([IdDojo])
REFERENCES [dbo].[Dojos] ([Id])
GO
ALTER TABLE [dbo].[Peleas]  WITH CHECK ADD FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Eventos] ([Id])
GO
ALTER TABLE [dbo].[Peleas]  WITH CHECK ADD FOREIGN KEY([IdTipoPelea])
REFERENCES [dbo].[TipoPeleas] ([Id])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuarios] ([Id])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([IdDojo])
REFERENCES [dbo].[Dojos] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[AgregarDojo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarDojo]
@CodigoDojo int,
@Nombre varchar(100),
@Direccion varchar(100),
@Provincia varchar(50),
@Localidad varchar(50),
@Profesor varchar(80),
@TelefonoProfesor varchar(25),
@TelefonoDojo varchar(25),
@Observaciones varchar(255)
AS
INSERT INTO Dojos (Codigo, Nombre, Profesor, TelefonoProfesor, Direccion, IdLocalidad, IdProvincia, TelefonoDojo, Observaciones, Estado)
VALUES (0, @Nombre, @Profesor, @TelefonoProfesor, @Direccion, @Localidad, @Provincia, @TelefonoDojo, @Observaciones, 1)

SET @CodigoDojo = @@IDENTITY

UPDATE Dojos SET Codigo = @CodigoDojo WHERE Id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[AgregarEvento]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarEvento]
-----------------------------------
------Logica para los eventos------
--IdEstadoEvento = 1 = Pendiente---
--IdEstadoEvento = 1 = Finalizado--
-----------------------------------
@Descripcion varchar(70),
@FechaEvento DateTime,
@Observaciones varchar(255)
AS
INSERT INTO Eventos (Descripcion, FechaEvento, Observaciones, EstadoEvento, Estado)
OUTPUT inserted.Id
VALUES (@Descripcion, @FechaEvento, @Observaciones, 1, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarPelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPelea]
@Codigo int,
@IdPeleador1 int,
@IdPeleador2 int,
@IdDojo int,
@IdTipoPelea int,
@Observaciones varchar(255)
AS
INSERT INTO Peleas (Codigo, IdPeleador1, IdPeleador2, IdDojo, Observaciones, IdTipoPelea, IdEvento, Estado)
VALUES (0, @IdPeleador1, @IdPeleador2, @IdDojo, @Observaciones,
@IdTipoPelea, (SELECT TOP 1 Id FROM Eventos WHERE EstadoEvento = 1 AND Estado = 1), 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarPeleador]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPeleador]
@Nombre varchar(100),
@Apellido varchar(100),
@Peso decimal(18,2),
@Altura int,
@Edad int,
@CantidadPeleas int,
@IdCategoria int,
@IdDojo int,
@IdGenero int,
@IdTipoPelea int,
@Observaciones varchar(255)
AS
INSERT INTO Peleadores (Nombre, Apellido, Peso, Altura, Edad, CantidadPeleas, IdCategoria, IdDojo, IdGenero, IdTipoPelea, Observaciones, IdEvento, Estado)
OUTPUT inserted.Id
VALUES (@Nombre, @Apellido, @Peso, @Altura, @Edad, @CantidadPeleas, @IdCategoria, @IdDojo, @IdGenero, @IdTipoPelea, 
@Observaciones, (SELECT TOP 1 Id FROM Eventos WHERE EstadoEvento = 1 AND Estado = 1), 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarUsuario]
@Codigo int,
@Usuario varchar(100),
@Contrasenia varchar(100),
@IdTipoUsuario int,
@IdDojo int
AS
INSERT INTO Usuarios 
VALUES (@Codigo, @Usuario, @Contrasenia, @IdTipoUsuario, @IdDojo, 1)

SET @Codigo = @@IDENTITY

UPDATE Usuarios SET Codigo = @Codigo WHERE Id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[EliminarDojo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarDojo]
@IdDojo int
AS
UPDATE Dojos SET Estado = 0 WHERE id = @IdDojo
GO
/****** Object:  StoredProcedure [dbo].[EliminarPelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPelea]
@IdPelea int
AS
UPDATE Peleas SET Estado = 0 WHERE id = @IdPelea
GO
/****** Object:  StoredProcedure [dbo].[EliminarPeleador]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPeleador]
@IdPeleador int
AS
UPDATE Peleadores SET Estado = 0 WHERE id = @IdPeleador
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
@IdUsuario int
AS
UPDATE Usuarios SET Estado = 0 WHERE id = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[ExportarPeleadoresTodosAExcel]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExportarPeleadoresTodosAExcel]
AS 
SELECT E.Descripcion Evento, E.FechaEvento, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
CONVERT(VARCHAR,CONVERT(decimal(18,0),P.Peso)) + ' KG' AS Peso, P.Edad, CONVERT(VARCHAR,P.Altura) + ' CM' Altura, 
P.CantidadPeleas, G.Genero, C.Descripcion Categoria, TP.Descripcion Modalidad,
D.Nombre Team, P.Observaciones
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Eventos E ON P.IdEvento = E.Id
WHERE P.Estado = 1 AND D.Estado = 1 
AND C.Estado = 1 AND G.Estado = 1 AND E.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ExportarPeleadoresXEventoAExcel]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExportarPeleadoresXEventoAExcel]
@IdEvento int
AS 
SELECT E.Descripcion Evento, E.FechaEvento, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
CONVERT(VARCHAR,CONVERT(decimal(18,0),P.Peso)) + ' KG' AS Peso, P.Edad, CONVERT(VARCHAR,P.Altura) + ' CM' Altura, 
P.CantidadPeleas, G.Genero, C.Descripcion Categoria, TP.Descripcion Modalidad,
D.Nombre Team, P.Observaciones
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Eventos E ON P.IdEvento = E.Id
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 
AND G.Estado = 1 AND P.IdEvento = @IdEvento AND E.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ExportarPeleasTodasAExcel]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExportarPeleasTodasAExcel]
AS
SELECT 
E.Descripcion Evento, E.FechaEvento, '#' + CONVERT(VARCHAR, P.Codigo) AS 'NumeroPelea', C.Descripcion CategoriaPelea,
(PE1.Nombre + ' ' + PE1.Apellido) AS 'PeleadorRinconRojo', PE1.Edad Edad1, CONVERT(DECIMAL(18,1),PE1.Peso) Peso1, PE1.Altura Altura1, 
PE1.CantidadPeleas CantidadPeleas1, D1.Nombre Team1, TP1.Descripcion Modalidad1,
(PE2.Nombre + ' ' + PE2.Apellido) AS 'PeleadorRinconAzul', PE2.Edad Edad2, CONVERT(DECIMAL(18,1),PE2.Peso) Peso2, PE2.Altura Altura2, 
PE2.CantidadPeleas CantidadPeleas2, D2.Nombre Team2, TP2.Descripcion Modalidad2,
TP.Descripcion ModalidadPelea, P.Observaciones ObservacionesPelea
FROM Peleas P
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN TipoPeleas TP2 ON TP2.Id = PE2.IdTipoPelea
INNER JOIN TipoPeleas TP1 ON TP1.Id = PE1.IdTipoPelea
INNER JOIN Dojos D1 ON D1.Id = PE1.IdDojo
INNER JOIN Dojos D2 ON D2.Id = PE2.IdDojo
INNER JOIN Eventos E ON P.IdEvento = E.Id
INNER JOIN Categorias C ON P.IdTipoPelea = C.Id
WHERE P.Estado = 1 AND PE1.Estado = 1 AND PE2.Estado = 1 AND TP.Estado = 1 
AND D1.Estado = 1 AND D2.Estado = 1 AND E.Estado = 1
ORDER BY 
    CASE C.Descripcion
        WHEN 'Exhibicion' THEN 1
        WHEN 'Amateur' THEN 2
        WHEN 'SemiProfesional' THEN 3
        WHEN 'Profesional' THEN 4
        ELSE 5 
    END,
    CASE WHEN P.Codigo > 0 THEN 0 ELSE 1 END,
    P.Codigo ASC,
	TP.Id ASC;
GO
/****** Object:  StoredProcedure [dbo].[ExportarPeleasXEventoAExcel]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExportarPeleasXEventoAExcel]
@IdEvento int
AS
SELECT 
'#' + CONVERT(VARCHAR, P.Codigo) AS 'NumeroPelea', C.Descripcion CategoriaPelea,
(PE1.Nombre + ' ' + PE1.Apellido) AS 'PeleadorRinconRojo', PE1.Edad Edad1, CONVERT(DECIMAL(18,1),PE1.Peso) Peso1, PE1.Altura Altura1, 
PE1.CantidadPeleas CantidadPeleas1, D1.Nombre Team1, TP1.Descripcion Modalidad1,
(PE2.Nombre + ' ' + PE2.Apellido) AS 'PeleadorRinconAzul', PE2.Edad Edad2, CONVERT(DECIMAL(18,1),PE2.Peso) Peso2, PE2.Altura Altura2, 
PE2.CantidadPeleas CantidadPeleas2, D2.Nombre Team2, TP2.Descripcion Modalidad2,
TP.Descripcion ModalidadPelea, P.Observaciones ObservacionesPelea, E.Descripcion Evento, E.FechaEvento
FROM Peleas P
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN TipoPeleas TP2 ON TP2.Id = PE2.IdTipoPelea
INNER JOIN TipoPeleas TP1 ON TP1.Id = PE1.IdTipoPelea
INNER JOIN Dojos D1 ON D1.Id = PE1.IdDojo
INNER JOIN Dojos D2 ON D2.Id = PE2.IdDojo
INNER JOIN Eventos E ON P.IdEvento = E.Id
INNER JOIN Categorias C ON P.IdTipoPelea = C.Id
WHERE P.Estado = 1 AND PE1.Estado = 1 AND PE2.Estado = 1 AND TP.Estado = 1 
AND D1.Estado = 1 AND D2.Estado = 1 AND P.IdEvento = @IdEvento AND E.Estado = 1
ORDER BY CASE C.Descripcion
    WHEN 'Exhibicion' THEN 1
    WHEN 'Amateur' THEN 2
    WHEN 'SemiProfesional' THEN 3
    WHEN 'Profesional' THEN 4
    ELSE 5 END,
    CASE WHEN P.Codigo > 0 THEN 0 ELSE 1 END,
    P.Codigo ASC,
	TP.Id ASC;
GO
/****** Object:  StoredProcedure [dbo].[FinalizarEvento]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FinalizarEvento]
@IdEvento int
AS
UPDATE Eventos SET EstadoEvento = 2 WHERE Id = @IdEvento
GO
/****** Object:  StoredProcedure [dbo].[LoguearUsuario]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoguearUsuario]
@User varchar(255),
@Pass varchar(255)
AS
SELECT U.Id Id, U.Id Codigo, U.Usuario, U.Contrasenia, TU.Descripcion TipoUsuario, 
TU.Id IdTipoUsuario, D.Id IdDojo, D.Nombre NombreDojo
FROM Usuarios U
INNER JOIN TipoUsuarios TU ON TU.Id = U.IdTipoUsuario
INNER JOIN Dojos D ON D.Id = U.IdDojo
WHERE U.Usuario = @user AND U.Contrasenia = @pass AND U.Estado = 1 AND D.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ModificarDojo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarDojo]
@Id int,
@Nombre varchar(100),
@Direccion varchar(100),
@Provincia varchar(50),
@Localidad varchar(50),
@Profesor varchar(80),
@TelefonoProfesor varchar(25),
@TelefonoDojo varchar(25),
@Observaciones varchar(255)
AS
UPDATE Dojos 
SET Nombre = @Nombre, Direccion = @Direccion, IdLocalidad = @Localidad, IdProvincia = @Provincia,
Observaciones = @Observaciones, TelefonoProfesor = @TelefonoProfesor, TelefonoDojo = @TelefonoDojo, Profesor = @Profesor 
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarEvento]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarEvento]
-----------------------------------
------Logica para los eventos------
--IdEstadoEvento = 1 = Pendiente---
--IdEstadoEvento = 1 = Finalizado--
-----------------------------------
@IdEvento int,
@Descripcion varchar(70),
@FechaEvento DateTime,
@Observaciones varchar(255)
AS
UPDATE Eventos SET Descripcion = @Descripcion, FechaEvento = @FechaEvento, Observaciones = @Observaciones
WHERE Id = @IdEvento
GO
/****** Object:  StoredProcedure [dbo].[ModificarPelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarPelea]
@Id int,
@IdPeleador1 int,
@IdPeleador2 int,
@IdDojo int,
@IdTipoPelea int,
@Observaciones varchar(255)
AS
UPDATE Peleas SET
IdPeleador1 = @IdPeleador1, IdPeleador2 = @IdPeleador2, IdDojo = @IdDojo, IdTipoPelea = @IdTipoPelea,
Observaciones = @Observaciones
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarPeleador]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarPeleador]
@IdPeleador int,
@Nombre varchar(100),
@Apellido varchar(100),
@Peso decimal(18,2),
@Altura int,
@Edad int,
@CantidadPeleas int,
@IdCategoria int,
@IdDojo int,
@IdGenero int,
@IdTipoPelea int,
@Observaciones varchar(255)
AS
UPDATE Peleadores 
SET Nombre = @Nombre, Apellido = @Apellido, Peso = @Peso, Altura = @Altura,
CantidadPeleas = @CantidadPeleas, IdCategoria = @IdCategoria, IdDojo = @IdDojo, 
IdGenero = @IdGenero, Edad = @Edad, IdTipoPelea = @IdTipoPelea, Observaciones = @Observaciones
WHERE Id = @IdPeleador
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarUsuario]
@Id int,
@Usuario varchar(100),
@Contrasenia varchar(100),
@IdTipoUsuario int,
@IdDojo int
AS
UPDATE Usuarios 
SET Usuario = @Usuario, Contrasenia = @Contrasenia, IdTipoUsuario = @IdTipoUsuario, 
IdDojo = @IdDojo WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasPeleadores]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasPeleadores]
AS
SELECT Id IdCategoria, Codigo, Descripcion FROM Categorias WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojoPorId]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDojoPorId]
@IdDojo int
AS
SELECT D.Id IdDojo, D.Codigo, D.Nombre, D.Observaciones,
D.Direccion, L.Localidad, D.IdLocalidad, P.Provincia, D.IdProvincia, 
D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, 
(D.Direccion + ', ' + L.Localidad + ', ' + P.Provincia) DireccionCompleta
FROM Dojos D
INNER JOIN Localidades L ON L.Id = D.IdLocalidad 
INNER JOIN Provincias P ON P.Id = D.IdProvincia 
WHERE D.Estado = 1 AND D.Id = @IdDojo
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDojos]
AS
SELECT D.Id IdDojo, D.Nombre NombreDojo FROM Dojos D WHERE D.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojosTodos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDojosTodos]
AS
SELECT D.Id IdDojo, D.Codigo, D.Nombre NombreDojo, D.IdProvincia, 
D.IdLocalidad, D.Direccion, P.Provincia, L.Localidad, P.Provincia, D.Observaciones, 
D.Profesor NombreProfesor, D.TelefonoDojo, D.TelefonoProfesor, (D.Direccion + ', ' + L.Localidad + ', ' + P.Provincia) DireccionCompleta
FROM Dojos D
INNER JOIN Localidades L ON L.Id = D.IdLocalidad 
INNER JOIN Provincias P ON P.Id = D.IdProvincia 
WHERE D.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojosXId]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDojosXId]
@IdDojo int
AS
SELECT D.Id IdDojo, D.Nombre NombreDojo FROM Dojos D WHERE D.Estado = 1 AND D.Id = @IdDojo
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEventos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEventos]
AS
SELECT E.Id, E.Descripcion Evento FROM Eventos E WHERE E.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEventosTodos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEventosTodos]
AS
SELECT Id, Descripcion, FechaEvento, Observaciones, EstadoEvento IdEstadoEvento,
CASE EstadoEvento
WHEN 1 THEN 'Pendiente'
WHEN 2 THEN 'Finalizado'
END AS EstadoEvento
FROM Eventos E
WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEventoXId]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEventoXId]
@IdEvento int
AS
SELECT Id, Descripcion, FechaEvento, Observaciones, EstadoEvento IdEstadoEvento,
CASE EstadoEvento
WHEN 1 THEN 'Pendiente'
WHEN 2 THEN 'Finalizado'
END AS EstadoEvento
FROM Eventos E
WHERE Estado = 1 AND Id = @IdEvento
GO
/****** Object:  StoredProcedure [dbo].[ObtenerGenerosPeleadores]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerGenerosPeleadores]
AS
SELECT Id IdGenero, Genero FROM Generos WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLocalidades]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLocalidades]
AS
SELECT Id, IdProvincia, Localidad FROM Localidades
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLocalidadesXProvincia]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLocalidadesXProvincia]
@IdProvincia int
AS
SELECT Id, IdProvincia, Localidad FROM Localidades WHERE IdProvincia = @IdProvincia
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores1Pelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores1Pelea]
AS
SELECT DISTINCT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto,
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo, P.Edad,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, Edad: ' + CONVERT(VARCHAR,P.Edad) + ', ' +
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', Categoria: ' + C.Descripcion + ', Modalidad: ' + TP.Descripcion + ', Team: ' + D.Nombre) as DatosDDL,
D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, TP.Descripcion TipoPelea, TP.Id IdTipoPelea
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea 
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND TP.Estado = 1 AND EV.EstadoEvento = 1
AND NOT EXISTS (
    SELECT 1
    FROM Peleas PE
    WHERE (P.Id = PE.IdPeleador1 OR P.Id = PE.IdPeleador2)
    AND PE.Estado = 1
)
ORDER BY P.Nombre, P.Apellido ASC
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores1PeleaFiltrados]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores1PeleaFiltrados]
@txtBuscar varchar(255)
AS
SELECT DISTINCT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo, P.Edad,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, Edad: ' + CONVERT(VARCHAR,P.Edad) + ', ' +
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', Categoria: ' + C.Descripcion + ', Modalidad: ' + TP.Descripcion + ', Team: ' + D.Nombre) as DatosDDL,
D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, TP.Descripcion TipoPelea, TP.Id IdTipoPelea
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea 
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1  AND TP.Estado = 1 AND EV.EstadoEvento = 1 AND
(P.Nombre LIKE '%' + @txtBuscar + '%' OR P.Apellido LIKE '%' + @txtBuscar + '%') AND NOT EXISTS (
    SELECT 1
    FROM Peleas PE
    WHERE (P.Id = PE.IdPeleador1 OR P.Id = PE.IdPeleador2)
    AND PE.Estado = 1
)
ORDER BY P.Nombre, P.Apellido ASC
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores2Pelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores2Pelea]
@IdPeleador1 INT
AS
SELECT DISTINCT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo, P.Edad,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, Edad: ' + CONVERT(VARCHAR,P.Edad) + ', ' +
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', Categoria: ' + C.Descripcion + ', Modalidad: ' + TP.Descripcion + ', Team: ' + D.Nombre) as DatosDDL,
D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, TP.Descripcion TipoPelea, TP.Id IdTipoPelea
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea 
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND P.Id != @IdPeleador1 AND TP.Estado = 1 AND EV.EstadoEvento = 1
AND P.IdDojo != (SELECT TOP 1 IdDojo FROM Peleadores WHERE Id = @IdPeleador1)
AND P.IdCategoria = (SELECT TOP 1 IdCategoria FROM Peleadores WHERE Id = @IdPeleador1)
AND P.IdGenero = (SELECT TOP 1 IdGenero FROM Peleadores WHERE Id = @IdPeleador1)
AND P.IdTipoPelea = (SELECT TOP 1 IdTipoPelea FROM Peleadores WHERE Id = @IdPeleador1)
AND NOT EXISTS (
    SELECT 1
    FROM Peleas PE
    WHERE (P.Id = PE.IdPeleador1 OR P.Id = PE.IdPeleador2)
    AND PE.Estado = 1
)
ORDER BY P.Nombre, P.Apellido ASC
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores2PeleaFiltrados]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores2PeleaFiltrados]
@IdPeleador1 INT,
@txtBuscar varchar(255)
AS
SELECT DISTINCT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo, P.Edad,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, Edad: ' + CONVERT(VARCHAR,P.Edad) + ', ' +
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', Categoria: ' + C.Descripcion + ', Modalidad: ' + TP.Descripcion + ', Team: ' + D.Nombre) as DatosDDL,
D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, TP.Descripcion TipoPelea, TP.Id IdTipoPelea
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND P.Id != @IdPeleador1 AND TP.Estado = 1 AND EV.EstadoEvento = 1
AND P.IdDojo != (SELECT TOP 1 IdDojo FROM Peleadores WHERE Id = @IdPeleador1) 
AND P.IdCategoria = (SELECT TOP 1 IdCategoria FROM Peleadores WHERE Id = @IdPeleador1)
AND P.IdGenero = (SELECT TOP 1 IdGenero FROM Peleadores WHERE Id = @IdPeleador1)
AND P.IdTipoPelea = (SELECT TOP 1 IdTipoPelea FROM Peleadores WHERE Id = @IdPeleador1)
AND (P.Nombre LIKE '%' + @txtBuscar + '%' OR P.Apellido LIKE '%' + @txtBuscar + '%')
AND NOT EXISTS (
    SELECT 1
    FROM Peleas PE
    WHERE (P.Id = PE.IdPeleador1 OR P.Id = PE.IdPeleador2)
    AND PE.Estado = 1
)
ORDER BY P.Nombre, P.Apellido ASC
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresSimilares]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadoresSimilares]
@IdPeleador1 INT,
@FiltrarXPeso INT,
@FiltrarXPeleas INT,
@FiltrarXEdad INT,
@FiltrarXCategoria INT,
@FiltrarXModalidad INT,
@PesoFiltro decimal(18,2),
@EdadFiltro INT,
@CantidadPeleasFitro INT
AS

DECLARE
@Peso decimal(18,2),
@Altura int,
@Edad int,
@CantidadPeleas int,
@IdCategoria int,
@IdModalidad int,
@IdGenero int,
@IdDojo int

--Datos del primer peleador para compararlos con el segundo select
SELECT
@Peso = P.Peso,
@Edad = P.Edad,
@CantidadPeleas = P.CantidadPeleas,
@IdCategoria = C.Id,
@IdModalidad = TP.Id,
@IdGenero = G.Id,
@IdDojo = P.IdDojo
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdtipoPelea
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND P.Id = @IdPeleador1

-- Datos del segundo peleador
-- Datos del segundo peleador
SELECT DISTINCT TOP 10
    P.Id AS Id,
    P.Id AS Codigo,
    P.Nombre,
    P.Apellido,
    (P.Nombre + ' ' + P.Apellido) AS NombreCompleto,
    P.Peso,
    P.Altura,
    P.Edad,
    P.CantidadPeleas,
    C.Descripcion AS Categoria,
    P.IdCategoria,
    G.Genero,
    P.IdGenero,
    TP.Descripcion,
    TP.Id AS IdModalidad,
    D.Nombre AS Dojo,
    P.IdDojo,
    TP.Id AS IdTipoPelea,
    TP.Descripcion AS TipoPelea,
    CASE
        WHEN P.Observaciones IS NULL THEN 'Sin informacion'
        WHEN P.Observaciones = '' THEN 'Sin informacion'
        WHEN P.Observaciones IS NOT NULL AND P.Observaciones != '' THEN P.Observaciones
    END AS Observaciones,
    ABS(P.Peso - @Peso) + ABS(P.Edad - @Edad) + ABS(P.CantidadPeleas - @CantidadPeleas) AS Orden
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN TipoPeleas TP ON TP.Id = P.IdtipoPelea
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.IdDojo != @IdDojo
    AND G.Id = @IdGenero
    AND P.Id != @IdPeleador1
    AND P.Estado = 1
    AND D.Estado = 1
    AND C.Estado = 1
    AND G.Estado = 1
    AND TP.Estado = 1
	AND EV.EstadoEvento = 1
    -- Aplicar las variables de filtrado si tienen valor 1
    AND ((@FiltrarXPeso = 1 AND P.Peso BETWEEN (@Peso - @PesoFiltro) AND (@Peso + @PesoFiltro))
        OR @FiltrarXPeso = 0)
    AND ((@FiltrarXEdad = 1 AND P.Edad BETWEEN (@Edad - @EdadFiltro) AND (@Edad + @EdadFiltro))
        OR @FiltrarXEdad = 0)
    AND ((@FiltrarXPeleas = 1 AND P.CantidadPeleas BETWEEN (@CantidadPeleas - @CantidadPeleasFitro) AND (@CantidadPeleas + @CantidadPeleasFitro))
        OR @FiltrarXPeleas = 0)
    AND ((@FiltrarXCategoria = 1 AND C.Id = @IdCategoria)
        OR @FiltrarXCategoria = 0)
    AND ((@FiltrarXModalidad = 1 AND TP.Id = @IdModalidad)
        OR @FiltrarXModalidad = 0)
    AND NOT EXISTS (
    SELECT 1
    FROM Peleas PE
    WHERE (P.Id = PE.IdPeleador1 OR P.Id = PE.IdPeleador2)
    AND PE.Estado = 1
)
ORDER BY Orden ASC
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresTodos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadoresTodos]
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, P.Edad,
D.Nombre Dojo, P.IdDojo, D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, 
TP.Descripcion TipoPelea, TP.Id IdTipoPelea, P.Observaciones
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND EV.EstadoEvento = 1
ORDER BY CASE C.Descripcion
    WHEN 'Exhibicion' THEN 1
    WHEN 'Amateur' THEN 2
    WHEN 'SemiProfesional' THEN 3
    WHEN 'Profesional' THEN 4
    ELSE 5
END, P.Nombre, P.Apellido;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresTodosXDojo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadoresTodosXDojo]
@IdDojo int
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, P.Edad,
D.Nombre Dojo, P.IdDojo, D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, 
TP.Descripcion TipoPelea, TP.Id IdTipoPelea, P.Observaciones
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND P.IdDojo = @IdDojo AND EV.EstadoEvento = 1
ORDER BY CASE C.Descripcion
    WHEN 'Exhibicion' THEN 1
    WHEN 'Amateur' THEN 2
    WHEN 'SemiProfesional' THEN 3
    WHEN 'Profesional' THEN 4
    ELSE 5
END, P.Nombre, P.Apellido;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadorPorId]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadorPorId]
@IdPeleador int
AS
SELECT P.Id IdPeleador, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, P.Edad,
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, D.Nombre Dojo, P.IdDojo, G.Genero, P.IdGenero,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, Edad: ' + CONVERT(VARCHAR,P.Edad) + ', ' +
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', Categoria: ' + C.Descripcion + ', Modalidad: ' + TP.Descripcion + ', Team: ' + D.Nombre) as DatosDDL,
D.Profesor, D.TelefonoDojo, D.TelefonoProfesor, P.Edad, TP.Descripcion TipoPelea, TP.Id IdTipoPelea, P.Observaciones
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D.Estado = 1 AND C.Estado = 1 AND G.Estado = 1 AND TP.Estado = 1 AND P.Id = @IdPeleador AND EV.EstadoEvento = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleaPorId]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleaPorId]
@IdPelea int
AS
SELECT P.Id AS Id, P.Codigo, P.Observaciones, TP.Id IdTipoPelea, TP.Descripcion TipoPelea, D.Id IdDojo, D.Nombre Dojo,
--Peleador1
(PE1.Nombre + ' ' + PE1.Apellido) AS Peleador1Nombre,
PE1.Id IdP1, PE1.Id CodigoP1, PE1.Peso PesoP1, PE1.Altura AlturaP1, PE1.CantidadPeleas CantidadPeleasP1, 
C1.Descripcion CategoriaP1, C1.Id IdCategoriaP1, G1.Genero GeneroP1, G1.Id IdGeneroP1, D1.Nombre DojoP1,
D1.Id IdDojoP1, TP1.Descripcion TipoPeleaP1, TP1.Id IdTipoPeleaP1, PE1.Edad EdadP1,
--Peleador1
-----------
--Peleador2
(PE2.Nombre + ' ' + PE2.Apellido) AS Peleador2Nombre,
PE2.Id IdP2, PE2.Id CodigoP2, PE2.Peso PesoP2, PE2.Altura AlturaP2, PE2.CantidadPeleas CantidadPeleasP2, 
C2.Descripcion CategoriaP2, C2.Id IdCategoriaP2, G2.Genero GeneroP2, G2.Id IdGeneroP2, D2.Nombre DojoP2,
D2.Id IdDojoP2, TP2.Descripcion TipoPeleaP2, TP2.Id IdTipoPeleaP2, PE2.Edad EdadP2
--Peleador2
FROM Peleas P
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Dojos D1 ON D1.Id = PE1.IdDojo
INNER JOIN Categorias C1 ON C1.Id = PE1.IdCategoria
INNER JOIN Generos G1 ON G1.Id = PE1.IdGenero
INNER JOIN TipoPeleas TP1 ON TP1.Id = PE1.IdTipoPelea
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
INNER JOIN Dojos D2 ON D2.Id = PE2.IdDojo
INNER JOIN Categorias C2 ON C2.Id = PE2.IdCategoria
INNER JOIN Generos G2 ON G2.Id =PE2.IdGenero
INNER JOIN TipoPeleas TP2 ON TP2.Id = PE2.IdTipoPelea
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
WHERE P.Estado = 1 AND D1.Estado = 1 AND C1.Estado = 1 AND G1.Estado = 1 
AND D2.Estado = 1 AND C2.Estado = 1 AND G2.Estado = 1 AND TP.Estado = 1 AND P.Id = @IdPelea AND EV.EstadoEvento = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleasTodas]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleasTodas]
AS
SELECT P.Id AS Id, P.Codigo, 
    (PE1.Nombre + ' ' + PE1.Apellido) AS Peleador1Nombre, P.IdPeleador1, D1.Nombre DojoP1, D1.Id IdDojoP1, TP1.Descripcion TipoPeleaP1, TP1.Id IdTipoPeleaP1,
    (PE2.Nombre + ' ' + PE2.Apellido) AS Peleador2Nombre, P.IdPeleador2, D2.Nombre DojoP2, D2.Id IdDojoP2, TP1.Descripcion TipoPeleaP2, TP1.Id IdTipoPeleaP2,
    TP.Id IdTipoPelea, TP.Descripcion TipoPelea, P.Observaciones, D.Id IdDojo, D.Nombre Dojo
FROM Peleas P
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
INNER JOIN TipoPeleas TP2 ON TP2.Id = PE2.IdTipoPelea
INNER JOIN TipoPeleas TP1 ON TP1.Id = PE1.IdTipoPelea
INNER JOIN Dojos D1 ON D1.Id = PE1.IdDojo
INNER JOIN Dojos D2 ON D2.Id = PE2.IdDojo
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Eventos EV ON EV.Id = P.IdEvento
INNER JOIN Categorias C ON C.Id = P.IdTipoPelea
WHERE P.Estado = 1 AND PE1.Estado = 1 AND PE2.Estado = 1 AND TP.Estado = 1 AND D1.Estado = 1 AND D2.Estado = 1 AND EV.EstadoEvento = 1
ORDER BY CASE C.Descripcion
    WHEN 'Exhibicion' THEN 1
    WHEN 'Amateur' THEN 2
    WHEN 'SemiProfesional' THEN 3
    WHEN 'Profesional' THEN 4
    ELSE 5 END,
    CASE WHEN P.Codigo > 0 THEN 0 ELSE 1 END,
    P.Codigo ASC,
	TP.Id ASC;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProvincias]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProvincias]
AS
SELECT Id, Provincia FROM Provincias
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTipoPeleas]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTipoPeleas]
AS
SELECT Id IdTipoPelea, Codigo, Descripcion TipoPelea FROM TipoPeleas
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTiposUsuario]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTiposUsuario]
AS
SELECT Id IdTipoUsuario, Codigo, Descripcion TipoUsuario FROM TipoUsuarios WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuariosTodos]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuariosTodos]
AS
SELECT U.Id Id, U.Codigo, U.Usuario, U.Contrasenia, TU.Id IdTipoUsuario, TU.Descripcion TipoUsuario,
D.Id IdDojo, D.Nombre Dojo
FROM Usuarios U
INNER JOIN Dojos D ON D.Id = U.IdDojo
INNER JOIN TipoUsuarios TU ON TU.Id = U.IdTipoUsuario 
WHERE U.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SetearNumeroPelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetearNumeroPelea]
@IdPelea int,
@NumeroPelea int
AS
UPDATE Peleas SET Codigo = @NumeroPelea WHERE id = @IdPelea
GO
/****** Object:  StoredProcedure [dbo].[VerificarHayEventoActivo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarHayEventoActivo]
AS
SELECT Id, EstadoEvento, Estado FROM Eventos WHERE EstadoEvento = 1 AND Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[VerificarPeleadoresAlEliminarDojo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarPeleadoresAlEliminarDojo]
@IdDojo int
AS
SELECT Id, Estado FROM Peleadores WHERE IdDojo = @IdDojo AND Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[VerificarPeleasAlEliminarDojo]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarPeleasAlEliminarDojo]
@IdDojo int
AS
SELECT Id, Estado FROM Peleas WHERE IdDojo = @IdDojo AND Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[VerificarPeleasAlEliminarPeleadores]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarPeleasAlEliminarPeleadores]
@IdPeleador int
AS
SELECT Id, Estado FROM Peleas WHERE IdPeleador1 = @IdPeleador OR IdPeleador2 = @IdPeleador AND Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[VerificarSiExisteNumeroPelea]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarSiExisteNumeroPelea]
@NumeroDePelea int
AS
SELECT Id, Estado FROM Peleas WHERE Codigo = @NumeroDePelea AND Estado = 1 AND Codigo != 0
GO
/****** Object:  StoredProcedure [dbo].[VerificarUsuario]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarUsuario]
@User varchar(70)
AS
SELECT Id, Usuario FROM Usuarios WHERE Usuario = @User AND Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[VerificarUsuarioModificar]    Script Date: 11-Jul-23 10:07:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarUsuarioModificar]
@User varchar(70),
@IdUsuario int
AS
SELECT Id, Usuario FROM Usuarios WHERE Usuario = @User AND Estado = 1 AND Id != @IdUsuario
GO
USE [master]
GO
ALTER DATABASE [Gimnasio] SET  READ_WRITE 
GO
