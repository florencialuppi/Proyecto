USE [SerieFlix]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 29/7/2019 02:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 29/7/2019 02:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idiomas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Idioma] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Idiomas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 29/7/2019 02:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Genero] [int] NOT NULL,
	[Idioma] [int] NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (1, N'Drama')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (2, N'Comedia')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (3, N'Policial')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (4, N'Ciencia Ficcion')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (5, N'Intriga')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (6, N'Terror')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (7, N'Crimen')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (8, N'Suspenso')
INSERT [dbo].[Generos] ([ID], [Genero]) VALUES (9, N'Sobrenatural')
SET IDENTITY_INSERT [dbo].[Generos] OFF
SET IDENTITY_INSERT [dbo].[Idiomas] ON 

INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (1, N'Ingles')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (2, N'Español')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (3, N'Aleman')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (4, N'Sueco')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (5, N'Catalan')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (6, N'Frances')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (7, N'Chino')
INSERT [dbo].[Idiomas] ([ID], [Idioma]) VALUES (8, N'Portugues')
SET IDENTITY_INSERT [dbo].[Idiomas] OFF
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (1, N'Dark', 4, 3)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (2, N'Friends', 2, 1)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (3, N'QuickSand', 7, 4)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (4, N'Lucifer', 3, 1)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (5, N'La Casa de Papel', 5, 2)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (6, N'Stranger Things', 4, 1)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (7, N'The Haunting of Hill House', 6, 1)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (8, N'Chilling Adventures of Sabrina ', 1, 1)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (9, N'Merli', 2, 5)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (10, N'Parfum', 5, 3)
INSERT [dbo].[Series] ([ID], [Titulo], [Genero], [Idioma]) VALUES (11, N'The End of F World', 1, 1)
SET IDENTITY_INSERT [dbo].[Series] OFF
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Generos] FOREIGN KEY([Genero])
REFERENCES [dbo].[Generos] ([ID])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Generos]
GO
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Idiomas] FOREIGN KEY([Idioma])
REFERENCES [dbo].[Idiomas] ([ID])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Idiomas]
GO
