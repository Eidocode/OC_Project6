-- -----------------------------------------------------
-- Database oc_pizza
-- -----------------------------------------------------

CREATE DATABASE oc_pizza
    WITH 
    OWNER = student
    ENCODING = 'UTF8'
    LC_COLLATE = 'fr_FR.UTF-8'
    LC_CTYPE = 'fr_FR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


-- -----------------------------------------------------
-- Table `oc_ingredient`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_ingredient_id_seq;

CREATE TABLE public.oc_ingredient (
                ingredient_id INTEGER NOT NULL DEFAULT nextval('public.oc_ingredient_id_seq'),
                name VARCHAR(45) NOT NULL,
                CONSTRAINT oc_ingredient_pk PRIMARY KEY (ingredient_id)
);


ALTER SEQUENCE public.oc_ingredient_id_seq OWNED BY public.oc_ingredient.ingredient_id;


-- -----------------------------------------------------
-- Table `oc_pizza`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_pizza_id_seq;

CREATE TABLE public.oc_pizza (
                pizza_id INTEGER NOT NULL DEFAULT nextval('public.oc_pizza_id_seq'),
                name VARCHAR(45) NOT NULL,
                description TEXT NOT NULL,
                unit_price_ht NUMERIC(5,2) NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT oc_pizza_pk PRIMARY KEY (pizza_id)
);


ALTER SEQUENCE public.oc_pizza_id_seq OWNED BY public.oc_pizza.pizza_id;


-- -----------------------------------------------------
-- Table `oc_reminder`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_reminder_id_seq;

CREATE TABLE public.oc_reminder (
                reminder_id INTEGER NOT NULL DEFAULT nextval('public.oc_reminder_id_seq'),
                pizza_id INTEGER NOT NULL,
                name VARCHAR(45) NOT NULL,
                description TEXT NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT oc_reminder_pk PRIMARY KEY (reminder_id)
);


ALTER SEQUENCE public.oc_reminder_id_seq OWNED BY public.oc_reminder.reminder_id;


-- -----------------------------------------------------
-- Table `oc_pizza_ingredient`
-- -----------------------------------------------------

CREATE TABLE public.oc_pizza_ingredient (
                pizza_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                CONSTRAINT oc_pizza_ingredient_pk PRIMARY KEY (pizza_id, ingredient_id)
);


-- -----------------------------------------------------
-- Table `oc_payment_type`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_payment_type_id_seq;

CREATE TABLE public.oc_payment_type (
                payment_type_id INTEGER NOT NULL DEFAULT nextval('public.oc_payment_type_id_seq'),
                payment_type VARCHAR(45) NOT NULL,
                CONSTRAINT oc_payment_type_pk PRIMARY KEY (payment_type_id)
);


ALTER SEQUENCE public.oc_payment_type_id_seq OWNED BY public.oc_payment_type.payment_type_id;


-- -----------------------------------------------------
-- Table `oc_order_state`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_order_state_id_seq_1;

CREATE TABLE public.oc_order_state (
                order_state_id INTEGER NOT NULL DEFAULT nextval('public.oc_order_state_id_seq_1'),
                order_state VARCHAR(45) NOT NULL,
                CONSTRAINT oc_order_state_pk PRIMARY KEY (order_state_id)
);


ALTER SEQUENCE public.oc_order_state_id_seq_1 OWNED BY public.oc_order_state.order_state_id;


-- -----------------------------------------------------
-- Table `oc_role`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_role_id_seq;

CREATE TABLE public.oc_role (
                role_id INTEGER NOT NULL DEFAULT nextval('public.oc_role_id_seq'),
                role VARCHAR(15) NOT NULL,
                CONSTRAINT oc_role_pk PRIMARY KEY (role_id)
);


ALTER SEQUENCE public.oc_role_id_seq OWNED BY public.oc_role.role_id;


-- -----------------------------------------------------
-- Table `oc_contact`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_contact_id_seq;

CREATE TABLE public.oc_contact (
                contact_id INTEGER NOT NULL DEFAULT nextval('public.oc_contact_id_seq'),
                phone_number VARCHAR(10),
                street_number VARCHAR(4),
                street_name VARCHAR(60),
                address_complement VARCHAR(90),
                postal_code VARCHAR(5) NOT NULL,
                city VARCHAR(15) NOT NULL,
                CONSTRAINT oc_contact_pk PRIMARY KEY (contact_id)
);


ALTER SEQUENCE public.oc_contact_id_seq OWNED BY public.oc_contact.contact_id;


-- -----------------------------------------------------
-- Table `oc_restaurant`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_restaurant_id_seq;

CREATE TABLE public.oc_restaurant (
                restaurant_id INTEGER NOT NULL DEFAULT nextval('public.oc_restaurant_id_seq'),
                contact_id INTEGER NOT NULL,
                name VARCHAR(45) NOT NULL,
                email VARCHAR(45) NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT oc_restaurant_pk PRIMARY KEY (restaurant_id)
);


ALTER SEQUENCE public.oc_restaurant_id_seq OWNED BY public.oc_restaurant.restaurant_id;


-- -----------------------------------------------------
-- Table `oc_stock`
-- -----------------------------------------------------

CREATE TABLE public.oc_stock (
                ingredient_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                CONSTRAINT oc_stock_pk PRIMARY KEY (ingredient_id, restaurant_id)
);


-- -----------------------------------------------------
-- Table `oc_user_status`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_user_status_id_seq_1;

CREATE TABLE public.oc_user_status (
                user_status_id INTEGER NOT NULL DEFAULT nextval('public.oc_user_status_id_seq_1'),
                user_status VARCHAR(45) NOT NULL,
                CONSTRAINT oc_user_status_pk PRIMARY KEY (user_status_id)
);


ALTER SEQUENCE public.oc_user_status_id_seq_1 OWNED BY public.oc_user_status.user_status_id;


-- -----------------------------------------------------
-- Table `oc_user`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_user_id_seq;

CREATE TABLE public.oc_user (
                user_id INTEGER NOT NULL DEFAULT nextval('public.oc_user_id_seq'),
                status_id INTEGER NOT NULL,
                title VARCHAR(5),
                lastname VARCHAR(50) NOT NULL,
                firstname VARCHAR(45) NOT NULL,
                login VARCHAR(45) NOT NULL,
                password VARCHAR(45) NOT NULL,
                email VARCHAR(90) NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT oc_user_pk PRIMARY KEY (user_id)
);


ALTER SEQUENCE public.oc_user_id_seq OWNED BY public.oc_user.user_id;


-- -----------------------------------------------------
-- Table `oc_employee`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_employee_id_seq;

CREATE TABLE public.oc_employee (
                employee_id INTEGER NOT NULL DEFAULT nextval('public.oc_employee_id_seq'),
                restaurant_id INTEGER NOT NULL,
                role_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                CONSTRAINT oc_employee_pk PRIMARY KEY (employee_id)
);


ALTER SEQUENCE public.oc_employee_id_seq OWNED BY public.oc_employee.employee_id;


-- -----------------------------------------------------
-- Table `oc_customer`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_customer_id_seq;

CREATE TABLE public.oc_customer (
                customer_id INTEGER NOT NULL DEFAULT nextval('public.oc_customer_id_seq'),
                contact_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                CONSTRAINT oc_customer_pk PRIMARY KEY (customer_id)
);


ALTER SEQUENCE public.oc_customer_id_seq OWNED BY public.oc_customer.customer_id;


-- -----------------------------------------------------
-- Table `oc_order`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_order_number_seq;

CREATE TABLE public.oc_order (
                order_id INTEGER NOT NULL DEFAULT nextval('public.oc_order_number_seq'),
                order_state_id INTEGER NOT NULL,
                customer_id INTEGER NOT NULL,
                paid_online SMALLINT NOT NULL,
                delivery SMALLINT NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT oc_order_pk PRIMARY KEY (order_id)
);


ALTER SEQUENCE public.oc_order_number_seq OWNED BY public.oc_order.order_id;


-- -----------------------------------------------------
-- Table `oc_item`
-- -----------------------------------------------------

CREATE SEQUENCE public.oc_item_id_seq;

CREATE TABLE public.oc_item (
                item_id INTEGER NOT NULL DEFAULT nextval('public.oc_item_id_seq'),
                order_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                rate_vat100 NUMERIC(4,2) NOT NULL,
                CONSTRAINT oc_item_pk PRIMARY KEY (item_id)
);


ALTER SEQUENCE public.oc_item_id_seq OWNED BY public.oc_item.item_id;


-- -----------------------------------------------------
-- Table `oc_bill`
-- -----------------------------------------------------

CREATE TABLE public.oc_bill (
                order_id INTEGER NOT NULL,
                rate_vat100 NUMERIC(4,2) NOT NULL,
                payment_type_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                CONSTRAINT oc_bill_pk PRIMARY KEY (order_id)
);



-- -----------------------------------------------------
-- Constraints
-- -----------------------------------------------------

ALTER TABLE public.oc_pizza_ingredient ADD CONSTRAINT ingredient_pizza_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.oc_ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.oc_ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_item ADD CONSTRAINT pizza_item_fk
FOREIGN KEY (pizza_id)
REFERENCES public.oc_pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_pizza_ingredient ADD CONSTRAINT pizza_pizza_ingredient_fk
FOREIGN KEY (pizza_id)
REFERENCES public.oc_pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_reminder ADD CONSTRAINT pizza_reminder_fk
FOREIGN KEY (pizza_id)
REFERENCES public.oc_pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_bill ADD CONSTRAINT payment_type_bill_fk
FOREIGN KEY (payment_type_id)
REFERENCES public.oc_payment_type (payment_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_order ADD CONSTRAINT state_order_fk
FOREIGN KEY (order_state_id)
REFERENCES public.oc_order_state (order_state_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_employee ADD CONSTRAINT role_employee_fk
FOREIGN KEY (role_id)
REFERENCES public.oc_role (role_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_customer ADD CONSTRAINT contact_customer_fk
FOREIGN KEY (contact_id)
REFERENCES public.oc_contact (contact_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_restaurant ADD CONSTRAINT contact_restaurant_fk
FOREIGN KEY (contact_id)
REFERENCES public.oc_contact (contact_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_employee ADD CONSTRAINT restaurant_employee_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.oc_restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_bill ADD CONSTRAINT restaurant_bill_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.oc_restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.oc_restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_user ADD CONSTRAINT status_person_fk
FOREIGN KEY (status_id)
REFERENCES public.oc_user_status (user_status_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_customer ADD CONSTRAINT person_customer_fk
FOREIGN KEY (user_id)
REFERENCES public.oc_user (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_employee ADD CONSTRAINT person_employee_fk
FOREIGN KEY (user_id)
REFERENCES public.oc_user (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_order ADD CONSTRAINT customer_purchase_order_fk
FOREIGN KEY (customer_id)
REFERENCES public.oc_customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_bill ADD CONSTRAINT purchase_order_bill_fk
FOREIGN KEY (order_id)
REFERENCES public.oc_order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.oc_item ADD CONSTRAINT purchase_order_item_fk
FOREIGN KEY (order_id)
REFERENCES public.oc_order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
