/* Exercicio 1*/

/* Atividade a  dbo.student_grade_points @student_grade varchar(2)*/

create procedure dbo.student_grade_points @student_grade varchar(2) 

as 
Begin
	set NOCOUNT on; 
/* Atividade b  o select retorna o  valor das tuplas*/
	select student.name as "Nome do Estudante", student.dept_name as "Departamento do estudante", course.title as "Título do curso", course.dept_name as "Departamento do curso", section.semester as "Semestre do curso", section.year as "Ano do curso", takes.grade as "Pontuação alfanumérica",
IIF(takes.grade = 'A+', 4.0,
IIF(takes.grade = 'A ', 3.7,
IIF(takes.grade = 'A-', 3.3,
IIF(takes.grade = 'B+', 3.0,
IIF(takes.grade = 'B ', 2.7,
IIF(takes.grade = 'B-', 2.3,
IIF(takes.grade = 'C+', 2.0,
IIF(takes.grade = 'C ', 1.7,
IIF(takes.grade = 'C-', 1.3, 0))))))))) as "Pontuação numérica"

	from  

	student

	inner join department on student.dept_name = department.dept_name 

	inner join course on department.dept_name = course.dept_name 

	inner JOIN section on course.course_id = section.course_id 

	inner join takes on student.ID = takes.ID 
/* Atividade c  o where filtra as tuplas atraves da comparação da variavel*/
	WHERE takes.grade = @student_grade
	GROUP BY student.name, student.dept_name, course.title, course.dept_name, section.semester, section.year, takes.grade;


	END; 

/*Teste */
/*EXEC dbo.student_grade_points 'C+';*/

/* Exercicio 2*/

	
create function dbo.return_instructor_location (@Istructor_name VARCHAR(20))
returns table
as
return(
 select instructor.name as "Nome do instrutor", course.title as "Curso ministrado", section.semester as "Semestre do curso", section.year as "Ano do curso", 
 section.building as "Prédio", section.room_number as "Número da sala"
 from 
 instructor
 inner join department on instructor.dept_name = department.dept_name 
 inner join course on department.dept_name = course.dept_name 
 inner JOIN section on course.course_id = section.course_id 
 where instructor.name = @Istructor_name

)
