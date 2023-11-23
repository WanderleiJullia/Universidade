create table Cursos(
DisciplinaID int auto_increment primary key,
Disciplina_Curso varchar(250)
);

create table Alunos(
AlunoID int auto_increment primary key,
DisciplinaID int,
Nome varchar(100),
Sobrenome varchar(100),
RA varchar(50),
Email varchar(200),

foreign key (DisciplinaID) references Cursos(DisciplinaID)
);

insert into Cursos (Disciplina_Curso) values ('ADS');
insert into Cursos (Disciplina_Curso) values ('Arquitetura');
insert into Cursos (Disciplina_Curso) values ('Biomedicina');
insert into Cursos (Disciplina_Curso) values ('Engenharia');

select * from Cursos;

insert into Alunos (DisciplinaID, Nome, Sobrenome, RA, Email) values (1, 'Pablo', 'Ferreira', '123456', 'Pablo.Ferreira@dominio.com');
insert into Alunos (DisciplinaID, Nome, Sobrenome, RA, Email) values (2, 'Jullia', 'Silva', '896523', 'Jullia.Silva@dominio.com');
insert into Alunos (DisciplinaID, Nome, Sobrenome, RA, Email) values (3, 'Maria', 'Pereira', '741258', 'Maria.Pereira@dominio.com');
insert into Alunos (DisciplinaID, Nome, Sobrenome, RA, Email) values (4, 'Andre', 'Santos', '456321', 'Andre.Santos@dominio.com');
insert into Alunos (DisciplinaID, Nome, Sobrenome, RA, Email) values (5, 'Guilherme', 'Pinho', '789654' , 'Guilherme.Pinho@dominio.com');

select * from Alunos;


