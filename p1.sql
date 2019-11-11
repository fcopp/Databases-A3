CREATE OR REPLACE FUNCTION P1(uname CHAR)
	RETURNS TABLE(vname CHAR(10), t_date DATE, Amount NUMERIC(10,2)) AS $$
BEGIN
	RETURN QUERY
	SELECT v.Vname, t.T_Date, t.Amount
	FROM vendor as v, customer as c, transaction as t
	WHERE c.Cname = uname AND
		c.Account = t.Account AND
		t.Vno = v.Vno;
END;
$$ language plpgsql;
