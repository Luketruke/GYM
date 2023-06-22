USE [Gimnasio]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  Table [dbo].[Dojos]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dojos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NULL,
	[Nombre] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[Generos]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](255) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  Table [dbo].[Peleadores]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  Table [dbo].[Peleas]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provincia] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](25) NULL,
	[Usuario] [varchar](255) NULL,
	[Contrasenia] [varchar](255) NULL,
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
/****** Object:  StoredProcedure [dbo].[AgregarDojo]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarPelea]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPelea]
@Codigo int,
@IdPeleador1 int,
@IdPeleador2 int,
@IdDojo int,
@Observaciones varchar(255),
@FechaPelea varchar(255)
AS
INSERT INTO Peleas 
VALUES (0, @IdPeleador1, @IdPeleador2, @IdDojo, @Observaciones, @FechaPelea, 1)

SET @Codigo = @@IDENTITY

UPDATE Peleas SET Codigo = @Codigo WHERE Id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[AgregarPeleador]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarDojo]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarDojo]
@IdDojo int
AS
UPDATE Dojos SET Estado = 0 WHERE id = @IdDojo
GO
/****** Object:  StoredProcedure [dbo].[EliminarPeleador]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPeleador]
@IdPeleador int
AS
UPDATE Peleadores SET Estado = 0 WHERE id = @IdPeleador
GO
/****** Object:  StoredProcedure [dbo].[ModificarDojo]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarPeleador]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasPeleadores]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasPeleadores]
AS
SELECT Id IdCategoria, Codigo, Descripcion FROM Categorias WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDojoPorId]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerDojosTodos]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerGenerosPeleadores]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerGenerosPeleadores]
AS
SELECT Id IdGenero, Genero FROM Generos WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLocalidades]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLocalidades]
AS
SELECT Id, IdProvincia, Localidad FROM Localidades
GO
/****** Object:  StoredProcedure [dbo].[ObtenerLocalidadesXProvincia]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerLocalidadesXProvincia]
@IdProvincia int
AS
SELECT Id, IdProvincia, Localidad FROM Localidades WHERE IdProvincia = @IdProvincia
GO
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores1Pelea]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores1PeleaFiltrados]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores2Pelea]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerPeleadores2PeleaFiltrados]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresSimilares]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadoresTodos]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPeleadorPorId]    Script Date: 22-Jun-23 2:49:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPeleasTodas]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPeleasTodas]
AS
SELECT P.Id AS Id, P.Id AS Codigo, 
    (PE1.Nombre + ' ' + PE1.Apellido) AS Peleador1Nombre,
    (PE2.Nombre + ' ' + PE2.Apellido) AS Peleador2Nombre,
    D.Id AS IdDojo, D.Nombre AS Dojo, P.Observaciones, P.FechaPelea
FROM Peleas P
INNER JOIN Dojos D ON D.Id = P.IdDojo
INNER JOIN Peleadores PE1 ON P.IdPeleador1 = PE1.Id
INNER JOIN Peleadores PE2 ON P.IdPeleador2 = PE2.Id
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProvincias]    Script Date: 22-Jun-23 2:49:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProvincias]
AS
SELECT Id, Provincia FROM Provincias
GO
