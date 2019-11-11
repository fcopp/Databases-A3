CREATE OR REPLACE FUNCTION a3data() RETURNS void as $$
BEGIN
	CREATE TABLE IF NOT EXISTS vendor(

		Vno CHAR(10) PRIMARY KEY,
		Vname CHAR(30),
		City CHAR(20),
		Vbalance NUMERIC(10,2)
	);
	CREATE TABLE IF NOT EXISTS customer(
		Account CHAR(10) PRIMARY KEY,
		Cname CHAR(15),
		Province CHAR(4),
		Cbalance NUMERIC(10,2),
		Crlimit INTEGER
	);
	CREATE TABLE IF NOT EXISTS transaction(
		Tno CHAR(10) PRIMARY KEY,
		Vno CHAR(10) REFERENCES vendor(Vno),
		Account CHAR(10) REFERENCES customer(Account),
		T_Date DATE,
		Amount NUMERIC(10,2)
	);
	PERFORM dataAdder();
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION dataAdder() RETURNS void as $$
BEGIN
	INSERT INTO vendor(Vno, Vname, City, Vbalance) VALUES
		('V1','Sears','Toronto',200.00),
		('V2','WalMart','Toronto',671.05),
		('V3','Esso','Windsor',0.00),
		('V4','Esso','Waterloo',225.00);

	INSERT INTO customer(Account, Cname, Province, Cbalance, Crlimit) VALUES
		('A1','Smith','ONT',2515.00,2000),
		('A2','Jones', 'BC', 2014.00, 2500),
		('A3','Doc','ONT',150.00, 1000);

	INSERT INTO transaction(Tno,Vno,Account,T_Date,Amount) VALUES
		('T1','V2','A1','2019-07-15',1325.00),
		('T2','V2','A3','2018-12-16',1900.00),
		('T3','V3','A1','2019-09-01',2500.00),
		('T4','V4','A2','2019-03-20',1613.00),
		('T5','V4','A3','2019-07-31',3312.00);
END;
$$ language plpgsql;
