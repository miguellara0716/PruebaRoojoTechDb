USE [master]
GO
/****** Object:  Database [IVuelos]    Script Date: 5/11/2019 1:48:09 a. m. ******/
CREATE DATABASE [IVuelos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IViajes', FILENAME = N'C:\ProgramData\SOLIDWORKS Electrical\MSSQL12.TEW_SQLEXPRESS\MSSQL\DATA\IViajes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IViajes_log', FILENAME = N'C:\ProgramData\SOLIDWORKS Electrical\MSSQL12.TEW_SQLEXPRESS\MSSQL\DATA\IViajes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IVuelos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IVuelos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IVuelos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IVuelos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IVuelos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IVuelos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IVuelos] SET ARITHABORT OFF 
GO
ALTER DATABASE [IVuelos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IVuelos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IVuelos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IVuelos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IVuelos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IVuelos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IVuelos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IVuelos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IVuelos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IVuelos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IVuelos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IVuelos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IVuelos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IVuelos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IVuelos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IVuelos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IVuelos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IVuelos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IVuelos] SET  MULTI_USER 
GO
ALTER DATABASE [IVuelos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IVuelos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IVuelos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IVuelos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IVuelos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [IVuelos]
GO
/****** Object:  Table [dbo].[Localidades_VIJ]    Script Date: 5/11/2019 1:48:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades_VIJ](
	[IdLocalidad_LOC] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreLocalidad_LOC] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Localidad_VIJ] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad_LOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParametosVuelos_VUE]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParametosVuelos_VUE](
	[IdParametrizacion_PAR] [int] IDENTITY(1,1) NOT NULL,
	[NombreParametro_PAR] [varchar](100) NOT NULL,
	[ValorParametro_PAR] [varchar](150) NOT NULL,
	[DescripcionParametro_PAR] [varchar](200) NOT NULL,
 CONSTRAINT [PK_ParametosViaje_VIJ] PRIMARY KEY CLUSTERED 
(
	[IdParametrizacion_PAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelos_VUE]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelos_VUE](
	[IdVuelo_VUE] [bigint] IDENTITY(1,1) NOT NULL,
	[IdLocalidadOrigen_VUE] [bigint] NOT NULL,
	[IdLocalidadDestino_VUE] [bigint] NOT NULL,
	[Capacidad_VUE] [int] NOT NULL,
	[Disponible_VUE] [int] NOT NULL,
	[Precio_VUE] [numeric](16, 2) NOT NULL,
	[FechaVuelo_VUE] [datetime] NOT NULL,
 CONSTRAINT [PK_Viajes_VIJ] PRIMARY KEY CLUSTERED 
(
	[IdVuelo_VUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VuelosReservas_VUE]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VuelosReservas_VUE](
	[IdReservaVuelo_RVU] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentoReserva_RVU] [bigint] NOT NULL,
	[IdVuelo_RVU] [bigint] NOT NULL,
	[PrecioReserva_RVU] [numeric](16, 2) NOT NULL,
 CONSTRAINT [PK_ViajesReservas_VIJ] PRIMARY KEY CLUSTERED 
(
	[IdReservaVuelo_RVU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vuelos_VUE]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_VIJ_Localidad_VIJ] FOREIGN KEY([IdLocalidadOrigen_VUE])
REFERENCES [dbo].[Localidades_VIJ] ([IdLocalidad_LOC])
GO
ALTER TABLE [dbo].[Vuelos_VUE] CHECK CONSTRAINT [FK_Viajes_VIJ_Localidad_VIJ]
GO
ALTER TABLE [dbo].[Vuelos_VUE]  WITH CHECK ADD  CONSTRAINT [FK_Viajes_VIJ_Localidad_VIJ1] FOREIGN KEY([IdLocalidadDestino_VUE])
REFERENCES [dbo].[Localidades_VIJ] ([IdLocalidad_LOC])
GO
ALTER TABLE [dbo].[Vuelos_VUE] CHECK CONSTRAINT [FK_Viajes_VIJ_Localidad_VIJ1]
GO
ALTER TABLE [dbo].[VuelosReservas_VUE]  WITH CHECK ADD  CONSTRAINT [FK_ViajesReservas_VIJ_Viajes_VIJ] FOREIGN KEY([IdVuelo_RVU])
REFERENCES [dbo].[Vuelos_VUE] ([IdVuelo_VUE])
GO
ALTER TABLE [dbo].[VuelosReservas_VUE] CHECK CONSTRAINT [FK_ViajesReservas_VIJ_Viajes_VIJ]
GO
/****** Object:  StoredProcedure [dbo].[pa_InsertarReservaVuelo]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Angel Lara Alvarado
-- Create date: 3/11/2019
-- Description:	Sp que inserta una reveserva de vuelo 
--				y actualiza la cantidad de puestos 
--				disponibles en el vuelo.
-- =============================================
CREATE PROCEDURE [dbo].[pa_InsertarReservaVuelo]
	
				@IdDocumento BIGINT,
				@IdVuelo BIGINT,
				@ValorReserva Numeric(16,2)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @_Disponibles INT


	SELECT @_Disponibles = Disponible_VUE 
		FROM [dbo].Vuelos_VUE WITH (NOLOCK) 
	WHERE IdVuelo_VUE = @IdVuelo

	IF(@_Disponibles > 0)
	BEGIN

		INSERT INTO [dbo].[VuelosReservas_VUE]
			(DocumentoReserva_RVU
			,IdVuelo_RVU
			,PrecioReserva_RVU)
		VALUES
		(@IdDocumento
		,@IdVuelo
		,@ValorReserva)

		UPDATE Vuelos_VUE
			SET Disponible_VUE = Disponible_VUE - 1
		WHERE IdVuelo_VUE = @IdVuelo

	END
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerParametros_VUE]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Angel Lara Alvarado
-- Create date: 3/11/2019
-- Description:	Sp que obtiene un parametro 
--			    filtrandolo por su nombre.
-- =============================================
CREATE PROCEDURE [dbo].[pa_ObtenerParametros_VUE] 
		@NombreParametro varchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT IdParametrizacion_PAR, 
		   NombreParametro_PAR, 
		   ValorParametro_PAR,
		   DescripcionParametro_PAR
	FROM ParametosVuelos_VUE WITH (NOLOCK)
	WHERE NombreParametro_PAR = @NombreParametro

END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerReservasPorUsuario]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Angel Lara Alvarado
-- Create date: 4/11/2019
-- Description:	sp que obtiene los vuelos reservados 
--				por documento
-- =============================================
CREATE PROCEDURE [dbo].[pa_ObtenerReservasPorUsuario]
	
	@NumeroCedula BIGINT 


AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT IdReservaVuelo_RVU
		  ,DocumentoReserva_RVU
		  ,IdVuelo_RVU
		  ,origen.NombreLocalidad_LOC
		  ,destino.NombreLocalidad_LOC
		  ,FechaVuelo_VUE
		  ,PrecioReserva_RVU
	FROM VuelosReservas_VUE WITH (NOLOCK)
	INNER JOIN Vuelos_VUE WITH(NOLOCK) ON IdVuelo_RVU = IdVuelo_VUE
	INNER JOIN Localidades_VIJ origen ON IdLocalidadOrigen_VUE = origen.NombreLocalidad_LOC
	INNER JOIN Localidades_VIJ destino ON IdLocalidadDestino_VUE = destino.NombreLocalidad_LOC 
	WHERE DocumentoReserva_RVU = @NumeroCedula

END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerTodosVuelosDisponibles]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Angel Lara Alvarado
-- Create date: 4/11/2019
-- Description:	sp que obtiene todos los vuelos disponibles.
-- =============================================
CREATE PROCEDURE  [dbo].[pa_ObtenerTodosVuelosDisponibles]
	
AS
BEGIN
	
	SET NOCOUNT ON;

		SELECT   IdVuelo_VUE
				,IdLocalidadOrigen_VUE
				,origen.NombreLocalidad_LOC as origen
				,IdLocalidadDestino_VUE
				,destino.NombreLocalidad_LOC as destino
				,Capacidad_VUE
				,Disponible_VUE
				,FechaVuelo_VUE
				,Precio_VUE
		FROM Vuelos_VUE WITH (NOLOCK)
		INNER JOIN IVuelos.dbo.Localidades_VIJ origen ON origen.IdLocalidad_LOC = IdLocalidadOrigen_VUE
		INNER JOIN IVuelos.dbo.Localidades_VIJ destino ON destino.IdLocalidad_LOC = IdLocalidadDestino_VUE
		WHERE Disponible_VUE > 0 
		AND FechaVuelo_VUE > DATEADD(HOUR, 3, SYSDATETIME()) 
		
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ObtenerVuelosDisponibles]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Angel Lara Alvarado
-- Create date: 4/11/2019
-- Description:	sp que obtiene los vuelos disponibles
--              aplicandoles diferentes filtros
-- =============================================
CREATE PROCEDURE  [dbo].[pa_ObtenerVuelosDisponibles]
	@Origen BIGINT = 0,
	@Destino BIGINT = 0,
	@Fecha DATETIME = NULL
AS
BEGIN
	
	SET NOCOUNT ON;

		SELECT   IdVuelo_VUE
				,IdLocalidadOrigen_VUE
				,IdLocalidadDestino_VUE
				,Capacidad_VUE
				,Disponible_VUE
				,FechaVuelo_VUE
		FROM Vuelos_VUE WITH (NOLOCK)
		WHERE Disponible_VUE > 0 
		AND IdLocalidadOrigen_VUE = IIF(@Origen = 0,IdLocalidadOrigen_VUE,@Origen) 
		AND IdLocalidadDestino_VUE = IIF(@Destino = 0,IdLocalidadDestino_VUE,@Destino)
		AND CONVERT(VARCHAR(12),FechaVuelo_VUE) = IIF(@Fecha IS NULL,CONVERT(VARCHAR(12),FechaVuelo_VUE),CONVERT(VARCHAR(12),@Fecha))
END
GO
/****** Object:  StoredProcedure [dbo].[pa_VerificarVuelosReservados]    Script Date: 5/11/2019 1:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Angel Lara Alvarado
-- Create date: 4/11/2019
-- Description:	sp que verifica si existen vuelos
--				reservados el mismo dia.
-- =============================================
CREATE PROCEDURE [dbo].[pa_VerificarVuelosReservados] 
			
			@NumeroDeCedula BIGINT
AS
BEGIN
	
	SET NOCOUNT ON;

		DECLARE @_FechaActual DATETIME = SYSDATETIME()

		IF EXISTS (SELECT NULL
						FROM IVuelos.dbo.VuelosReservas_VUE WITH (NOLOCK)
					INNER JOIN IVuelos.dbo.Vuelos_VUE WITH (NOLOCK) ON IdVuelo_RVU = IdVuelo_VUE
					WHERE DocumentoReserva_RVU = @NumeroDeCedula 
					AND CONVERT(VARCHAR(12),FechaVuelo_VUE) = CONVERT(VARCHAR(12), @_FechaActual))
			BEGIN
				SELECT 0 AS Permitido
			END
			ELSE
			BEGIN
				SELECT 1 AS Permitido
			END

END
GO
USE [master]
GO
ALTER DATABASE [IVuelos] SET  READ_WRITE 
GO
