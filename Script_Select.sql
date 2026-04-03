--Consultas e Relatórios
--1. Listar todos os eventos com os seus oradores e o número total de participantes inscritos.
SELECT
    e.EventoID,
    e.Nome AS NomeEvento,
    e.Cidade,
    CONVERT(VARCHAR(10), e.DataInicio, 103) AS DataInicio,

    (
        SELECT STRING_AGG(Nome, ' | ')
        FROM (
            SELECT DISTINCT o.Nome
            FROM Sessoes s
            JOIN Oradores o ON s.OradorID = o.OradorID
            WHERE s.EventoID = e.EventoID
        ) AS OradoresDistintos
    ) AS Oradores,

    (
        SELECT COUNT(DISTINCT i.ParticipanteID)
        FROM Inscricoes i
        WHERE i.EventoID = e.EventoID
        AND i.StatusPagamento = 'Pago'
    ) AS TotalParticipantes

FROM Eventos e

ORDER BY TotalParticipantes DESC;

--2. Encontrar os participantes que se inscreveram em mais de um evento.
SELECT
p.ParticipanteID,
p.Nome AS NomeParticipante,
p.Email,
p.Instituicao,
COUNT(i.EventoID) AS TotalEventos,
STRING_AGG(e.Nome, ' | ')
WITHIN GROUP (ORDER BY e.DataInicio) AS EventosInscritos
FROM Participantes p
INNER JOIN Inscricoes i ON p.ParticipanteID = i.ParticipanteID
AND i.StatusPagamento <> 'Cancelad0'
INNER JOIN Eventos e ON i.EventoID = e.EventoID
GROUP BY p.ParticipanteID, p.Nome, p.Email, p.Instituicao
HAVING COUNT(i.EventoID) > 1
ORDER BY TotalEventos DESC;

-- 3. Obter a lista de sessões de um evento específico, ordenadas por data e hora.
SELECT
s.SessaoID,
s.Titulo AS TituloSessao,
s.TipoSessao,
CONVERT(VARCHAR(16), s.DataHoraInicio, 120) AS Inicio,
CONVERT(VARCHAR(16), s.DataHoraFim, 120) AS Fim,
s.Sala,
o.Nome AS NomeOrador,
o.Especialidade,
DATEDIFF(MINUTE, s.DataHoraInicio, s.DataHoraFim)
AS DuracaoMinutos
FROM Sessoes s
INNER JOIN Oradores o ON s.OradorID = o.OradorID
INNER JOIN Eventos e ON s.EventoID = e.EventoID
WHERE e.EventoID = 1-- Alternativa: WHERE e.Nome LIKE N'%Congresso%'
ORDER BY s.DataHoraInicio ASC;

--4. Calcular a receita total gerada por cada evento.
SELECT
e.EventoID,
e.Nome AS NomeEvento,
e.Cidade,
e.Capacidade,
e.PrecoInscricao,
COUNT(CASE WHEN i.StatusPagamento = 'Pago' THEN 1 END) AS InscricoesConfirmadas,
ISNULL(SUM(CASE WHEN i.StatusPagamento = 'Pago'
THEN i.ValorPago END), 0) AS ReceitaTotal,
ROUND(
COUNT(CASE WHEN i.StatusPagamento = 'Pago' THEN 1 END)
* 100.0 / e.Capacidade
, 1) AS TaxaOcupacaoPercent
FROM Eventos e
LEFT JOIN Inscricoes i ON e.EventoID = i.EventoID
GROUP BY e.EventoID, e.Nome, e.Cidade, e.Capacidade, e.PrecoInscricao
ORDER BY ReceitaTotal DESC;

--5. Identificar oradores que participam em eventos em mais de uma cidade.  
SELECT
    o.OradorID,
    o.Nome AS NomeOrador,
    o.Especialidade,
    o.Instituicao,
    o.Cidade AS CidadeBase,

    COUNT(DISTINCT e.Cidade) AS NumeroCidades,

    (
        SELECT STRING_AGG(Cidade, ', ')
        FROM (
            SELECT DISTINCT e2.Cidade
            FROM Sessoes s2
            INNER JOIN Eventos e2 
                ON s2.EventoID = e2.EventoID
            WHERE s2.OradorID = o.OradorID
        ) AS CidadesDistintas
    ) AS CidadesEventos

FROM Oradores o

INNER JOIN Sessoes s 
    ON o.OradorID = s.OradorID

INNER JOIN Eventos e 
    ON s.EventoID = e.EventoID

GROUP BY 
    o.OradorID, 
    o.Nome, 
    o.Especialidade, 
    o.Instituicao, 
    o.Cidade

HAVING 
    COUNT(DISTINCT e.Cidade) > 1

ORDER BY 
    NumeroCidades DESC, 
    o.Nome ASC;
