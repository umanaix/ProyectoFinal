﻿CREATE TABLE [dbo].[Categorias]
(
	IdCategoria INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Categoria PRIMARY KEY CLUSTERED(IdCategoria),
	Categoria varchar(250) NOT NULL,
	   
)WITH (DATA_COMPRESSION = PAGE)
GO