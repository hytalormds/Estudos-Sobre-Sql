create database Bd_Aula_11;
use Bd_Aula_11;

create table TbVendedor (
	Cd_Vendedor smallint primary key,
    Nm_Vendedor Varchar(20)
);


create table TbProduto (
	Cd_Produto smallint primary key,
    Nm_Produto varchar(20)
);


create table TbCidade (
	Cd_Cidade smallint primary key,
    Nm_Cidade varchar(20)
);


CREATE TABLE TbVendas ( 
      Cd_Vendas Smallint Primary Key, 
      Cd_Vendedor smallint, 
      Qt_Produto Int, 
      Cd_Produto Smallint,  
      Cd_Cidade smallint,
      constraint FK_CdCidade FOREIGN KEY (Cd_Cidade) REFERENCES TbCidade(Cd_Cidade),
      constraint FK_CdVendedor FOREIGN KEY (Cd_Vendedor) REFERENCES TbVendedor(Cd_Vendedor),
      constraint FK_CdProduto FOREIGN KEY (Cd_Produto) REFERENCES TbProduto(Cd_Produto)
); 

INSERT INTO TbVendedor VALUES (1,'Jorge'), (2, 'Tatiana'), (3, 'Ana'), (4, 'Rita'), (5, 'Marcos'), (6, 'Carla'), (7, 'Roberto');

Insert into TbCidade values (1, 'São Paulo'), (2, 'Rio de Janeiro'), (3, 'Recife');

Insert Into TbProduto values (1, 'Mouse'), (2, 'Teclado'), (3, 'Webcam');

INSERT INTO TbVendas (Cd_Vendas, Cd_Vendedor, Qt_Produto, Cd_Produto, Cd_Cidade) 
VALUES (1, 1, 1400, 1, 1), (2,2 , 1220, 2, 1), (3, 3, 1700, 2, 2), (4, 4, 2120, 3, 3),
        (5, 5, 980, 1, 1),	(6,6, 1120, 3, 3), (7,7, 3145, 1, 1); 

/* A */        
insert into TbVendas (Cd_Vendas, Cd_Vendedor, Qt_Produto, Cd_Produto, Cd_Cidade)
values  (10, 1, 2000, 1, 2), (11, 1, 500, 2, 3), (12, 2, 1500, 3, 2),
(13, 2, 500, 3, 1), (14, 5, 1000, 2, 1), (15, 5, 500, 1, 2), (16, 5, 600, 1, 1);

/* B */
select tbvendedor.Nm_Vendedor, tbcidade.Nm_Cidade, tbvendas.Qt_Produto
from tbvendas
inner join tbvendedor on tbvendedor.Cd_Vendedor = tbvendas.Cd_Vendedor
inner join tbcidade on tbcidade.Cd_Cidade = tbvendas.Cd_Cidade
order by Nm_Vendedor, Nm_Cidade;

/* C */
select tbvendedor.Nm_Vendedor, tbcidade.Nm_Cidade, tbvendas.Qt_Produto
from tbvendas
inner join tbvendedor on tbvendedor.Cd_Vendedor = tbvendas.Cd_Vendedor
inner join tbcidade on tbcidade.Cd_Cidade = tbvendas.Cd_Cidade
where Qt_Produto > 1500
order by Nm_Vendedor, Nm_Cidade;

/* D */
select tbvendedor.Nm_Vendedor, avg(Qt_Produto) as 'Total'
from tbvendas, tbvendedor
where tbvendas.Cd_Vendedor = tbvendedor.Cd_Vendedor
group by Nm_Vendedor;

/* E */
select tbvendedor.Nm_Vendedor, sum(Qt_Produto) as 'Total'
from tbvendas, tbvendedor
where tbvendas.Cd_Vendedor = tbvendedor.Cd_Vendedor
group by Nm_Vendedor;

/* 3 */
/* A - Consulta retornando total de vendas das cidades: */
select tbcidade.Nm_Cidade, sum(Qt_Produto) as 'Qtd. Por Cidade'
from tbvendas, tbcidade
where tbvendas.Cd_Cidade = tbcidade.Cd_Cidade
group by  Nm_Cidade;

/* B - Consulta retornando a média de vendas das cidades com menos de 1500 produtos vendidos: */
select tbcidade.Nm_Cidade, avg(Qt_Produto) as 'Cidades com média menor que 1500'
from tbvendas, tbcidade
where tbvendas.Cd_Cidade = tbcidade.Cd_Cidade
group by Nm_Cidade
having avg(Qt_Produto) < 1500;
