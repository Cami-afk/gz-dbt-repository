WITH order_per_day AS(

SELECT 
        date_date
        ,COUNT(DISTINCT(orders_id)) as nb_transactions
        ,ROUND(SUM(revenue), 2) as total_revenue
        ,ROUND(SUM(margin), 2) as margin
        ,ROUND(SUM(operational_margin), 2) as operational_margin
        ,ROUND(SUM(purchase_cost), 2) as total_purchase_cost
        ,ROUND(SUM(shipping_fee), 2) as total_shipping_fee
        ,ROUND(SUM(log_cost), 2) as total_log_cost
        ,SUM(quantity) as total_quantity
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
)
SELECT
    date_date
    , nb_transactions
    , total_revenue
    , margin
    , operational_margin
    , total_purchase_cost
    , total_shipping_fee
    , total_log_cost
    , total_quantity
    , ROUND(total_revenue/NULLIF(nb_transactions, 0), 2) AS average_basket
FROM order_per_day
ORDER BY date_date DESC