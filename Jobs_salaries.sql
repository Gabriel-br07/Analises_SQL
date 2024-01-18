	CREATE TABLE Jobs_and_Salaries(
		work_year int,
		job_title varchar(255),
		job_category varchar(255),
		salary_currency varchar(255),
		salary numeric(10,2),
		salary_in_usd numeric(10,2),
		employee_residence varchar(255),
		experience_level varchar(255),
		employment_type varchar(255),
		work_setting varchar(255),
		company_location varchar(255),
		company_size varchar(255)

	);


	Select * from jobs_and_salaries

	--media salarial por mês
	SELECT avg(salary_in_usd)/12 as media_salarial_mensal
	from jobs_and_salaries;

	--Lista dos cargos e sua media salarial por mês e o total de funcionarios
	select job_category , avg(salary_in_usd)/12 as media_salarial,
						COUNT(*) as total_funcionarios
	from jobs_and_salaries
	group by job_category 
	order by job_category DESC

	--Lista da média salarial por mês e por nivel de experiência
	select experience_level, avg(salary_in_usd)/12 as media_salarial, count(*)
	from jobs_and_salaries
	group by experience_level
	order by media_salarial desc


	--Lista da categoria do trabalho o salário por ano e se está acima ou abaixo da média
	select job_category ,salary_in_usd,
		case
			when salary_in_usd < avg(salary_in_usd) over(partition by job_category ) then 'abaixo_média'
			when salary_in_usd > avg(salary_in_usd) over(partition by job_category ) then 'acima_média'
			when salary_in_usd = avg(salary_in_usd) over(partition by job_category ) then 'média'
		end as media_salarial
	from jobs_and_salaries
	order by job_category asc






