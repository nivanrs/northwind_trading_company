#!python config

oltp_conn_string = "localhost:5432//db_project_northwind"


oltp_tables = {
    "users": "tb_users",
    "payments": "tb_payments",
    "shippers": "tb_shippers",
    "ratings": "tb_ratings",
    "vouchers": "tb_vouchers",
    "orders": "tb_orders",
    "product_category": "tb_product_category",
    "products": "tb_products",   
    "orders_items": "tb_order_items"
}

ddl_statements = {
    "dim_user": """
        CREATE TABLE IF NOT EXISTS dim_user (
            user_id INT NOT NULL PRIMARY KEY,
            user_first_name VARCHAR(255) NOT NULL,
            user_last_name VARCHAR(255) NOT NULL,
            user_gender VARCHAR(50) NOT NULL,
            user_address VARCHAR(255),
            user_birthday DATE NOT NULL,
            user_join DATE NOT NULL
        );
    """,
    "dim_payment": """
        CREATE TABLE IF NOT EXISTS dim_payment (
            payment_id INT NOT NULL PRIMARY KEY,
            payment_name VARCHAR(255) NOT NULL,
            payment_status BOOLEAN NOT NULL
        );
    """,
    "dim_shipper": """
        CREATE TABLE IF NOT EXISTS dim_shipper (
            shipper_id INT NOT NULL PRIMARY KEY,
            shipper_name VARCHAR(255) NOT NULL
        );
    """,
    "dim_rating": """
        CREATE TABLE IF NOT EXISTS dim_rating (
            rating_id INT NOT NULL PRIMARY KEY,
            rating_level INT NOT NULL,
            rating_status VARCHAR(255) NOT NULL
        );
    """,
    "dim_voucher": """
        CREATE TABLE IF NOT EXISTS dim_voucher (
            voucher_id INT NOT NULL PRIMARY KEY,
            voucher_name VARCHAR(255) NOT NULL,
            voucher_price INT,
            voucher_created DATE NOT NULL,
            user_id INT NOT NULL,
            FOREIGN KEY (user_id) REFERENCES dim_user(user_id)
        );
    """,
    "fact_orders": """
        CREATE TABLE IF NOT EXISTS fact_orders (
            order_id INT NOT NULL PRIMARY KEY,
            order_date DATE NOT NULL,
            user_id INT NOT NULL,
            payment_id INT NOT NULL,
            shipper_id INT NOT NULL,
            order_price INT NOT NULL,
            order_discount INT,
            voucher_id INT,
            order_total INT NOT NULL,
            rating_id INT NOT NULL,
            FOREIGN KEY (user_id) REFERENCES dim_user(user_id),
            FOREIGN KEY (payment_id) REFERENCES dim_payment(payment_id),
            FOREIGN KEY (shipper_id) REFERENCES dim_shipper(shipper_id),
            FOREIGN KEY (voucher_id) REFERENCES dim_voucher(voucher_id),
            FOREIGN KEY (rating_id) REFERENCES dim_rating(rating_id)
        );
    """,

    "dim_product_category": """
        CREATE TABLE IF NOT EXISTS dim_product_category (
            product_category_id INT NOT NULL PRIMARY KEY,
            product_category_name VARCHAR(255) NOT NULL
        );
    """,
    "dim_product": """
        CREATE TABLE IF NOT EXISTS dim_product (
            product_id INT NOT NULL PRIMARY KEY,
            product_category_id INT NOT NULL,
            product_name VARCHAR(255) NOT NULL,
            product_created DATE NOT NULL,
            product_price INT NOT NULL,
            product_discount INT,
            FOREIGN KEY (product_category_id) REFERENCES dim_product_category(product_category_id)
        );
    """,    
    "fact_orders_items": """
        CREATE TABLE IF NOT EXISTS fact_orders_items (
            order_item_id INT NOT NULL PRIMARY KEY,
            product_id INT NOT NULL,
            order_id INT NOT NULL,
            order_item_quantity INT NOT NULL,
            product_discount INT NOT NULL,
            product_subdiscount INT NOT NULL,
            product_price INT NOT NULL,
            product_subprice INT NOT NULL,
            FOREIGN KEY (order_id) REFERENCES fact_orders(order_id),
            FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
        );
    """
}
