USE [Gimnasio]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
/****** Object:  Table [dbo].[Dojos]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dojos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](255) NULL,
	[IdLocalidad] [int] NULL,
	[IdProvincia] [int] NULL,
	[Observaciones] [varchar](255) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
/****** Object:  Table [dbo].[Localidades]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
/****** Object:  Table [dbo].[Peleadores]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
	[CantidadPeleas] [int] NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDojo] [int] NOT NULL,
	[IdGenero] [int] NOT NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peleas]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
	[FechaPelea] [datetime] NOT NULL,
	[IdTipoPelea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
/****** Object:  Table [dbo].[TipoPeleas]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
/****** Object:  Table [dbo].[TipoUsuarios]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
ALTER TABLE [dbo].[Peleadores]  WITH CHECK ADD FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([Id])
GO
ALTER TABLE [dbo].[Peleas]  WITH CHECK ADD FOREIGN KEY([IdDojo])
REFERENCES [dbo].[Dojos] ([Id])
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
/****** Object:  StoredProcedure [dbo].[AgregarDojo]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
@Observaciones varchar(255)
AS
INSERT INTO Dojos 
VALUES (0, @Nombre, @Direccion, @Localidad, @Provincia, @Observaciones, 1)

SET @CodigoDojo = @@IDENTITY

UPDATE Dojos SET Codigo = @CodigoDojo WHERE Id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[AgregarPelea]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
@Observaciones varchar(255),
@FechaPelea varchar(255)
AS
INSERT INTO Peleas 
VALUES (0, @IdPeleador1, @IdPeleador2, @IdDojo, @Observaciones, @FechaPelea, @IdTipoPelea,  1)

SET @Codigo = @@IDENTITY

UPDATE Peleas SET Codigo = @Codigo WHERE Id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[AgregarPeleador]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPeleador]
@Nombre varchar(100),
@Apellido varchar(100),
@Peso decimal(18,2),
@Altura int,
@CantidadPeleas int,
@IdCategoria int,
@IdDojo int,
@IdGenero int
AS
INSERT INTO Peleadores
OUTPUT inserted.Id
VALUES (@Nombre, @Apellido, @Peso, @Altura, @CantidadPeleas, @IdCategoria, @IdDojo, @IdGenero, 1)
GO
/****** Object:  StoredProcedure [dbo].[EliminarDojo]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarDojo]
@IdDojo int
AS
UPDATE Dojos SET Estado = 0 WHERE id = @IdDojo
GO
/****** Object:  StoredProcedure [dbo].[EliminarPelea]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPelea]
@IdPelea int
AS
UPDATE Pelea SET Estado = 0 WHERE id = @IdPelea
GO
/****** Object:  StoredProcedure [dbo].[EliminarPeleador]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPeleador]
@IdPeleador int
AS
UPDATE Peleadores SET Estado = 0 WHERE id = @IdPeleador
GO
/****** Object:  StoredProcedure [dbo].[ModificarDojo]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
@Observaciones varchar(255)
AS
UPDATE Dojos 
SET Nombre = @Nombre, Direccion = @Direccion, IdLocalidad = @Localidad, IdProvincia = @Provincia,
Observaciones = @Observaciones WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarPeleador]    Script Date: 23-Jun-23 10:18:00 PM ******/
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
@CantidadPeleas int,
@IdCategoria int,
@IdDojo int,
@IdGenero int
AS
UPDATE Peleadores 
SET Nombre = @Nombre, Apellido = @Apellido, Peso = @Peso, Altura = @Altura,
CantidadPeleas = @CantidadPeleas, IdCategoria = @IdCategoria, IdDojo = @IdDojo, IdGenero = @IdGenero
WHERE Id = @IdPeleador
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasPeleadores]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasPeleadores]
AS
SELECT Id IdCategoria, Codigo, Descripcion FROM Categorias WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojoPorId]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDojoPorId]
@IdDojo int
AS
SELECT D.Id IdDojo, D.Codigo, D.Nombre, D.Observaciones,
D.Direccion, L.Localidad, D.IdLocalidad, P.Provincia, D.IdProvincia
FROM Dojos D
INNER JOIN Localidades L ON L.Id = D.IdLocalidad 
INNER JOIN Provincias P ON P.Id = D.IdProvincia 
WHERE D.Estado = 1 AND D.Id = @IdDojo
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojosTodos]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDojosTodos]
AS
SELECT D.Id IdDojo, D.Codigo, D.Nombre NombreDojo, D.IdProvincia, 
D.IdLocalidad, D.Direccion, P.Provincia, L.Localidad, P.Provincia, D.Observaciones
FROM Dojos D
INNER JOIN Localidades L ON L.Id = D.IdLocalidad 
INNER JOIN Provincias P ON P.Id = D.IdProvincia 
WHERE D.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerGenerosPeleadores]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerGenerosPeleadores]
AS
SELECT Id IdGenero, Genero FROM Generos WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLocalidades]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLocalidades]
AS
SELECT Id, IdProvincia, Localidad FROM Localidades
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLocalidadesXProvincia]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLocalidadesXProvincia]
@IdProvincia int
AS
SELECT Id, IdProvincia, Localidad FROM Localidades WHERE IdProvincia = @IdProvincia
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores1Pelea]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores1Pelea]
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, ' + 
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', ' + C.Descripcion) as DatosDDL
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores1PeleaFiltrados]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores1PeleaFiltrados]
@txtBuscar varchar(255)
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, ' + 
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', ' + C.Descripcion) as DatosDDL
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1 AND P.Nombre LIKE '%' + @txtBuscar + '%';
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores2Pelea]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores2Pelea]
@IdPeleador1 INT
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, ' + 
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', ' + C.Descripcion) as DatosDDL
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1 AND P.Id != @IdPeleador1
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores2PeleaFiltrados]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerPeleadores2PeleaFiltrados]
@IdPeleador1 INT,
@txtBuscar varchar(255)
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero, D.Nombre Dojo, P.IdDojo,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, ' + 
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', ' + C.Descripcion) as DatosDDL
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1 AND P.Id != @IdPeleador1 AND P.Nombre LIKE '%' + @txtBuscar + '%';
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresSimilares]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadoresSimilares]
@IdPeleador1 INT
AS

DECLARE
@Peso decimal(18,2),
@Altura int,
@CantidadPeleas int,
@IdCategoria int,
@IdGenero int,
@IdDojo int

--Datos del primer peleador para compararlos con el segundo select
SELECT
@Peso = P.Peso,
@Altura = P.Altura,
@CantidadPeleas = P.CantidadPeleas,
@IdCategoria = C.Id,
@IdGenero = G.Id,
@IdDojo = P.IdDojo
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1 AND P.Id = @IdPeleador1

-- Datos del segundo peleador
SELECT TOP 5 P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero,
D.Nombre Dojo, P.IdDojo
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Peso BETWEEN (@Peso - 5) AND (@Peso + 5)
AND P.Altura BETWEEN (@Altura - 5) AND (@Altura + 5)
AND P.CantidadPeleas BETWEEN (@CantidadPeleas - 5) AND (@CantidadPeleas + 5)
AND C.Id = @IdCategoria 
AND P.IdDojo != @IdDojo
AND G.Id = @IdGenero
AND P.Id != @IdPeleador1 
AND P.Estado = 1
ORDER BY ABS(P.Peso - @Peso) + ABS(P.Altura - @Altura) + ABS(P.CantidadPeleas - @CantidadPeleas) ASC

GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresTodos]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadoresTodos]
AS
SELECT P.Id Id, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, G.Genero, P.IdGenero,
D.Nombre Dojo, P.IdDojo
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadorPorId]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleadorPorId]
@IdPeleador int
AS
SELECT P.Id IdPeleador, P.Id Codigo, P.Nombre, P.Apellido, (P.Nombre + ' ' + P.Apellido) AS NombreCompleto, 
P.Peso, P.Altura, P.CantidadPeleas, C.Descripcion Categoria, P.IdCategoria, D.Nombre Dojo, P.IdDojo, G.Genero, P.IdGenero,
(P.Nombre + ' ' + P.Apellido + ', ' + CONVERT(VARCHAR,P.Peso) + 'KG, ' + 
CONVERT(VARCHAR,P.Altura) + 'CM, ' + 'Peleas: ' + CONVERT(VARCHAR,P.CantidadPeleas) + ', ' + C.Descripcion) as DatosDDL
FROM Peleadores P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Categorias C ON C.Id = P.IdCategoria
INNER JOIN Generos G ON G.Id = P.IdGenero
WHERE P.Estado = 1 AND P.Id = @IdPeleador
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleaPorId]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleaPorId]
@IdPelea int
AS
SELECT P.Id AS Id, P.Id AS Codigo, D.Id AS IdDojo, D.Nombre AS Dojo, P.Observaciones, P.FechaPelea, TP.Id IdTipoPelea, TP.Descripcion TipoPelea,
--Peleador1
(PE1.Nombre + ' ' + PE1.Apellido) AS Peleador1Nombre,
PE1.Id IdP1, PE1.Id CodigoP1, PE1.Peso PesoP1, PE1.Altura AlturaP1, PE1.CantidadPeleas CantidadPeleasP1, 
C1.Descripcion CategoriaP1, C1.Id IdCategoriaP1, G1.Genero GeneroP1, G1.Id IdGeneroP1, D1.Nombre DojoP1,
D1.Id IdDojoP1,
--Peleador1
-----------
--Peleador2
(PE2.Nombre + ' ' + PE2.Apellido) AS Peleador1Nombre,
PE2.Id IdP2, PE2.Id CodigoP2, PE2.Peso PesoP2, PE2.Altura AlturaP2, PE2.CantidadPeleas CantidadPeleasP2, 
C2.Descripcion CategoriaP2, C2.Id IdCategoriaP2, G2.Genero GeneroP2, G2.Id IdGeneroP2, D2.Nombre DojoP2,
D2.Id IdDojoP2
--Peleador2
FROM Peleas P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Dojos D1 ON D1.Id = P.IdDojo
INNER JOIN Categorias C1 ON C1.Id = PE1.IdCategoria
INNER JOIN Generos G1 ON G1.Id = PE1.IdGenero
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
INNER JOIN Dojos D2 ON D2.Id = PE2.IdDojo
INNER JOIN Categorias C2 ON C2.Id = PE2.IdCategoria
INNER JOIN Generos G2 ON G2.Id =PE2.IdGenero
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
WHERE P.Estado = 1 AND P.Id = @IdPelea
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPeleasTodas]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleasTodas]
AS
SELECT P.Id AS Id, P.Id AS Codigo, 
    (PE1.Nombre + ' ' + PE1.Apellido) AS Peleador1Nombre,
    (PE2.Nombre + ' ' + PE2.Apellido) AS Peleador2Nombre,
    D.Id AS IdDojo, D.Nombre AS Dojo, P.Observaciones, P.FechaPelea, 
	TP.Id IdTipoPelea, TP.Descripcion TipoPelea
FROM Peleas P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
INNER JOIN TipoPeleas TP ON TP.Id = P.IdTipoPelea
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProvincias]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProvincias]
AS
SELECT Id, Provincia FROM Provincias
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTipoPeleas]    Script Date: 23-Jun-23 10:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTipoPeleas]
AS
SELECT Id IdTipoPelea, Codigo, Descripcion TipoPelea FROM TipoPeleas
GO
