CREATE OR REPLACE FUNCTION P2(arg_name CHAR)
	RETURNS TABLE(cnum CHAR(5), cname CHAR(15), cprov CHAR(5)) as $$
BEGIN
	RETURN QUERY
	SELECT DISTINCT c.Account, c.Cname, c.Province
	FROM customer as c, transaction as t, vendor as v
	WHERE arg_name = v.Vname AND
		v.Vno = t.Vno AND
		t.Account = c.Account;
END;
$$ language plpgsql
