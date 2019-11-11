CREATE OR REPLACE FUNCTION p3(arg_anum CHAR, arg_name CHAR, arg_province CHAR, arg_lim INTEGER) RETURNS VOID as $$
BEGIN
	INSERT INTO customer(Account, Cname, Province, Cbalance, Crlimit) VALUES
		(arg_anum, arg_name, arg_province, 0.00, arg_lim);
END;
$$ language plpgsql;
