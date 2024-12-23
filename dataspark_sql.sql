use dataspark;

select * from customers;

select * from customers where Country='United States';

drop table customers;

-- Increase timeout limits for this session
SET GLOBAL wait_timeout = 28800;
SET GLOBAL interactive_timeout = 28800;

-- Optional: Disable foreign key checks
SET foreign_key_checks = 0;
DELETE FROM customers LIMIT 1000;

-- Attempt to drop the table again
DROP TABLE customers;

-- Re-enable foreign key checks (if you disabled them)
SET foreign_key_checks = 1;

SET SESSION wait_timeout = 600;
SET SESSION interactive_timeout = 600;
DROP TABLE customers;

drop table exchange_rates;
