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

IF exists ( select  from Alunos where RA  = p_RA_Aluno and Cursos_CursosID = CursoID) then
signal SQLSTATE '34000'
set message_text = 'Aluno já possui matricula na disciplina.';
else 

insert into Alunos (Nome, RA, Email, Nome_Curso);
end if;
end$ 

DELIMITER ; 