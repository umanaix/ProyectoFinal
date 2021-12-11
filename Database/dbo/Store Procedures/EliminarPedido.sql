﻿CREATE PROCEDURE [dbo].[EliminarPedido]
 @IdPedido int


AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

    BEGIN TRY
            DELETE FROM dbo.PedidoEncabezado WHERE IdPedido=@IdPedido
			DELETE FROM dbo.PedidoDetalle WHERE IdPedido=@IdPedido
	
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