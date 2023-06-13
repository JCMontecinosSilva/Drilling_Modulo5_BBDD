--CUSTOMER--
insert into customer(
customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date,last_update, active)
VALUES (999, 5,'Leandro','Montecinos','Leandro.montecinos@gmail.com',15,true,current_timestamp,current_timestamp,1);

UPDATE customer 
SET email = 'Leandro.montecinos@yahoo.com' 
WHERE customer_id = 999;

delete from customer
where customer_id = 999;



--STAFF--
insert into staff(
staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
values(4,'Alen','Montecinos',5,'alen.montecinos@gmail.com',3,true,'Alen','Abcd1234',current_timestamp,'JPG ');

update staff
set  password='Efgh5678'
where staff_id=3;

delete from staff
where staff_id = 3;


--ACTOR--
insert into actor(
actor_id, first_name, last_name, last_update)
values(999,'Denzel','Washinton',current_timestamp);

update actor
set first_name='Arnold', last_name= 'Schwarzenegger'
where actor_id=999;

delete from actor
where actor_id=999;





--Listar rental con datos de customer--
SELECT rental.rental_id, rental.rental_date, rental.return_date, customer.customer_id, customer.first_name, customer.last_name
FROM rental
INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2006 
AND EXTRACT(MONTH FROM rental.rental_date) = 2;

--listar numero, fecha y total--
SELECT payment_id, payment_date, amount 
FROM payment;

--Listar film año 2006 rental mayor a 4.0
SELECT * 
FROM film 
WHERE release_year = 2006 AND rental_rate > 4.0;


--Diccionario--
SELECT
	t1.TABLE_NAME AS tabla_nombre,
	t1.COLUMN_NAME AS columna_nombre,
	t1.COLUMN_DEFAULT AS columna_defecto,
	t1.IS_NULLABLE AS columna_nulo,
	t1.DATA_TYPE AS columna_tipo_dato,
    COALESCE(t1.NUMERIC_PRECISION,
    t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
	PG_CATALOG.COL_DESCRIPTION(t2.OID,
	t1.DTD_IDENTIFIER::int) AS columna_descripcion,
	t1.DOMAIN_NAME AS columna_dominio
FROM
	INFORMATION_SCHEMA.COLUMNS t1
	INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
	t1.TABLE_SCHEMA = 'public'
ORDER BY
	t1.TABLE_NAME;