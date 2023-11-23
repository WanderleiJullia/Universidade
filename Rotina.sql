DELIMITER $ 

create procedure Inserir_Disciplina(
 in p_Disciplina varchar(200)
 )
 begin 
 insert into Cursos (Disciplina) values (p_Disciplina);
 
 END$
 
 DELIMITER ; 
