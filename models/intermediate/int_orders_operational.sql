SELECT orders.*, 
       ROUND ((orders.margin + ship.shipping_fee - ship.log_cost - ship.ship_cost),2) AS operational_margin,
       ship.shipping_fee,
       ship.log_cost,
       ship.ship_cost       
FROM {{ ref('int_orders_margin')}} AS orders
LEFT JOIN {{ ref('stg_raw__ship')}} AS ship
ON orders.orders_id=ship.orders_id
ORDER BY orders.orders_id DESC




