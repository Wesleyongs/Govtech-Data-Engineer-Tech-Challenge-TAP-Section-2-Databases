-- Creation of car table
CREATE TABLE IF NOT EXISTS car (
  serial_number SERIAL NOT NULL,
  model_name varchar(250) NOT NULL,
  manafacturer varchar(250) NOT NULL,
  weight INT NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (serial_number)
);

-- Creation of transaction table
CREATE TABLE IF NOT EXISTS transaction (
  transaction_id SERIAL NOT NULL,
  ts timestamp without time zone NOT NULL, 
  customer_name varchar(250) NOT NULL,
  customer_phone varchar(250) NOT NULL,
  salesperson varchar(250) NOT NULL,
  serial_number INT NOT NULL,
  PRIMARY KEY (transaction_id),
  CONSTRAINT fk_serial_number
      FOREIGN KEY(serial_number) 
	      REFERENCES car(serial_number)
);



