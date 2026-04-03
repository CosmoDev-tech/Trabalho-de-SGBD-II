
CREATE DATABASE Eventos
COLLATE Latin1_General_CI_AI;
GO
USE Eventos;
GO
CREATE TABLE Eventos (
EventoID INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(100) NOT NULL,
Descricao TEXT,
DataInicio DATE,
DataFim DATE,
Local_E VARCHAR(100) NOT NULL,
Cidade VARCHAR(100) NOT NULL,
Capacidade INT NOT NULL,
PrecoInscricao DECIMAL(10,2) NOT NULL CONSTRAINT DF_Ev_Preco DEFAULT 0.00,
TipoEvento VARCHAR(50) NOT NULL CONSTRAINT DF_Ev_Tipo DEFAULT 'Conferencia',
CONSTRAINT CK_Ev_Datas CHECK (DataFim >= DataInicio),
CONSTRAINT CK_Ev_Capacidade CHECK (Capacidade > 0),
CONSTRAINT CK_Ev_Preco CHECK (PrecoInscricao >= 0),
CONSTRAINT CK_Ev_Tipo CHECK (TipoEvento IN
('Conferencia','Workshop','Seminario','Simposio','Congresso'))
);
GO
CREATE TABLE Participantes (
ParticipanteID INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(60) UNIQUE,
Telefone VARCHAR(20) UNIQUE,
Instituicao VARCHAR(200) NULL,
DataRegisto DATETIME2(0) NOT NULL CONSTRAINT DF_Part_Data DEFAULT SYSDATETIME(),
DataNascimento DATE,
CONSTRAINT UQ_Part_Email UNIQUE (Email),
CONSTRAINT UQ_Part_DataNascimento CHECK (DataNascimento < GETDATE()), 
CONSTRAINT UQ_Part_Telefone CHECK (LEN(Telefone) = 9 OR Telefone IS NULL) 
);
GO
CREATE TABLE Oradores (
OradorID INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(80) NOT NULL,
Email VARCHAR(65) UNIQUE,
Especialidade VARCHAR(95) NULL,
Instituicao VARCHAR(50) NULL,
Cidade VARCHAR(50) NOT NULL,
CONSTRAINT UQ_Or_Email UNIQUE (Email)
);
GO
CREATE TABLE Sessoes (
SessaoID INT PRIMARY KEY IDENTITY(1,1),
EventoID INT NOT NULL,
OradorID INT NOT NULL,
Titulo VARCHAR(60) NOT NULL,
DataHoraInicio DATETIME2(0) NOT NULL,
DataHoraFim DATETIME2(0) NOT NULL,
Sala VARCHAR(50) NULL,
TipoSessao VARCHAR(30) NULL CONSTRAINT DF_Sess_Tipo DEFAULT 'Palestra',
CONSTRAINT CK_Sess_Datas CHECK (DataHoraFim > DataHoraInicio),
CONSTRAINT CK_Sess_Tipo CHECK (TipoSessao IN
('Palestra','Workshop','Painel','Mesa Redonda','Poster')),
CONSTRAINT FK_Sess_Evento FOREIGN KEY (EventoID)
REFERENCES Eventos(EventoID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_Sess_Orador FOREIGN KEY (OradorID)
REFERENCES Oradores(OradorID) ON DELETE NO ACTION ON UPDATE CASCADE
);
GO
CREATE TABLE Inscricoes (
InscricaoID INT PRIMARY KEY IDENTITY(1,1),
ParticipanteID INT NOT NULL,
EventoID INT NOT NULL,
DataInscricao DATETIME2(0) NOT NULL CONSTRAINT DF_Insc_Data DEFAULT SYSDATETIME(),
StatusPagamento VARCHAR(20) NOT NULL CONSTRAINT DF_Insc_Est DEFAULT 'Pendente',
ValorPago DECIMAL(10,2) NOT NULL CONSTRAINT DF_Insc_Val DEFAULT 0.00,
CONSTRAINT UQ_Insc_Part_Ev UNIQUE (ParticipanteID, EventoID),
CONSTRAINT CK_Insc_StatusPagamento CHECK (StatusPagamento IN ('Pago','Pendente','Cancelad0')),
CONSTRAINT CK_Insc_Valor CHECK (ValorPago >= 0),
CONSTRAINT FK_Insc_Part FOREIGN KEY (ParticipanteID)
REFERENCES Participantes(ParticipanteID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_Insc_Evento FOREIGN KEY (EventoID)
REFERENCES Eventos(EventoID) ON DELETE NO ACTION ON UPDATE CASCADE
);
GO-- -- ÍNDICES para otimização de consultas (Design Físico — Sebenta Cap. 6.4)-- 
CREATE INDEX IX_Ev_Cidade ON Eventos(Cidade);
CREATE INDEX IX_Ev_Datas ON Eventos(DataInicio, DataFim);
CREATE INDEX IX_Sess_Evento ON Sessoes(EventoID);
CREATE INDEX IX_Sess_Orador ON Sessoes(OradorID);
CREATE INDEX IX_Insc_Evento ON Inscricoes(EventoID);
CREATE INDEX IX_Insc_Part ON Inscricoes(ParticipanteID);
CREATE INDEX IX_Or_Cidade ON Oradores(Cidade);
GO