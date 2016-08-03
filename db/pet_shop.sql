DROP TABLE pets;
DROP TABLE shops;

CREATE TABLE shops (
id serial4 primary key,
name varchar(255)
);

CREATE TABLE pets (
id serial8 primary key,
name varchar(255),
shop_id int4 references shops(id)
);