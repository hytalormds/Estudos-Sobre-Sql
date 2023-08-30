CREATE DATABASE Bd_Multa;
USE Bd_Multa;

CREATE TABLE TbCidade 
(CdCidade INTEGER NOT NULL,
NmCidade VARCHAR (50) NOT NULL,
PRIMARY KEY (CdCidade)
);

CREATE TABLE TbProprietario (
CdProp INTEGER NOT NULL,
NmProp VARCHAR (100) NOT NULL,
CdCidade INTEGER NOT NULL,
PRIMARY KEY (CdProp),
FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade)
);

CREATE TABLE TbModelo (
CdModelo INTEGER NOT NULL,
NmModelo VARCHAR (50),
VLIPVA DOUBLE,
PRIMARY KEY (CdModelo)
);

CREATE TABLE TbVeiculo (
CdVeiculo INTEGER NOT NULL,
Placa VARCHAR (50) NOT NULL,
CdModelo INTEGER NOT NULL,
CdProp INTEGER NOT NULL,
PRIMARY KEY (CdVeiculo),
FOREIGN KEY (CdModelo) REFERENCES TbModelo(CdModelo),
FOREIGN KEY (CdProp) REFERENCES TbProprietario(CdProp)
);

CREATE TABLE TbTipoInfracao (
CdTipo INTEGER NOT NULL,
Descricao VARCHAR (100) NOT NULL,
VlAtual DOUBLE,
Gravidade Char(1),
PRIMARY KEY (CdTipo)
);

CREATE TABLE TbMulta (
CdMulta INTEGER NOT NULL,
CdVeiculo INTEGER NOT NULL,
CdTipo INTEGER NOT NULL,
CdCidadeMulta INTEGER NOT NULL,
VlMulta DOUBLE,
DtMulta DATE,
PRIMARY KEY (CdMulta),
FOREIGN KEY (CdVeiculo) REFERENCES TbVeiculo(CdVeiculo),
FOREIGN KEY (CdTipo) REFERENCES TbTipoInfracao(CdTipo),
FOREIGN KEY (CdCidadeMulta) REFERENCES TbCidade(CdCidade)
);

INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (1, 'Ipatinga');
INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (2, 'Cel. Fabriciano'), (3, 'Tim�teo');
insert into TbCidade VALUES (4, 'S�o Jos� do Goiabal');
insert into TbCidade VALUES (5, 'Dion�sio');

INSERT INTO TbProprietario (CdProp, NmProp, CdCidade) VALUES (1, 'Edvan', 2);
INSERT INTO TbProprietario (CdProp, NmProp, CdCidade) VALUES (2, 'Bernardo', 3);
INSERT INTO TbProprietario (CdProp, NmProp, CdCidade) VALUES (3, 'M�rio',2),(4, 'S�vio',4),(5, 'Vera', 3);

INSERT INTO TbModelo (CdModelo, NmModelo, VLIPVA) VALUES (1, 'GOL', 650), (2, 'Fusca', 120), (3, 'Renault', 550), (4, 'Corolla', 1100), (5, 'Uno Mille', 470);

INSERT INTO TbVeiculo VALUES 
(1, 'GSA1020', 1, 1),
(2, 'DFR5409', 2, 2),
(3, 'PER9843', 1, 4),
(4, 'TRE6723', 3, 3),
(5, 'PJH0921', 4, 2),
(6, 'BNG8764', 5, 1);

INSERT into TbTipoInfracao VALUES
(1, 'Estacionamento em local proibido', 100, 'L'),
(2, 'Excesso de velocidade', 500, 'G'),
(3, 'Avan�o de sinal vermelho', 800, 'G'),
(4, 'Dirigindo sem cinto de seguran�a', 120, 'M');

INSERT into TbMulta VALUES
(1, 1, 1, 1, 90, '2010/12/27'),
(2, 2, 2, 3, 400, '2014/12/28'),
(3, 2, 3, 3, 600, '2014/12/28'),
(4, 4, 4, 2, 110, '2015/01/01'),
(5, 4, 1, 1, 100, '2015/01/01');

/* Left Join */
select *
from tbcidade
left join tbproprietario on TbCidade.CdCidade=TbProprietario.CdCidade
order by NmCidade;

/* Inner Join */
select *
from tbcidade
inner join tbproprietario on TbCidade.CdCidade=TbProprietario.CdCidade
order by TbCidade.CdCidade;

/* Possibilidade de fazer Inner Join sem Inner Join */
select *
from tbcidade, tbproprietario
where TbCidade.CdCidade=TbProprietario.CdCidade
order by NmCidade;

/* Inner Join */
select CdProp, NmProp, NmCidade
from tbcidade
inner join tbproprietario on TbCidade.CdCidade=TbProprietario.CdCidade
order by CdProp;

/* 4 */
select CdMulta, NmModelo/*TbModelo*/, Descricao/*TbTipoInfracao*/, NmCidade/*TbCidade*/
from tbmulta
inner join tbveiculo on TbVeiculo.CdVeiculo = TbMulta.CdVeiculo
inner join tbmodelo on TbModelo.CdModelo = TbVeiculo.CdModelo
inner join tbtipoinfracao on TbTipoInfracao.CdTipo = Tbmulta.CdTipo
inner join tbcidade on TbCidade.CdCidade = TbMulta.CdCidadeMulta;

/* 5 */
select * from TbTipoInfracao
left join TbMulta on TbTipoInfracao.CdTipo = TbMulta.CdTipo;

/* 6 */
select TbProprietario.CdProp/*TbProprietario*/, NmProp/*TbProprietario*/, CdCidade/*TbCidade*/, 
CdMulta/*TbMulta*/, TbVeiculo.CdVeiculo/*TbVeiculo*/
from tbproprietario
inner join tbveiculo on TbVeiculo.CdProp = TbProprietario.CdProp
inner join tbmulta on TbMulta.CdVeiculo = TbVeiculo.CdVeiculo
inner join tbtipoinfracao on TbTipoInfracao.CdTipo = TbMulta.CdTipo
inner join tbmodelo on TbModelo.CdModelo = TbVeiculo.CdVeiculo;

/* 7 */
select TbMulta.CdMulta, TbVeiculo.CdVeiculo, Placa, TbVeiculo.CdModelo, TbVeiculo.CdProp
from tbmulta
left join tbveiculo on TbMulta.CdVeiculo = TbVeiculo.CdVeiculo;

/* 8 */
select * from TbProprietario 
right join tbveiculo on TbVeiculo.CdProp = TbProprietario.CdProp
where 
/* 9 */









