-- models/monthly_gross_revenue_per_supplier.sql
WITH monthly_revenue AS (
    SELECT
        supplierid,
        DATE_TRUNC('month', orderdate) AS month,
        SUM(total_gross_revenue) AS gross_revenue
    FROM
        {{ ref('fact_orders') }}
    GROUP BY
        supplierid, DATE_TRUNC('month', orderdate)
)
SELECT
    s.companyname,
    mr.month,
    mr.gross_revenue
FROM
    monthly_revenue AS mr
JOIN
    {{ ref('dim_suppliers') }} AS s ON mr.supplierid = s.supplierid
ORDER BY
    mr.month, s.companyname
