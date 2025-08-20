/*Faça um função para calcular a quantidade de funcionários em um departamento. O número do
departamento é passado por parâmetro.*/
CREATE OR REPLACE FUNCTION fnc_depto (numdepto integer)
RETURNS integer as $$
DECLARE 
    qtd integer;
BEGIN
    SELECT COUNT(*) INTO qtd 
    FROM funcionario 
    WHERE depto = numdepto;
	RETURN qtd;
END;
$$ LANGUAGE "plpgsql";