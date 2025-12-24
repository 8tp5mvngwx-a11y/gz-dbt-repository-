WITH orders_per_day AS (
SELECT date_date,
       COUNT(DISTINCT orders_id) AS nb_transaction,
       ROUND(SUM(revenue),2) AS total_revenue,
       ROUND(SUM(margin),2) AS total_margin,
       ROUND(SUM(operational_margin),2) AS total_operational_margin,
       ROUND(SUM(purchase_cost),2) AS total_purchase_cost,
       ROUND(SUM(shipping_fee),2) AS total_shipping_fee,
       ROUND(SUM(log_cost),2) AS total_log_cost,
       ROUND(SUM(ship_cost),2) AS total_ship_cost,
       SUM(quantity) AS total_quantity
FROM {{ ref('int_orders_operational')}}
GROUP BY date_date)

SELECT date_date,
       nb_transaction,
       total_revenue,
       ROUND((total_revenue/ IFNULL (nb_transaction,0)),2) AS avg_basket,
       total_margin,
       total_operational_margin,
       total_purchase_cost,
       total_shipping_fee,
       total_log_cost,
       total_ship_cost,
       total_quantity
FROM orders_per_day
ORDER BY date_date DESC
