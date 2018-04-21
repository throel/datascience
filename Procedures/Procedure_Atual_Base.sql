USE [ITNBI]
GO
/****** Object:  StoredProcedure [dbo].[ITNBI_BRASIL]    Script Date: 21/04/2018 13:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Throel
-- Create date: 19/01/2017
-- Description:	Base Brasil
-- =============================================
ALTER PROCEDURE [dbo].[ITNBI_BRASIL] 
	AS
BEGIN 
-- =============================================
-- Cria a Tabela Pessoa se não existir
-- =============================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Pessoa' AND xtype='U')
    CREATE TABLE Pessoa (
  [idPessoa] int not null,
  [Nome] VARCHAR(150),
  [CPF] VARCHAR(45),
  [RG] VARCHAR(45),
  [RendaPresumida] varchar (50),
  [NomeMae] VARCHAR(150),
  [MesNasc] VARCHAR(10),
  [DiaNasc] VARCHAR(10),
  [AnoNasc] VARCHAR(10),
  [SEXO] VARCHAR(10),
  primary key ([idPessoa]),
    )

-- =============================================
-- Cria a tabela HouseHold se não existir
-- =============================================

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='HouseHold' AND xtype='U')
    CREATE TABLE HouseHold (
  [idHouseHold] INT identity,
  [idPessoa] numeric,
  [Endereco] VARCHAR(100),
  [Numero] VARCHAR(45),
  [Complemento] VARCHAR(150),
  [Bairro] VARCHAR(45),
  [Cidade] VARCHAR(100),
  [UF] VARCHAR(45),
  [CEP] VARCHAR(45),
  [Observacao] VARCHAR(150),

  )

-- =============================================
-- Cria a tabela Celulares se não existir
-- =============================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Celulares' AND xtype='U')
    CREATE TABLE Celulares (
  [idcelulares] int identity,
  [ddd] varchar(10),
  [celular] VARCHAR(45),
  [idPessoa] numeric,
)
-- =============================================
-- Cria a tabela Emails se não existir
-- =============================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Emails' AND xtype='U')
    CREATE TABLE Emails (
  [idEmail] int identity,
  [Email] VARCHAR(150),
  [idPessoa] numeric,
)
-- =============================================
-- Cria a tabela TelFixos se não existir
-- =============================================
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TelFixos' AND xtype='U')
    CREATE TABLE TelFixos (
  [idTelFixo] int identity,
  [ddd] varchar(10),
  [Telefone] VARCHAR(45),
  [idPessoa] numeric,
)

-- =============================================
-- Cria a tabela RedeSociais se não existir
-- =============================================


-- =============================================
-- Cria a tabela Fotos se não existir
-- =============================================


-- =============================================
-- Limpa a Todas as Tabelas Criadas
-- =============================================
IF OBJECT_ID('[dbo].[Pessoa]') IS NOT NULL
TRUNCATE TABLE [dbo].[Pessoa]
IF OBJECT_ID('[dbo].[Celulares]') IS NOT NULL
TRUNCATE TABLE [dbo].[Pessoa]
IF OBJECT_ID('[dbo].[Contatos]') IS NOT NULL
TRUNCATE TABLE [dbo].[Pessoa]
IF OBJECT_ID('[dbo].[Emails]') IS NOT NULL
TRUNCATE TABLE [dbo].[Pessoa]
IF OBJECT_ID('[dbo].[HouseHold]') IS NOT NULL
TRUNCATE TABLE [dbo].[Pessoa]
IF OBJECT_ID('[dbo].[TelFixos]') IS NOT NULL
TRUNCATE TABLE [dbo].[Pessoa]

	
END
