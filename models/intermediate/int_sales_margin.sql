SELECT 
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    ROUND(product.purchase_price * sales.quantity, 2) AS purchase_cost,
    ROUND(sales.revenue - product.purchase_price * sales.quantity, 2) AS margin
FROM {{ref ("stg_raw__sales")}} as sales
LEFT JOIN {{ref ("stg_raw__product")}} as product
USING (products_id)