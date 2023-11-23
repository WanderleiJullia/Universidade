DELIMITER $ 

create trigger Gerar_Email_Aluno 
before insert on Alunos 
for each row
begin
    
    set NEW.email = concat(NEW.Nome, '.', NEW.Sobrenome, '@dominio.com');
end$

DELIMITER ; 
