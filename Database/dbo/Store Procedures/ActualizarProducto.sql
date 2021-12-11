﻿CREATE PROCEDURE [dbo].[ActualizarProducto]
    @IdProducto int,
	@NombreProducto varchar(250),
	@Precio Decimal,
	@CantidadDisponible Int,
	@Caracteristicas varchar(250),
	@Estado bit,
	@IdCategoria int

AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

    BEGIN TRY
	
	UPDATE dbo.Productos SET
	 NombreProducto=@NombreProducto,
	 Precio=@Precio,
	 CantidadDisponible=@CantidadDisponible,
	 Caracteristicas=@Caracteristicas,
	 Estado=@Estado,
	 IdCategoria=@IdCategoria
	WHERE 
	       IdProducto=@IdProducto
	
	  COMMIT TRANSACTION TRASA
	  SELECT 0 AS CodeError, '' AS MsgError

  END TRY

  BEGIN CATCH

	   SELECT 
			 ERROR_NUMBER() AS CodeError,
			 ERROR_MESSAGE() AS MsgError
   
	   ROLLBACK TRANSACTION TRASA

   END CATCH

 END