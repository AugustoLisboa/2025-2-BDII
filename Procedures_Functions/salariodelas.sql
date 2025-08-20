CREATE or REPLACE calculaSAL ()
RETURNS void as $$
DECLARE 
    reg record;

BEGIN
    FOR reg in SELECT c.valor_minimo, pr.matricula, c.aliquota_fixa, pe.preco_venda, COUNT (*) as qtd_pecas
    FROM producao as pr JOIN peca as pe ON pr.id_peca = pe.id_peca
    JOIN costureira as c ON c.matricula = pr.matricula
    WHERE extract(MONTH from pr.dt_fim) = 8
    GROUP BY c.valor_minimo, pr.matricula, c.aliquota_fixa, pe.preco_venda

    LOOP
        UPDATE costureira
        SET salario = reg.valor_minimo + (reg.aliquota_fixa * reg.preco_venda * reg.qtd_pecas)
        WHERE matricula = reg.matricula;
    
        RAISE 'Salario Costureira % calulado', %reg.matricula
    END LOOP;
    RETURN;
END;
$$ LANGUAGE 'plpgsql';