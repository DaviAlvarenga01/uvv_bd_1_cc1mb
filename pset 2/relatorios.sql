USE UVV


	 	QUESTÃO 1: 

SELECT 
 	 AVG(f.salario) AS mediaSalario, d.nome_departamento  
FROM  
	funcionarios f 
INNER JOIN 
 	departamento d 
ON
 	(d.numero_departamento=f.numero_departamento)
GROUP BY 
 	d.nome_departamento   


 		QUESTÃO 2:


SELECT
	 AVG(f.salario) AS mediaSalario, f.sexo 
FROM 
	funcionarios f 
GROUP BY
	 f.sexo 
  

		QUESTÃO 3:

SELECT 
	d.nome_departamento, CONCAT (primeiro_nome,' ', nome_meio, ' ', ultimo_nome) AS nome, FLOOR(DATEDIFF(NOW(), f.data_nascimento) / 365.25) AS idade,
	f.data_nascimento, f.salario 

FROM 
	 departamento d 

INNER JOIN 
 	funcionarios f 

ON 
 	f.numero_departamento = d.numero_departamento 




		QUESTÃO 4: ALTERAR 
SELECT 
	 CONCAT (primeiro_nome ,' ', nome_meio, ' ', ultimo_nome) AS nome, FLOOR(DATEDIFF(NOW(), data_nascimento) / 365.25) AS idade, f.data_nascimento, f.salario AS salarioAtual,
CASE WHEN (f.salario < 35) then 20
ELSE 15
END AS taxaReajuste,
case WHEN (f.salario  < 35) then f.salario  + (f.salario  * 0.2)
ELSE f.salario  + (f.salario  * 0.15)
END AS salarioReajustado
FROM funcionarios f 
