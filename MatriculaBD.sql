
DELIMITER $

create procedure Matriculas_Alunos(
in p_Nome_Aluno varchar(150),
in p_RA_Aluno varchar(150),
in p_Email_Aluno varchar(150),
in p_Nome_Curso varchar(150)
)
begin 
  declare CursoID int;
  
select IDCurso into CursoID
from Cursos
where Disciplina = p_Nome_Curso;

insert into Alunos (Nome, RA, Email, Nome_Curso) values (p_Nome_Aluno, p_RA_Aluno, p_Email_Aluno, CursoID);
END$ 

DELIMITER ; 
