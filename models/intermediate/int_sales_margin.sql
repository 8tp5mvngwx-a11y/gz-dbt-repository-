SELECT *, 
        ROUND ((sales.quantity * product.purchase_price),2) as purchase_cost,
        ROUND ((sales.revenue - (sales.quantity * product.purchase_price) ),2) as margin
FROM {{ ref('stg_raw__sales')}} AS sales
LEFT JOIN {{ ref('stg_raw__product')}} AS product
ON sales.products_id = product.products_id


