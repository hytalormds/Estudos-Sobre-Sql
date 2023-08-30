create database Tb_Index;
use Tb_Index;

CREATE TABLE tbl_Editoras (
CdEditora SMALLINT PRIMARY KEY AUTO_INCREMENT,
NmEditora VARCHAR(40) NOT NULL
); 

INSERT INTO tbl_Editoras (NmEditora)
VALUES ('Mc Graw-Hill'), ('Apress'), ('Bookman'), ('Bookboon'), ('Packtpub'),
('O´Reilly'), ('Springer'), ('Érica'), ('For Dummies'), ('Novatec'), ('Microsoft Press'),
('Cisco Press'), ('Addison-Wesley'), ('Companhia das Letras'), ('Artech House'), ('Wiley'), ('CRC Press'), ('Manning'), ('Penguin Books'), ('Sage Publishing'); 

SELECT * FROM tbl_Editoras;

SELECT * FROM tbl_Editoras WHERE NmEditora = 'Springer';

EXPLAIN SELECT * FROM tbl_Editoras WHERE NmEditora = 'Springer';

CREATE INDEX idx_editora ON tbl_Editoras(NmEditora); 

EXPLAIN SELECT * FROM tbl_Editoras WHERE NmEditora = 'Springer';







