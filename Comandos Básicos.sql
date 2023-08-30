create database db_atividade;
use db_atividade;

create table tb_curso(
cd_curso smallint primary key auto_increment,
nm_curso varchar(100) not null
);

create table tb_disciplina(
cd_disciplina smallint primary key auto_increment,
nm_disciplina varchar(100) not null
);

create table tb_curso_extra(
cd_curso_extra smallint primary key auto_increment,
nm_curso_extra varchar(100) not null,
vl_carga_horaria smallint not null
);

create table tb_aluno(
cd_aluno smallint primary key auto_increment,
nm_aluno varchar(100) not null,
dt_nascimento date,
nu_fone smallint not null,
cd_curso smallint not null,
constraint fk_curso foreign key(cd_curso) references tb_curso(cd_curso)
);

create table tb_aluno_disciplina(
cd_aluno smallint,
cd_disciplina smallint,
vl_nota smallint,
nu_bimestre smallint not null,
vl_freq smallint,
constraint fk_cd_aluno foreign key(cd_aluno) references tb_aluno(cd_aluno),
constraint fk_cd_disciplina foreign key(cd_disciplina) references tb_disciplina(cd_disciplina),
primary key(cd_aluno, cd_disciplina)
);

create table tb_aluno_cursoextra(
cd_aluno smallint,
cd_curso_extra smallint,
vl_nota smallint,
dt_inicio date,
constraint fk_cd_aluno1 foreign key(cd_aluno) references tb_aluno(cd_aluno),
constraint fk_cd_curso2 foreign key(cd_curso_extra) references tb_curso_extra(cd_curso_extra),
primary key(cd_aluno, cd_curso_extra)
);
