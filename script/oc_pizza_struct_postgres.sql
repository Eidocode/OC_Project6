
CREATE TABLE public.ingredient (
                id INTEGER NOT NULL,
                name VARCHAR(45) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                name VARCHAR(45) NOT NULL,
                description TEXT NOT NULL,
                unit_price_ht NUMERIC(5,2) NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;

CREATE TABLE public.reminder (
                id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                name VARCHAR(45) NOT NULL,
                description TEXT NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT reminder_pk PRIMARY KEY (id)
);


CREATE TABLE public.pizza_ingredient (
                pizza_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                CONSTRAINT pizza_ingredient_pk PRIMARY KEY (pizza_id, ingredient_id)
);


CREATE SEQUENCE public.payment_type_id_seq;

CREATE TABLE public.payment_type (
                id INTEGER NOT NULL DEFAULT nextval('public.payment_type_id_seq'),
                type VARCHAR(45) NOT NULL,
                CONSTRAINT payment_type_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.payment_type_id_seq OWNED BY public.payment_type.id;

CREATE SEQUENCE public.state_id_seq;

CREATE TABLE public.state (
                id INTEGER NOT NULL DEFAULT nextval('public.state_id_seq'),
                order_state VARCHAR(45) NOT NULL,
                CONSTRAINT state_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;

CREATE TABLE public.role (
                id INTEGER NOT NULL,
                role VARCHAR(15) NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (id)
);


CREATE TABLE public.contact (
                id INTEGER NOT NULL,
                phone_number VARCHAR(10),
                street_number VARCHAR(4),
                street_name VARCHAR(60),
                address_complement VARCHAR(90),
                postal_code VARCHAR(5) NOT NULL,
                city VARCHAR(15) NOT NULL,
                CONSTRAINT contact_pk PRIMARY KEY (id)
);


CREATE TABLE public.restaurant (
                id INTEGER NOT NULL,
                contact_id INTEGER NOT NULL,
                name VARCHAR(45) NOT NULL,
                email VARCHAR(45) NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (id)
);


CREATE TABLE public.stock (
                ingredient_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (ingredient_id, restaurant_id)
);


CREATE TABLE public.status (
                id INTEGER NOT NULL,
                user_status VARCHAR(45) NOT NULL,
                CONSTRAINT status_pk PRIMARY KEY (id)
);


CREATE TABLE public.person (
                id INTEGER NOT NULL,
                status_id INTEGER NOT NULL,
                title VARCHAR(5),
                lastname VARCHAR(50) NOT NULL,
                firstname VARCHAR(45) NOT NULL,
                login VARCHAR(45) NOT NULL,
                password VARCHAR(45) NOT NULL,
                email VARCHAR(90) NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT person_pk PRIMARY KEY (id)
);


CREATE TABLE public.employee (
                id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                role_id INTEGER NOT NULL,
                CONSTRAINT employee_pk PRIMARY KEY (id)
);


CREATE TABLE public.customer (
                id INTEGER NOT NULL,
                contact_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                CONSTRAINT customer_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.purchase_order_number_seq;

CREATE TABLE public.purchase_order (
                number INTEGER NOT NULL DEFAULT nextval('public.purchase_order_number_seq'),
                customer_id INTEGER NOT NULL,
                state_id INTEGER NOT NULL,
                paid_online SMALLINT NOT NULL,
                delivery SMALLINT NOT NULL,
                added_date TIMESTAMP NOT NULL,
                CONSTRAINT purchase_order_pk PRIMARY KEY (number)
);


ALTER SEQUENCE public.purchase_order_number_seq OWNED BY public.purchase_order.number;

CREATE TABLE public.item (
                id INTEGER NOT NULL,
                order_number INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                rate_vat100 NUMERIC(4,2) NOT NULL,
                CONSTRAINT item_pk PRIMARY KEY (id)
);


CREATE TABLE public.bill (
                order_number INTEGER NOT NULL,
                rate_vat100 NUMERIC(4,2) NOT NULL,
                payment_type_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                CONSTRAINT bill_pk PRIMARY KEY (order_number)
);


ALTER TABLE public.pizza_ingredient ADD CONSTRAINT ingredient_pizza_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.item ADD CONSTRAINT pizza_item_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_ingredient ADD CONSTRAINT pizza_pizza_ingredient_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reminder ADD CONSTRAINT pizza_reminder_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.bill ADD CONSTRAINT payment_type_bill_fk
FOREIGN KEY (payment_type_id)
REFERENCES public.payment_type (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.purchase_order ADD CONSTRAINT state_order_fk
FOREIGN KEY (state_id)
REFERENCES public.state (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employee ADD CONSTRAINT role_employee_fk
FOREIGN KEY (role_id)
REFERENCES public.role (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.customer ADD CONSTRAINT contact_customer_fk
FOREIGN KEY (contact_id)
REFERENCES public.contact (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.restaurant ADD CONSTRAINT contact_restaurant_fk
FOREIGN KEY (contact_id)
REFERENCES public.contact (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employee ADD CONSTRAINT restaurant_employee_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.bill ADD CONSTRAINT restaurant_bill_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person ADD CONSTRAINT status_user_fk
FOREIGN KEY (status_id)
REFERENCES public.status (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.customer ADD CONSTRAINT user_customer_fk
FOREIGN KEY (user_id)
REFERENCES public.person (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employee ADD CONSTRAINT user_employee_fk
FOREIGN KEY (user_id)
REFERENCES public.person (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.purchase_order ADD CONSTRAINT customer_order_fk
FOREIGN KEY (customer_id)
REFERENCES public.customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.bill ADD CONSTRAINT order_bill_fk
FOREIGN KEY (order_number)
REFERENCES public.purchase_order (number)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.item ADD CONSTRAINT order_item_fk
FOREIGN KEY (order_number)
REFERENCES public.purchase_order (number)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
