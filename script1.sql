-- ingreso de informacion a tablas

-- tabla customer
INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('cc', '12345', '2022/03/01');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('ti', '123457', '2022/02/02');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('cc', '09877', '2021/11/10');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('cc', '12039', '2020/05/11');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('ti', '10203', '2010/02/07');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('ti', '98765', '2021/07/11');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('CC', '1033775', '2022/02/20');

INSERT INTO store.customer(cus_type_dni, cus_dni, create_at)
VALUE('cc', '379662', '2022/03/02');

-- tabla seller

INSERT INTO store.seller(sel_name, sel_type_dni, sel_dni, create_at)
VALUE('El jefe','cc', '80385', '1990/04/20');

-- tabla supplier

INSERT INTO store.supplier(sup_name, sup_phone,create_at)
VALUE('El Buhonero', '1112005', '1970/11/07');

INSERT INTO store.supplier(sup_name, sup_phone,create_at)
VALUE('El DUQUE', '1112007', '1980/09/08');

INSERT INTO store.supplier(sup_name, sup_phone,create_at)
VALUE('Leon SK', '1321314', '1977/10/07');

-- tabla producto 
INSERT INTO store.product(prod_name, prod_type, prd_quantity, prd_price, create_at, supplier_id)
VALUE('arroz','granos', '20', '2000', '2022/02/25', '1');

INSERT INTO store.product(prod_name, prod_type, prd_quantity, prd_price, create_at, supplier_id)
VALUE('avena','granos', '15', '1100', '2022/02/21','1');

INSERT INTO store.product(prod_name, prod_type, prd_quantity, prd_price, create_at, supplier_id)
VALUE('lechuga','verdura', '17', '1000', '2022/02/26','1');

INSERT INTO store.product(prod_name, prod_type, prd_quantity, prd_price, create_at, supplier_id)
VALUE('cebolla','verdura', '22', '800', '2022/02/20','1');

INSERT INTO store.product(prod_name, prod_type, prd_quantity, prd_price, create_at, supplier_id)
VALUE('manzana','fruta', '18', '1200', '2022/03/2', '1');

INSERT INTO store.product(prod_name, prod_type, prd_quantity, prd_price, create_at, supplier_id)
VALUE('pera','fruta', '26', '800', '2022/02/18', '1');

-- tabla venta

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '1', '2022/01/20' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '8', '2022/01/20' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '2', '2022/01/20' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '3', '2022/02/18' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '4', '2021/03/10' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '5','2021/11/30' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '6', '2021/06/15' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1', '7', '2022/06/15' );

INSERT INTO store.sale(seller_sel_id, customer_cus_id, create_at)
VALUE('1','7', '2022/03/07');

-- ventas realizadas

INSERT INTO store.sale_has_product(product_id, sale_id, product_quantity)
VALUE('5','8', '2' );
INSERT INTO store.sale_has_product(product_id, sale_id, product_quantity)
VALUE('6','8', '4' );
INSERT INTO store.sale_has_product(product_id, sale_id, product_quantity)
VALUE('1','8', '3' );
INSERT INTO store.sale_has_product(product_id, sale_id, product_quantity)
VALUE('4','6', '2' );
INSERT INTO store.sale_has_product(product_id, sale_id, product_quantity)
VALUE('3','7', '4' );

-- actualizacion de provedor
UPDATE store.product
SET prod_name = 'papa',
supplier_id = '2'
WHERE prod_id = '2';

UPDATE store.product
SET prod_name = 'fresa',
supplier_id = '3'
WHERE prod_id = '3';


-- Borrado FISICO 
DELETE FROM store.sale
WHERE sale_id = 2; 

DELETE FROM store.sale
WHERE sale_id = 5;

-- BORRADO LOGICO

UPDATE store.sale
SET delete_at = now()
WHERE sale_id = 4;

UPDATE store.sale
SET delete_at = now()
WHERE sale_id = 3;


