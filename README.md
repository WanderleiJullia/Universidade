# Universidade
O objetivo da atividade a seguir é montar um bancos de dados de uma universidade, utilizando como principal base "FUNCTIONS". Abaixo estará toda a montagem de Alunos e disciplinas, para uma melhor organização. 
![image](https://github.com/WanderleiJullia/Universidade/assets/144744092/4f45f115-029d-46fb-b051-7cc1be83c7d0)

# 1º Crie um banco de dados para armazenar alunos e cursos de uma universidade; 
``` SQL
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
```
![image](https://github.com/WanderleiJullia/Universidade/assets/144744092/24ea81b6-03ca-4a36-b7c8-36f5774586ef)
![image](https://github.com/WanderleiJullia/Universidade/assets/144744092/2a21a266-3193-454a-baad-68eda74c61f2)

# 2º Utilize Stored Procedures para automatizar a inserção e seleção dos cursos;
``` SQL
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
```
# 3º O aluno possui um e-mail que deve ter seu endereço gerado automaticamente no seguinte formato: nome.sobrenome@dominio.com
``` SQL
DELIMITER $ 

create trigger Gerar_Email_Aluno 
before insert on Alunos 
for each row
begin
    
    set NEW.email = concat(NEW.Nome, '.', NEW.Sobrenome, '@dominio.com');
end$

DELIMITER ;
```
![image](https://github.com/WanderleiJullia/Universidade/assets/144744092/ddab0b65-dc17-429f-b596-ba237079fd3b)



# 4º Crie uma rotina que recebe os dados de um novo curso e o insere no banco de dados;
``` SQL
DELIMITER $ 

create procedure Inserir_Disciplina(
 in p_Disciplina varchar(200)
 )
 begin 
 insert into Cursos (Disciplina) values (p_Disciplina);
 
 END$
 
 DELIMITER ; 
```

# 5º Crie uma função que recebe o nome de um curso e sua área, em seguida retorna o id do curso;;
```SQL
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
```

# 6º Crie uma procedure que recebe os dados do aluno e de um curso e faz sua matrícula;
```SQL
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
```

# 7º Caso o aluno já esteja matriculado em um curso, essa matrícula não pode ser realizada;
``` SQL
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
```

# 8º Crie o modelo lógico do exercício.
``` SQL
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `DisciplinaID` INT NOT NULL AUTO_INCREMENT,
  `Disciplina_Curso` VARCHAR(250) NULL,
  PRIMARY KEY (`DisciplinaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alunos` (
  `AlunoID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Sobrenome` VARCHAR(100) NULL,
  `RA` VARCHAR(50) NULL,
  `Email` VARCHAR(200) NULL,
  `Cursos_DisciplinaID` INT NOT NULL,
  PRIMARY KEY (`AlunoID`, `Cursos_DisciplinaID`),
  INDEX `fk_Alunos_Cursos_idx` (`Cursos_DisciplinaID` ASC),
  CONSTRAINT `fk_Alunos_Cursos`
    FOREIGN KEY (`Cursos_DisciplinaID`)
    REFERENCES `mydb`.`Cursos` (`DisciplinaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
``` 
![image](https://github.com/WanderleiJullia/Universidade/assets/144744092/af37c4b5-1c8c-4f75-8782-0d1e4be05d85)


