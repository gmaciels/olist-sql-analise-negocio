# olist-sql-analise-negocio
Projeto de análise SQL utilizando os datasets públicos da Olist. Consultas, insights e perguntas de negócio

# Análise SQL – Projeto do E-commerce da Olist (disponível no Kaggle)

Este repositório contém um estudo completo realizado sobre os datasets públicos da Olist, com foco em reforçar meus conhecimentos em SQL e desenvolver perguntas de negócio que possam gerar insights reais em um ambiente de e-commerce.

Durante o projeto, trabalhei com 9 tabelas relacionais, explorando informações sobre clientes, pedidos, produtos, pagamentos, entregas e vendedores.

O objetivo principal foi:
- entender a estrutura dos dados,
- formular perguntas de negócio, e
- respondê-las utilizando SQL de forma clara e estruturada.

# As principais tabelas do dataset Olist utilizadas na análise foram: 

olist_customers_dataset — informações dos clientes

olist_orders_dataset — pedidos e status

olist_order_items_dataset — itens dos pedidos (preço, frete, produto)

olist_order_payments_dataset — métodos de pagamento

olist_order_reviews_dataset — avaliações dos pedidos

olist_products_dataset — características dos produtos

olist_sellers_dataset — informações dos vendedores

olist_geolocation_dataset — localização geográfica


# Objetivo e Desenvolvimento do Projeto 

O objetivo foi entender melhor a estrutura dos dados, analisar tabelas reais de clientes, pedidos, produtos, pagamentos e entregas, e principalmente levantar perguntas de negócio relevantes, estruturando cada uma com consultas SQL.
Durante o processo, trabalhei com conceitos como:

Identificação de entidades e relacionamentos

- JOINs entre tabelas

- Funções de agregação (COUNT, SUM, AVG)

- Filtragem com WHERE e HAVING

- Agrupamentos com GROUP BY

- Ordenação e análise comparativa

- Detecção de duplicidades

- Ticket médio por cliente e por categoria

- Análises logísticas e de métodos de pagamento

# Perguntas de Negócios 

A seguir, as perguntas levantadas e trabalhadas durante a análise:

1. Quantos clientes únicos existem na base?

→ Identificação de duplicidades e contagem real de consumidores.

2. Quantos pedidos cada status possui?

→ Entregues, cancelados, enviados, etc.

3. Qual é o valor médio do frete nos pedidos?

→ Custo logístico médio.

4. Qual é o número médio de itens por pedido?

→ Comportamento de compra por cliente.

5. Quais são os 5 produtos mais caros da base?

→ Avaliação de itens de maior valor individual.

6. Quantos vendedores existem por estado?

→ Distribuição geográfica dos sellers.

7. Qual método de pagamento é mais usado e qual tem maior ticket médio?

→ Preferência e comportamento financeiro dos clientes.

8. Quantos pedidos existem por estado?

→ Volume de vendas por localização.

9. Quais métodos de pagamento os clientes usaram em cada pedido?

→ Análise de pagamentos múltiplos por transação.

10. Entre os clientes que mais compram, qual é o ticket médio?

→ Identificação dos melhores clientes (top spenders)



