-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS store DEFAULT CHARACTER SET utf8 ;
USE store;

-- -----------------------------------------------------
-- Table  Customer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store.customer (
  cus_id INT NOT NULL AUTO_INCREMENT,
  cus_type_dni VARCHAR(4) NOT NULL,
  cus_dni VARCHAR(45) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL DEFAULT NULL,
  delete_at DATE NULL DEFAULT NULL,
  PRIMARY KEY ( cus_id ),
  UNIQUE INDEX  cus_dni_UNIQUE  ( cus_type_dni  ASC,  cus_dni  ASC)
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table  Supplier
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  store.supplier  (
   sup_id  INT NOT NULL AUTO_INCREMENT,
   sup_name  VARCHAR(25) NOT NULL,
   sup_phone  VARCHAR(25) NOT NULL,
   create_at  DATE NOT NULL,
   update_at  DATE NULL DEFAULT NULL,
   delete_at  DATE NULL DEFAULT NULL,
  PRIMARY KEY ( sup_id )
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table  Product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  store.product  (
   prod_id  INT NOT NULL AUTO_INCREMENT,
   supplier_id  INT NOT NULL,
   prod_name  VARCHAR(25) NOT NULL,
   prod_type  VARCHAR(25) NOT NULL,
   prd_quantity  VARCHAR(25) NOT NULL,
   prd_price  VARCHAR(25) NOT NULL,
   create_at  DATE NOT NULL,
   update_at  DATE NULL DEFAULT NULL,
   delete_at  DATE NULL DEFAULT NULL,
  PRIMARY KEY ( prod_id ),
  INDEX  supplier_sup_id_UNIQUE  ( supplier_id  ASC),
  CONSTRAINT  supplier_sup_id 
    FOREIGN KEY ( supplier_id )
    REFERENCES  store.supplier  ( sup_id )
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table  Seller
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  store.seller  (
   sel_id  INT NOT NULL AUTO_INCREMENT,
   sel_name  VARCHAR(45) NOT NULL,
   sel_type_dni  VARCHAR(45) NOT NULL,
   sel_dni  VARCHAR(20) NOT NULL,
   create_at  DATE NOT NULL,
   update_at  DATE NULL DEFAULT NULL,
   delete_at  DATE NULL DEFAULT NULL,
  PRIMARY KEY ( sel_id ),
  UNIQUE INDEX  sel_dni_UNIQUE  ( sel_type_dni  ASC,  sel_dni  ASC)
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table  store . sale 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  store.sale  (
   sale_id  INT NOT NULL AUTO_INCREMENT,
   seller_sel_id  INT NOT NULL,
   customer_cus_id  INT NOT NULL,
   create_at  DATE NOT NULL,
   update_at  DATE NULL DEFAULT NULL,
   delete_at  DATE NULL DEFAULT NULL,
  PRIMARY KEY ( sale_id ),
  INDEX  fk_sale_customer1_idx  ( customer_cus_id  ASC),
  INDEX  fk_sale_seller1_idx  ( seller_sel_id  ASC),
  CONSTRAINT  fk_sale_customer1 
    FOREIGN KEY ( customer_cus_id )
    REFERENCES  store.customer  ( cus_id ),
  CONSTRAINT  fk_sale_seller1 
    FOREIGN KEY ( seller_sel_id )
    REFERENCES  store.seller  ( sel_id )
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table  Sale_has_product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  store.sale_has_product  (
   product_id  INT NOT NULL,
   sale_id  INT NOT NULL,
   product_quantity  INT NOT NULL,
  PRIMARY KEY ( product_id ,  sale_id ),
  INDEX  fk_product_has_sale_sale1_idx  ( sale_id  ASC),
  INDEX  fk_product_has_sale_product1_idx  ( product_id  ASC),
  CONSTRAINT  fk_product_has_sale_product1 
    FOREIGN KEY ( product_id )
    REFERENCES  store.product  ( prod_id ),
  CONSTRAINT  fk_product_has_sale_sale1 
    FOREIGN KEY ( sale_id )
    REFERENCES  store.sale  ( sale_id )
) ENGINE = InnoDB;

