DELIMITER $ 

create function Obter_ID_Curso(
p_Nome_Curso varchar(200),
p_Area_Curso   varchar (200)
)
returns int 
deterministic
begin
   
   declare Curso_ID int;
   
select IDCursos into Curso_ID 
from cursos
where Disciplina = p_Nome_Curso and = p_Area_Curso;

return Curso_ID;
END; 

$ 

DELIMITER ; 