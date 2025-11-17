-- BASE DE DADOS:
-- olist_customers_dataset : cidade e estado do cliente
-- olist_geolocation_dataset : coordenadas e cidade e estado
-- olist_order_items_dataset: id de venda, preço e frete 
-- olist_order_payments_dataset: tipos de pagamentos, quantidade de parcelas e o preço
-- olist_order_reviews_dataset: feedbacks da loja (opiniao de venda, se o produto chegou
-- olist_orders_dataset: ordem do pedido(quando gerou, publicou, enviou, recebeu.
-- olist_products_dataset: caracteristicas do produtos(peso,largura,altura,foto
-- olist_sellers_dataset: codigo, cidade e estado do vendedor

----------------------------------------------------------------------------------
--PERGUNTAS DE NEGOCIO:

--Quantos pedidos foram feitos no total?
SELECT * FROM olist_orders_dataset LIMIT 5

SELECT COUNT (DISTINCT order_id)
FROM olist_orders_dataset 

--Quantos clientes únicos existem na base?
SELECT  COUNT(DISTINCT customer_unique_id)
FROM olist_customers_dataset

--Quantos pedidos cada status possui (entregue, cancelado, recebido)?
select * from olist_orders_dataset
limit 20

SELECT order_status, count (order_id) as total_pedidos
from olist_orders_dataset
group by order_status
order by total_pedidos desc 

--Qual é o valor medio do frete?  -freight
SELECT * FROM olist_order_items_dataset

select AVG(freight_value) as media_de_frete
from olist_order_items_dataset

-- Quais as 5 categorias que a loja possui mais produtos em estoque (Contagem de produtos POR categoria)
SELECT COUNT(DISTINCT product_id) AS TOTAL_PRODUTOS, product_category_name AS CATEGORIA
FROM olist_products_dataset
GROUP BY product_category_name 
ORDER BY TOTAL_PRODUTOS DESC 
LIMIT 5

SELECT * FROM olist_sellers_dataset
limit 100

-- Quantos pedidos foram entregues em SP ?
SELECT count(DISTINCT order_id) as pedidos
from olist_orders_dataset
join olist_customers_dataset on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
where olist_customers_dataset.customer_state = 'SP' and olist_orders_dataset.order_status = 'delivered'

--Quais são os 5 produtos mais caros?
select * from olist_products_dataset 
limit 20

select olist_products_dataset.product_id, olist_order_items_dataset.price
from olist_order_items_dataset
join olist_products_dataset on olist_order_items_dataset.product_id = olist_products_dataset.product_id
where order_id > 1 
order by olist_order_items_dataset.price desc 
limit 5

-- E os 5 mais baratos?
select olist_products_dataset.product_id, olist_order_items_dataset.price
from olist_order_items_dataset
join olist_products_dataset on olist_order_items_dataset.product_id = olist_products_dataset.product_id
where order_id > 1
order by olist_order_items_dataset.price asc 
limit 5

--Quantos vendedores existem por estado? 
select * from olist_sellers_dataset
--
select olist_sellers_dataset.seller_state, count(olist_sellers_dataset.seller_id) as total_de_vendedores
from olist_sellers_dataset
group by olist_sellers_dataset.seller_state 
order by total_de_vendedores desc 

--Qual método de pagamento é mais usado e qual tem o maior valor médio de compra?
select * from olist_order_payments_dataset

SELECT order_id, COUNT(*) AS quantidade
FROM olist_order_payments_dataset
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY quantidade DESC;

-- vendo quantos pedidos tem em cada tipo de pagamento
select payment_type , count(DISTINCT order_id) as total_pedidos
from olist_order_payments_dataset
where order_id > 1
GROUP BY payment_type
order by total_pedidos desc 

-- media por metodo de pagamento 
select payment_type, AVG(payment_value) as valor_medio 
from olist_order_payments_dataset
group by payment_type
order by valor_medio desc 

-- Qual o ticket médio dos clientes que mais compram ?
-- ticket vai ser o total gasto pelo cliente / número de pedidos do cliente
select olist_orders_dataset.customer_id, 
count (DISTINCT olist_orders_dataset.order_id) as total_pedidos,
SUM(olist_order_items_dataset.price) as total_gasto,
(SUM(olist_order_items_dataset.price) / count (olist_orders_dataset.order_id)) as ticket_medio
FROM olist_orders_dataset
JOIN olist_order_items_dataset on olist_orders_dataset.order_id = olist_order_items_dataset.order_id
group by olist_orders_dataset.customer_id
order by total_gasto desc
limit 10 

--Quais e quantos metodos de pagamento os clientes usaram no pedidos?

SELECT orders.order_id AS ID_PEDIDO,
	   customer.customer_id AS ID_CLIENTE,
       COUNT(pay.payment_type) AS QTD_METODOS,
       GROUP_CONCAT(pay.payment_type,  ',') AS METODOS_DE_PAGAMENTO
FROM olist_orders_dataset orders
	LEFT JOIN olist_customers_dataset customer ON customer.customer_id = orders.customer_id
	LEFT JOIN olist_order_payments_dataset pay ON pay.order_id = orders.order_id
GROUP BY 1,2
HAVING COUNT(pay.payment_type) > 1

-- Quantos pedidos tem por estado ( mostrar o estado | quantidade de pedidos )
select * from olist_customers_dataset
select * from olist_orders_dataset
--
select olist_customers_dataset.customer_state as estados, 
count (olist_orders_dataset.order_id) as qnt_pedidos
from olist_orders_dataset
	left join olist_customers_dataset on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id 
group by olist_customers_dataset.customer_state
order by count(olist_orders_dataset.order_id) desc 

-- 






