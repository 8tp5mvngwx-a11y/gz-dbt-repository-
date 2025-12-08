SELECT *, 
        (sales.quantity * product.purchase_price) as purchase_cost,
        (sales.revenue - (sales.quantity * product.purchase_price) ) as margin
FROM {{ ref('stg_raw__sales')}} AS sales
LEFT JOIN {{ ref('stg_raw__product')}} AS product
ON sales.products_id = product.products_id


