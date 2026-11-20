USE [Escola]
GO
/****** Objeto:  Table [dbo].[ALUNO]    Data do Script: 19/11/2026 19:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALUNO](
	[matricula] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[data_nascimento] [date] NOT NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK__ALUNO__30962D1433DD7F70] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[CURSO]    Data do Script: 19/11/2026 19:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURSO](
	[codigo_curso] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[carga_horaria] [smallint] NOT NULL,
	[registro_professor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ESPECIALIDADE_PROFESSOR]    Data do Script: 19/11/2026 19:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESPECIALIDADE_PROFESSOR](
	[registro_professor] [int] NOT NULL,
	[especialidade] [varchar](50) NOT NULL,
 CONSTRAINT [pk_especialidade_professor] PRIMARY KEY CLUSTERED 
(
	[registro_professor] ASC,
	[especialidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[MATRICULA]    Data do Script: 19/11/2026 19:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATRICULA](
	[matricula_aluno] [int] NOT NULL,
	[codigo_curso] [int] NOT NULL,
	[data_matricula] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[matricula_aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[PROFESSOR]    Data do Script: 19/11/2026 19:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESSOR](
	[registro_professor] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[registro_professor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ALUNO] ([matricula], [nome], [data_nascimento], [email]) VALUES (1, N'Alex', CAST(N'2000-09-06' AS Date), N'alex@exemplo.com')
INSERT [dbo].[ALUNO] ([matricula], [nome], [data_nascimento], [email]) VALUES (2, N'Ana', CAST(N'2001-10-11' AS Date), N'ana@exemplo.com')
INSERT [dbo].[ALUNO] ([matricula], [nome], [data_nascimento], [email]) VALUES (3, N'Jorge', CAST(N'2010-11-11' AS Date), N'jorge@exemplo.com')
INSERT [dbo].[ALUNO] ([matricula], [nome], [data_nascimento], [email]) VALUES (4, N'Mario', CAST(N'2020-11-10' AS Date), NULL)
GO
INSERT [dbo].[CURSO] ([codigo_curso], [nome], [carga_horaria], [registro_professor]) VALUES (1, N'C# 2', 200, 1030)
INSERT [dbo].[CURSO] ([codigo_curso], [nome], [carga_horaria], [registro_professor]) VALUES (2, N'SQL SERVER ', 200, 1040)
INSERT [dbo].[CURSO] ([codigo_curso], [nome], [carga_horaria], [registro_professor]) VALUES (3, N'JAVA', 300, 1030)
INSERT [dbo].[CURSO] ([codigo_curso], [nome], [carga_horaria], [registro_professor]) VALUES (4, N'JAVASCRIPT', 33, 1030)
GO
INSERT [dbo].[ESPECIALIDADE_PROFESSOR] ([registro_professor], [especialidade]) VALUES (1030, N'C#')
INSERT [dbo].[ESPECIALIDADE_PROFESSOR] ([registro_professor], [especialidade]) VALUES (1030, N'SQL')
INSERT [dbo].[ESPECIALIDADE_PROFESSOR] ([registro_professor], [especialidade]) VALUES (1040, N'C#')
GO
INSERT [dbo].[MATRICULA] ([matricula_aluno], [codigo_curso], [data_matricula]) VALUES (1, 1, CAST(N'2026-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[MATRICULA] ([matricula_aluno], [codigo_curso], [data_matricula]) VALUES (2, 3, CAST(N'2026-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[MATRICULA] ([matricula_aluno], [codigo_curso], [data_matricula]) VALUES (3, 2, CAST(N'2026-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[MATRICULA] ([matricula_aluno], [codigo_curso], [data_matricula]) VALUES (4, 1, CAST(N'2026-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PROFESSOR] ([registro_professor], [nome], [email]) VALUES (1030, N'Lucas Aragao', N'professor1030@exemplo.com')
INSERT [dbo].[PROFESSOR] ([registro_professor], [nome], [email]) VALUES (1040, N'Vinio Silva', N'professor1040@exemplo.com')
INSERT [dbo].[PROFESSOR] ([registro_professor], [nome], [email]) VALUES (1050, N'Guilherme da Silva', N'professor1050@exemplo.com')
GO
SET ANSI_PADDING ON
GO
/****** Objeto:  Index [UQ_Aluno_Email]    Data do Script: 19/11/2026 19:48:59 ******/
ALTER TABLE [dbo].[ALUNO] ADD  CONSTRAINT [UQ_Aluno_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Objeto:  Index [UQ__CURSO__6F71C0DC9BA5045F]    Data do Script: 19/11/2026 19:48:59 ******/
ALTER TABLE [dbo].[CURSO] ADD UNIQUE NONCLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Objeto:  Index [UQ__PROFESSO__AB6E616475AFF783]    Data do Script: 19/11/2026 19:48:59 ******/
ALTER TABLE [dbo].[PROFESSOR] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MATRICULA] ADD  DEFAULT (getdate()) FOR [data_matricula]
GO
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [fk_curso_professor] FOREIGN KEY([registro_professor])
REFERENCES [dbo].[PROFESSOR] ([registro_professor])
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [fk_curso_professor]
GO
ALTER TABLE [dbo].[ESPECIALIDADE_PROFESSOR]  WITH CHECK ADD  CONSTRAINT [fk_especialidade_professor] FOREIGN KEY([registro_professor])
REFERENCES [dbo].[PROFESSOR] ([registro_professor])
GO
ALTER TABLE [dbo].[ESPECIALIDADE_PROFESSOR] CHECK CONSTRAINT [fk_especialidade_professor]
GO
ALTER TABLE [dbo].[MATRICULA]  WITH CHECK ADD  CONSTRAINT [fk_matricula_codigo_curso] FOREIGN KEY([codigo_curso])
REFERENCES [dbo].[CURSO] ([codigo_curso])
GO
ALTER TABLE [dbo].[MATRICULA] CHECK CONSTRAINT [fk_matricula_codigo_curso]
GO
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [ck_curso_carga] CHECK  (([carga_horaria]>(0)))
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [ck_curso_carga]
GO
