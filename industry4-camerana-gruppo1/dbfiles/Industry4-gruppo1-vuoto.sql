CREATE TABLE [dbo].[Lavorazioni](
	[idlavorazione] [int] IDENTITY(1,1) NOT NULL,
	[fkordine] [int] NOT NULL,
	[fk_opzione] [int] NOT NULL,
	[note] [varchar](255) NULL,
	[inizio] [datetime] NULL,
	[fine] [datetime] NULL,
	[stato] [int] NULL,
	[fk_postazione] [int] NULL,
 CONSTRAINT [PK_LAVORAZIONI] PRIMARY KEY CLUSTERED 
(
	[idlavorazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpzioniLavorazione]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpzioniLavorazione](
	[idopz] [int] IDENTITY(1,1) NOT NULL,
	[opzione] [varchar](1) NULL,
	[fk_idtipolavorazione] [int] NOT NULL,
 CONSTRAINT [PK_OPZIONILAVORAZIONE] PRIMARY KEY CLUSTERED 
(
	[idopz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordini]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordini](
	[idordine] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NULL,
	[note] [varchar](255) NULL,
	[fk_utente] [int] NOT NULL,
 CONSTRAINT [PK_ORDINI] PRIMARY KEY CLUSTERED 
(
	[idordine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postazioni]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postazioni](
	[idpostazione] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NULL,
	[tag] [varchar](55) NULL,
	[fk_tipo] [int] NOT NULL,
 CONSTRAINT [PK_POSTAZIONI] PRIMARY KEY CLUSTERED 
(
	[idpostazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoLavorazione]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoLavorazione](
	[idtipolav] [int] IDENTITY(1,1) NOT NULL,
	[descrizione] [varchar](255) NULL,
 CONSTRAINT [PK_TIPOLAVORAZIONE] PRIMARY KEY CLUSTERED 
(
	[idtipolav] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPostazione]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPostazione](
	[idtipopost] [int] IDENTITY(1,1) NOT NULL,
	[descrizione] [varchar](255) NULL,
 CONSTRAINT [PK_TIPOPOSTAZIONE] PRIMARY KEY CLUSTERED 
(
	[idtipopost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoRuolo]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoRuolo](
	[idruolo] [int] IDENTITY(1,1) NOT NULL,
	[descrizione] [varchar](120) NULL,
	[priorità] [int] NULL,
 CONSTRAINT [PK_TIPORUOLO] PRIMARY KEY CLUSTERED 
(
	[idruolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utenti]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utenti](
	[idutente] [int] IDENTITY(1,1) NOT NULL,
	[usename] [varchar](120) NULL,
	[password] [varchar](255) NULL,
	[fk_ruolo] [int] NOT NULL,
 CONSTRAINT [PK_UTENTI] PRIMARY KEY CLUSTERED 
(
	[idutente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utenti_postazioni]    Script Date: 25/05/2018 17:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utenti_postazioni](
	[Utenti_postazioni] [int] IDENTITY(1,1) NOT NULL,
	[fk_utente] [int] NULL,
	[fk_postazione] [int] NULL,
 CONSTRAINT [PK_UTENTI_POSTAZIONI] PRIMARY KEY CLUSTERED 
(
	[Utenti_postazioni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lavorazioni]  WITH CHECK ADD  CONSTRAINT [Lavorazioni_fk0] FOREIGN KEY([fkordine])
REFERENCES [dbo].[Ordini] ([idordine])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Lavorazioni] CHECK CONSTRAINT [Lavorazioni_fk0]
GO
ALTER TABLE [dbo].[Lavorazioni]  WITH CHECK ADD  CONSTRAINT [Lavorazioni_fk1] FOREIGN KEY([fk_opzione])
REFERENCES [dbo].[OpzioniLavorazione] ([idopz])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Lavorazioni] CHECK CONSTRAINT [Lavorazioni_fk1]
GO
ALTER TABLE [dbo].[Lavorazioni]  WITH CHECK ADD  CONSTRAINT [Lavorazioni_fk2] FOREIGN KEY([fk_postazione])
REFERENCES [dbo].[Postazioni] ([idpostazione])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Lavorazioni] CHECK CONSTRAINT [Lavorazioni_fk2]
GO
ALTER TABLE [dbo].[OpzioniLavorazione]  WITH CHECK ADD  CONSTRAINT [OpzioniLavorazione_fk0] FOREIGN KEY([fk_idtipolavorazione])
REFERENCES [dbo].[TipoLavorazione] ([idtipolav])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OpzioniLavorazione] CHECK CONSTRAINT [OpzioniLavorazione_fk0]
GO
ALTER TABLE [dbo].[Ordini]  WITH CHECK ADD  CONSTRAINT [Ordini_fk0] FOREIGN KEY([fk_utente])
REFERENCES [dbo].[Utenti] ([idutente])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ordini] CHECK CONSTRAINT [Ordini_fk0]
GO
ALTER TABLE [dbo].[Postazioni]  WITH CHECK ADD  CONSTRAINT [Postazioni_fk0] FOREIGN KEY([fk_tipo])
REFERENCES [dbo].[TipoPostazione] ([idtipopost])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Postazioni] CHECK CONSTRAINT [Postazioni_fk0]
GO
ALTER TABLE [dbo].[Utenti]  WITH CHECK ADD  CONSTRAINT [Utenti_fk0] FOREIGN KEY([fk_ruolo])
REFERENCES [dbo].[TipoRuolo] ([idruolo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Utenti] CHECK CONSTRAINT [Utenti_fk0]
GO
ALTER TABLE [dbo].[Utenti_postazioni]  WITH CHECK ADD  CONSTRAINT [Utenti_postazioni_fk0] FOREIGN KEY([fk_utente])
REFERENCES [dbo].[Utenti] ([idutente])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Utenti_postazioni] CHECK CONSTRAINT [Utenti_postazioni_fk0]
GO
ALTER TABLE [dbo].[Utenti_postazioni]  WITH CHECK ADD  CONSTRAINT [Utenti_postazioni_fk1] FOREIGN KEY([fk_postazione])
REFERENCES [dbo].[Postazioni] ([idpostazione])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Utenti_postazioni] CHECK CONSTRAINT [Utenti_postazioni_fk1]
GO