INSERT INTO Eventos (Nome, Descricao, DataInicio, DataFim,
Local_E, Cidade, Capacidade, PrecoInscricao, TipoEvento)
VALUES
(N'I Congresso Nacional de IA e Data Science',
N'Debate sobre o futuro da IA em Angola',
'2026-03-10','2026-03-12',
N'Sala de Conferência do Grande Hotel Uíge','Uíge',100,5000.00,'Congresso'),
(N'Workshop Avancado de Machine Learning',
N'Tecnicas de ML aplicadas a agricultura',
'2026-04-05','2026-04-06',
N'Auditório Nº02 da Unikiv (IP)','Uíge',150,2500.00,'Workshop'),
(N'Seminario de Ciberseguranca em Africa',
N'Ameacas e solucoes para o continente africano',
'2026-05-15','2026-05-17',
N'Auditório Nº02 da Unikiv (IP)','Uíge',150,3000.00,'Seminario'),
(N'IV Simposio de Engenharia Informatica',
N'Inovacao tecnologica e desenvolvimento sustentavel',
'2026-06-20','2026-06-22',
N'Auditório Nº02 da Unikiv (IP)','Uíge',200,0.00,'Simposio'),
(N'Conferencia Internacional de Bases de Dados',
N'Tendencias em SGBD relacionais e NoSQL',
'2026-07-10','2026-07-11',
N'Hotel Bago Vermelho','Uíge',80,8000.00,'Conferencia');
GO

INSERT INTO Participantes (Nome, Email, Telefone, Instituicao, DataNascimento)
VALUES
(N'Antonio Lopes', N'antonio@gmail.com', '923001001','Nzenzo Estrela', '2001-03-01'),
(N'Beatriz Ferreira', N'beatriz@gmail.com', '923001002','ISPU', '2006-01-10'),
(N'Celestino Mbala', N'celestino@gmail.com','923001003',N'Kimpa Vita', '2000-2-27'),
(N'Mendes Eduardo', N'mendes@gmail.com', '923001004','Kimpa Vita', '1998-04-01'),
(N'Eduardo Neto', N'eduardo@gmail.com', '923001005','ISCED', '2002-05-20'),
(N'Filomena Gomes', N'filomena@gmail.com', '923001006','ISPU', '2003-06-11'),
(N'Goncalo Pereira', N'goncal@gmail.com', '923001007','ISPU', '2004-07-30'),
(N'Helena Silva', N'helena@gmail.com', '923001008',N'Kimpa Vita', '1999-08-15'),
(N'Ivan Rodrigues', N'ivan@gmail.com', '923001009','Nzenzo Estrela', '2000-09-04'),
(N'Joana Almeida', N'joana@gmail.com', '923001010','Nzenzo Estrela', '2003-10-25'),
(N'Kizomba Luamba', N'kizomba@gmail.com', '923001011',N'Kimpa Vita', '2005-03-10'),
(N'Laura Mendes', N'laura@gmail.com', '923001012','ISCED', '2007-04-25'),
(N'Manuel Carvalho', N'manuel@gmail.com', '923001013','ISCED', '1997-11-12'),
(N'Natalia Brito', N'natalia@gmail.com', '923001014','ISPU', '1996-12-13'),
(N'Oscar Tomas', N'oscar@gmail.com', '923001015','Nzenzo Estrela', '1995-03-31'),
(N'Patricia Vidal', N'patricia@gmail.com', '923001016','ISCED', '1994-04-21'),
(N'Quintino Figueira', N'quintino@gmail.com', '923001017','Nzenzo Estrela', '1993-05-09'),
(N'Rita Barreto', N'rita@gmail.com', '923001018',N'Kimpa Vita', '1992-07-26'),
(N'Sergio Lemos', N'sergio@gmail.com', '923001019','ISPU', '1991-09-10'),
(N'Teresa Amaral', N'teresa@gmail.com', '923001020','ISCED', '1990-08-27');
GO

INSERT INTO Oradores (Nome, Email, Especialidade, Instituicao, Cidade)
VALUES
(N'Msc. Kanga Pedro', N'kangapedro@gmail.com', N'Data Science','Kimpa Vita', N'Uíge'),
(N'Luzaiso Manuel', N'lumanuel@gmail.com', N'Mestre de Cerimonia', 'Kimpa Vita', N'Uíge'),
(N'Eng. Cândido Kiluando', N'ckiluando@gmail.com', N'Redes de Computadores e Segurança', N'Kimpa Vita', N'Uíge'),
(N'Eng. Paulo Mieze', N'miezepaulo@gmail.com', N'Especialista em Linguagem de Programação', 'Kimpa Vita', N'Uíge'),
(N'Eng. Pedro Neto', N'p.neto@gmail.com', N'Cloud Computing', 'ISPTEC', N'Luanda'),
(N'Eng. Lopes Miranda', N'lopes15@gmail.com', N'Data Science', 'UAN', N'Luanda'),
(N'Dr. Joao Teixeira', N'j.teix@gmail.com', N'Seguranca de Redes', 'UCAN', N'Luanda'),
(N'Eng. Jelson Girão', N'girao10@gmail.com', N'Ciência da Computação', N'ISPB', N'Benguela'),
(N'Eng. Benedito David', N'beneditodavid@gmail.com', N'Ciência da Computação', 'IMETRO', N'Luanda'),
(N'Eng. José Marques', N'marques@gmail.com', N'Computacao Distribuida', 'ISPH',
N'Huíla');
GO


INSERT INTO Sessoes (EventoID,OradorID,Titulo,DataHoraInicio,DataHoraFim,Sala,TipoSessao)
VALUES
(1,1,N'IA Generativa em Angola', '2026-03-10 09:00','2026-03-10 11:00',N'Sala
A','Palestra'),
(1,6,N'Data Science para Desenvolvimento','2026-03-10 14:00','2026-03-10 16:00',N'Sala
B','Palestra'),
(1,5,N'Cloud e Big Data', '2026-03-11 09:00','2026-03-11 11:00',N'Sala A','Painel'),
(2,2,N'Regressao e Classificacao', '2026-04-05 09:00','2026-04-05 13:00',N'Lab
1','Workshop'),
(2,9,N'MLOps e Deploy de Modelos', '2026-04-06 09:00','2026-04-06 13:00',N'Lab
1','Workshop'),
(3,3,N'Ataques APT em Africa', '2026-05-15 10:00','2026-05-15 12:00',N'Sala
Principal','Palestra'),
(3,7,N'Seguranca em Redes WiFi', '2026-05-16 09:00','2026-05-16 11:00',N'Sala
B','Palestra'),
(4,8,N'Normalizacao e Otimizacao BD', '2026-06-20 09:00','2026-06-20
11:00',N'Auditorio','Palestra'),
(4,10,N'Computacao na Nuvem', '2026-06-21 14:00','2026-06-21 16:00',N'Sala 2','Palestra'),
(5,8,N'SGBD Relacionais vs NoSQL', '2026-07-10 09:00','2026-07-10 11:00',N'Sala
VIP','Palestra'),
(5,4,N'Big Data com Apache Spark', '2026-07-10 14:00','2026-07-10 16:00',N'Sala
VIP','Palestra'),
(1,3,N'Ciberseguranca e IA', '2026-03-12 09:00','2026-03-12 11:00',N'Sala C','Mesa
Redonda');
GO

INSERT INTO Inscricoes (ParticipanteID,EventoID,StatusPagamento,ValorPago)
VALUES
(1,1,'Pago',5000.00),(2,1,'Pago',5000.00),(3,1,'Pago',5000.00),
(4,1,'Pago',5000.00),(5,1,'Pago',5000.00),(6,1,'Pendente', 0.00),
(7,1,'Pago',5000.00),(8,1,'Cancelad0', 0.00),(9,1,'Pago',5000.00),
(10,1,'Cancelad0',5000.00),-- Evento 2 (Workshop ML) – 6 inscrições
(1,2,'Pago',2500.00),(3,2,'Pago',2500.00),(5,2,'Pago',2500.00),
(7,2,'Pago',2500.00),(11,2,'Pendente',2500.00),(12,2,'Pendente',0.00),-- Evento 3 (Seminário Cibersegurança) – 6 inscrições
(2,3,'Cancelad0',3000.00),(4,3,'Pago',3000.00),(6,3,'Pago',3000.00),
(8,3,'Pago',3000.00),(13,3,'Pago',3000.00),(14,3,'Pendente',0.00),-- Evento 4 (Simpósio – Gratuito) – 5 inscrições
(15,4,'Pago',0.00),(16,4,'Pago',0.00),(17,4,'Pago',0.00),
(18,4,'Pago',0.00),(19,4,'Pago',0.00),-- Evento 5 (Conferência SGBD) – 3 inscrições
(1,5,'Pendente',8000.00),(20,5,'Pago',8000.00),(3,5,'Pendente',0.00);
GO