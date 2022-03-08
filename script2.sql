-- CONSULTA productos por medio del tipo y numero del documento
SELECT cliente.cus_dni AS numero_documento,
 cliente.cus_type_dni AS tipo_documento,
 venta.sale_id AS id_venta,
 venta.create_at AS fecha_compra,
 producto.prod_name AS nombre_producto,
 sale_has_product.product_quantity AS  cantidad_comprada
FROM store.sale_has_product
INNER JOIN store.sale as venta ON venta.sale_id = store.sale_has_product.sale_id
INNER JOIN store.customer as cliente on cliente.cus_id = venta.customer_cus_id
INNER JOIN store.product as producto on producto.prod_id = sale_has_product.product_id
WHERE cliente.cus_type_dni = 'cc' and cliente.cus_dni = '1033775';

-- Consultar productos por medio del nombre
SELECT provedor.sup_id as identificador_provedor,
provedor.sup_name as nombre_provedor,
producto.prod_name as nombre_producto
FROM store.product as producto
INNER JOIN store.supplier as provedor on provedor.sup_id = producto.supplier_id
WHERE producto.prod_name = 'ARROZ';

-- Consulta extra productos mas vendidos
SELECT producto.prod_name AS nombre_producto,
sum(sale_has_product.product_quantity) AS  cantidad_comprada
FROM store.sale_has_product
INNER JOIN store.sale as venta ON venta.sale_id = store.sale_has_product.sale_id
INNER JOIN store.customer as cliente on cliente.cus_id = venta.customer_cus_id
INNER JOIN store.product as producto on producto.prod_id = sale_has_product.product_id
GROUP BY producto.prod_id
ORDER BY sale_has_product.product_quantity DESC;