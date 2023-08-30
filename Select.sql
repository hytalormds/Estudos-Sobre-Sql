create database Bd_Pessoas;
use Bd_Pessoas;

create table TbPessoa(
	cd_pessoa integer primary key,
    nm_pessoa varchar(50) not null,
    sexo char,
    dt_nasc date not null,
    nivel_parentesco varchar(20)
);

create table TbTipoDespesa(
	cd_tipo_despesa integer primary key,
    nm_tipo_despesa varchar(50) not null 
);


create table TbTipoReceita(
	cd_tipo_receita integer primary key,
    nm_tipo_receita varchar(20) not null 
);

create table TbDespesa(
	cd_despesa integer primary key,
    dt_despesa date not null,
    valor numeric(10, 2),
    cd_pessoa integer, /*Chave Estrangeira */
    cd_tipo_despesa integer, /*Chave Estrangeira */
    constraint Fk_CdPessoa foreign key(cd_pessoa) references TbPessoa(cd_pessoa),
    constraint Fk_CdTipoDespesa foreign key(cd_tipo_despesa) references TbTipoDespesa(cd_tipo_despesa)
);

create table TbReceita(
	cd_receita integer primary key,
    dt_receita date not null,
    valor numeric(10, 2),
    cd_pessoa integer, /*Chave Estrangeira */
    cd_tipo_receita integer, /*Chave Estrangeira */
    constraint Fk_CdPessoa2 foreign key(cd_pessoa) references TbPessoa(cd_pessoa),
    constraint Fk_CdTipoReceita2 foreign key(cd_tipo_receita) references TbTipoReceita(cd_tipo_receita)
);

insert into TbTipoDespesa (cd_tipo_despesa, nm_tipo_despesa)
	values(1, 'Aluguel'),(2, 'Compra de Computador'),(3, 'Telefone');
    

insert into TbPessoa (cd_pessoa, nm_pessoa, dt_nasc, nivel_parentesco)
	values(1, 'José', '1980/10/23', 'Pai'), (2, 'Maria', '1983/03/10', 'Mãe'), (3, 'Carlos', '2010/10/10', 'Filho');

insert into TbDespesa (cd_despesa, dt_despesa, valor, cd_pessoa, cd_tipo_despesa) 
	values (1, '2017/06/10', 100, 1, 3);
    
insert into TbTipoReceita (cd_tipo_receita, nm_tipo_receita)
	values (1, 'Salário'), (2, 'Venda de Bens');

insert into TbReceita (cd_receita, dt_receita, valor, cd_pessoa, cd_tipo_receita)
	values (1, '2017/06/01', 2000, 1, 1), (2, '2017/06/15', 12000, 1, 2), (3, '2017/07/01', 2000, 1, 1);
    
update TbReceita set valor = 2200 
	where cd_receita = 3;
    
select valor from TbReceita where cd_receita = 3;

insert into TbDespesa (cd_despesa, dt_despesa, valor, cd_pessoa, cd_tipo_despesa) 
	values (2, '2017/06/15', 900, 2, 1);
    
select dt_despesa, valor from TbDespesa where cd_pessoa = 1;

delete from TbDespesa where cd_despesa = 1;

select cd_despesa, dt_despesa, valor, cd_pessoa, cd_tipo_despesa from TbDespesa where cd_despesa = 1;

alter table TbPessoa
	add cpf char (11);
    




    