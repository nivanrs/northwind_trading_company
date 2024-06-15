-- models/monthly_most_sold_product_category.sql
WITH monthly_category_sales AS (
    SELECT
        categoryid,
        DATE_TRUNC('month', orderdate) AS month,
        SUM(quantity) AS total_quantity
    FROM
        {{ ref('fact_orders') }}
    GROUP BY
        categoryid, DATE_TRUNC('month', orderdate)
)
SELECT
    c.categoryname,
    mcs.month,
    mcs.total_quantity
FROM
    monthly_category_sales AS mcs
JOIN
    {{ ref('categories') }} AS c ON mcs.categoryid = c.categoryid
ORDER BY
    mcs.month, mcs.total_quantity DESC
