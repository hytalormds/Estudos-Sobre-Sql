create database BDEscola_View;
use BDEscola_View;

CREATE TABLE TbCidade (
	CdCidade INTEGER NOT NULL AUTO_INCREMENT,
	NmCidade VARCHAR (50) NOT NULL,
	PRIMARY KEY (CdCidade)
);

CREATE TABLE TbProfessor(
	CdProfessor INTEGER NOT NULL AUTO_INCREMENT,
	NmProfessor VARCHAR (100) NOT NULL,
	DsSexo CHAR,
	CdCidade INTEGER NOT NULL,
	PRIMARY KEY (CdProfessor),
	FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade)
);

CREATE TABLE TbDisciplina (
	CdDisciplina INTEGER NOT NULL AUTO_INCREMENT,
	NmDisciplina VARCHAR (100) NOT NULL,
	vlCargaHoraria INTEGER,
	CdProfessor INTEGER NOT NULL,
	PRIMARY KEY (CdDisciplina),
	FOREIGN KEY (CdProfessor) REFERENCES TbProfessor(CdProfessor)
);

CREATE TABLE TbAluno(
	CdAluno INTEGER NOT NULL AUTO_INCREMENT,
	NmAluno VARCHAR (100) NOT NULL,
	DsSexo CHAR,
	CdCidade INTEGER NOT NULL,
	PRIMARY KEY (CdAluno),
	FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade)
);

CREATE TABLE TbNota (
	CdAluno INTEGER NOT NULL,
	CdDisciplina INTEGER NOT NULL,
	Nota NUMERIC (10,2),
	PRIMARY KEY (CdAluno, CdDisciplina),
	FOREIGN KEY (CdAluno) REFERENCES TbAluno(CdAluno),
	FOREIGN KEY (CdDisciplina) REFERENCES TbDisciplina(CdDisciplina)
);

INSERT INTO TbCidade (NmCidade) VALUES ('Ipatinga'), ('Cel. Fabriciano'), ('Timóteo'), ( 'Santana do Paraíso');

INSERT INTO TbProfessor (NmProfessor, DsSexo, CdCidade) VALUES ('Marlene', 'F', 3), ('Marcelo Balbino', 'M', 3), 
					('Rodrigo', 'M', 1), ('Maurílio', 'M', 3), ('Douglas', 'M', 1),( 'José', 'M', 2), ('Maria', 'F', 1),
					 ( 'Ricardo', 'M', 1), ('Vera', 'F', 1);

INSERT INTO TbDisciplina (NmDisciplina, VlCargaHoraria, CdProfessor) VALUES ('Projeto de Software', 80, 2), 
						('Empreendedorismo', 80, 1), ('Linguagem de Programação', 200, 4),
						('Banco de Dados', 120, 2), ('Eletricidade e Eletrônica', 120, 3);

INSERT INTO TbAluno (NmAluno, DsSexo, CdCidade) VALUES ('João', 'M', 2), ('Ana Maria', 'F', 1), ('Rogério', 'M', 1),
				('Dalila', 'F', 1), ('Rachel', 'F', 2), ('Elza', 'F', 3), ('Bernardo', 'M', 3);

INSERT INTO TbNota (CdAluno, CdDisciplina, Nota) VALUES (1, 1, 50), (1, 2, 75), (1, 3, 80), (1, 4, 55), (2, 1, 90), 
				(2, 2, 95), (2, 3, 82), (2, 4, 88),	(3, 1, 40), (3, 2, 35), (3, 3, 70), (3, 4, 70);
                
/* 1 */
SELECT NmAluno, NmCidade
FROM TbCidade
INNER JOIN TbAluno ON TbAluno.CdCidade = TbCidade.CdCidade
UNION
SELECT NmProfessor, NmCidade
FROM TbCidade
INNER JOIN TbProfessor ON TbProfessor.CdCidade= TbCidade.CdCidade;

/* 2 */
CREATE VIEW GrAluno
AS SELECT TbAluno.NmAluno, TbDisciplina.NmDisciplina, TbNota.Nota
FROM TbNota
INNER JOIN TbAluno ON TbAluno.CdAluno = TbNota.CdAluno
INNER JOIN TbDisciplina ON TbDisciplina.CdDisciplina = TbNota.CdDisciplina;

/* 3 */
SELECT NmAluno, NmDisciplina, Nota
FROM GrAluno
ORDER BY NmAluno;

/* 4 */
SELECT NmAluno, avg(Nota), NmDisciplina
FROM GrAluno
GROUP BY NmAluno;

/* 5 */
SELECT NmDisciplina, Nota
FROM GrAluno
WHERE NmAluno = 'Ana Maria';

/* 6 */
SELECT NmAluno, max(Nota)
FROM GrAluno
GROUP BY NmAluno;

/* 7 */
CREATE VIEW GrProfessor
AS SELECT TbProfessor.NmProfessor, TbDisciplina.NmDisciplina, max(TbNota.Nota)
FROM TbDisciplina
LEFT JOIN TbProfessor ON TbProfessor.CdProfessor = TbProfessor.CdProfessor
LEFT JOIN TbNota ON TbNota.CdDisciplina = TbNota.CdDisciplina;

ALTER VIEW GrProfessor
AS SELECT DISTINCT NmProfessor, NmDisciplina, max(Nota)
FROM TbDisciplina
RIGHT JOIN TbProfessor ON TbProfessor.CdProfessor = TbDisciplina.CdProfessor
LEFT JOIN TbNota ON TbNota.CdDisciplina = TbNota.CdDisciplina
GROUP BY NmProfessor, NmDisciplina
ORDER BY NmProfessor;

/* 8 */
SELECT * FROM GrProfessor;

/* 9 */
SELECT NmProfessor, NmDisciplina, max(Nota)
FROM GrProfessor
WHERE Nota IN (SELECT MAX(Nota) FROM GrProfessor);


