create procedure dbo.student_grade_points @student_grade varchar(2)
as
	set NOCOUNT on;
	declare @aluno_nome as varchar(50)
	declare @aluno_departamento as varchar(50)
	declare @titulo_curso as varchar(50)
	declare @Departamento_curso as varchar(50)
	declare @Semestre_curso as varchar(50)
	declare @Ano_curso as numeric(5)
	declare @pont_num as int 
	declare @Tabela_aluno as table ( aluno_nome varchar(50), aluno_departamento varchar(50), 
									 titulo_curso varchar(50), Departamento_curso varchar(50)
									 Semestre_curso varchar(50), Ano_curso numeric(5)
									 	pont_num int)
	declare Student_cursor
	for 
	select student.name, student.dept_name, course.title, course.dept_name, section.semester, section.year
	from 
	student 
	inner join department on student.dept_name = department.dept_name
	inner join course on department.dept_name = course.dept_name
	inner join
	
declare @d_coun int
exec dbo.dept_count_proc 'Accounting', @d_coun out;
select @d_coun;

select * from takes; 
