create database reservations;
use reservations;

-- tables
-- Table: accesories
CREATE TABLE accesories (
   id int  NOT NULL,
   name varchar(100)  NOT NULL,
   brand varchar(100)  NOT NULL,
   CONSTRAINT accesories_pk PRIMARY KEY  (id)
);

-- Table: agencies
CREATE TABLE agencies (
   id int  NOT NULL,
   name varchar(100)  NOT NULL,
   telephone varchar(20)  NOT NULL,
   address varchar(200)  NOT NULL,
   CONSTRAINT agencies_pk PRIMARY KEY  (id)
);

-- Table: bike_accesories
CREATE TABLE bike_accesories (
   bike_id int  NOT NULL,
   accesory_id int  NOT NULL,
   CONSTRAINT bike_accesories_pk PRIMARY KEY  (bike_id,accesory_id)
);

-- Table: bikes
CREATE TABLE bikes (
   id int  NOT NULL,
   store_id int  NOT NULL,
   models_id int  NOT NULL,
   price int  NOT NULL,
   CONSTRAINT bikes_pk PRIMARY KEY  (id)
);

-- Table: customer_memberships
CREATE TABLE customer_memberships (
   customer_id int  NOT NULL,
   membership_id int  NOT NULL,
   start_date date  NOT NULL,
   end_date date  NOT NULL,
   CONSTRAINT customer_memberships_pk PRIMARY KEY  (start_date,membership_id,customer_id)
);

-- Table: customers
CREATE TABLE customers (
   id int  NOT NULL,
   last_name varchar(100)  NOT NULL,
   first_name varchar(100)  NOT NULL,
   telephone varchar(20)  NOT NULL,
   address varchar(200)  NOT NULL,
   CONSTRAINT customers_pk PRIMARY KEY  (id)
);

-- Table: memberships
CREATE TABLE memberships (
   id int  NOT NULL,
   name varchar(100)  NOT NULL,
   price int  NOT NULL,
   CONSTRAINT memberships_pk PRIMARY KEY  (id)
);

-- Table: models
CREATE TABLE models (
   id int  NOT NULL,
   name varchar(100)  NOT NULL,
   brand varchar(100)  NOT NULL,
   CONSTRAINT models_pk PRIMARY KEY  (id)
);

-- Table: reservation_bikes
CREATE TABLE reservation_bikes (
   reservation_id int  NOT NULL,
   bike_id int  NOT NULL,
   CONSTRAINT reservation_bikes_pk PRIMARY KEY  (reservation_id,bike_id)
);

-- Table: reservations
CREATE TABLE reservations (
   id int  NOT NULL,
   customer_id int  NOT NULL,
   reservation_date date  NOT NULL,
   agency_id int  NOT NULL,
   start_date date  NOT NULL,
   end_date date  NOT NULL,
   price int  NOT NULL,
   CONSTRAINT reservations_pk PRIMARY KEY  (id)
);

-- Table: stores
CREATE TABLE stores (
   id int  NOT NULL,
   address varchar(200)  NOT NULL,
   CONSTRAINT stores_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: bike_accesories_accesories (table: bike_accesories)
ALTER TABLE bike_accesories ADD CONSTRAINT bike_accesories_accesories
   FOREIGN KEY (accesory_id)
   REFERENCES accesories (id);

-- Reference: bike_accesories_bikes (table: bike_accesories)
ALTER TABLE bike_accesories ADD CONSTRAINT bike_accesories_bikes
   FOREIGN KEY (bike_id)
   REFERENCES bikes (id);

-- Reference: bikes_models (table: bikes)
ALTER TABLE bikes ADD CONSTRAINT bikes_models
   FOREIGN KEY (models_id)
   REFERENCES models (id);

-- Reference: bikes_stores (table: bikes)
ALTER TABLE bikes ADD CONSTRAINT bikes_stores
   FOREIGN KEY (store_id)
   REFERENCES stores (id);

-- Reference: customer_memberships_customers (table: customer_memberships)
ALTER TABLE customer_memberships ADD CONSTRAINT customer_memberships_customers
   FOREIGN KEY (customer_id)
   REFERENCES customers (id);

-- Reference: customer_memberships_memberships (table: customer_memberships)
ALTER TABLE customer_memberships ADD CONSTRAINT customer_memberships_memberships
   FOREIGN KEY (membership_id)
   REFERENCES memberships (id);

-- Reference: reservation_bikes_bikes (table: reservation_bikes)
ALTER TABLE reservation_bikes ADD CONSTRAINT reservation_bikes_bikes
   FOREIGN KEY (bike_id)
   REFERENCES bikes (id);

-- Reference: reservation_bikes_reservations (table: reservation_bikes)
ALTER TABLE reservation_bikes ADD CONSTRAINT reservation_bikes_reservations
   FOREIGN KEY (reservation_id)
   REFERENCES reservations (id);

-- Reference: reservations_agencies (table: reservations)
ALTER TABLE reservations ADD CONSTRAINT reservations_agencies
   FOREIGN KEY (agency_id)
   REFERENCES agencies (id);

-- Reference: reservations_customers (table: reservations)
ALTER TABLE reservations ADD CONSTRAINT reservations_customers
   FOREIGN KEY (customer_id)
   REFERENCES customers (id);

