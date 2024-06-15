-- models/best_employee_based_on_monthly_gross_revenue.sql
WITH monthly_employee_revenue AS (
    SELECT
        employeeid,
        DATE_TRUNC('month', orderdate) AS month,
        SUM(total_gross_revenue) AS gross_revenue
    FROM
        {{ ref('fact_orders') }}
    GROUP BY
        employeeid, DATE_TRUNC('month', orderdate)
),
best_employee AS (
    SELECT
        employeeid,
        month,
        gross_revenue,
        RANK() OVER (PARTITION BY month ORDER BY gross_revenue DESC) AS rank
    FROM
        monthly_employee_revenue
)
SELECT
    e.firstname || ' ' || e.lastname AS employee_name,
    be.month,
    be.gross_revenue
FROM
    best_employee AS be
JOIN
    {{ ref('employees') }} AS e ON be.employeeid = e.employeeid
WHERE
    be.rank = 1
ORDER BY
    be.month
