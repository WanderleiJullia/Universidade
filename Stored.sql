DELIMITER $ 

create procedure insert_Cursos(
Disciplina_Curso varchar(250)
)
begin

insert into Cursos (Disciplina_Curso) values (Disciplina);
end$ 

DELIMITER ; 

2º (PARA SELECIONAR O CURSO)

 DELIMITER $ 

create procedure consulta_Cursos()
begin 
select * 
from Cursos;
end$

DELIMITER ; 
