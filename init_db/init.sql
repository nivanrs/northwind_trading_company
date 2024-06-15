CREATE TABLE categories (
    categoryid SERIAL PRIMARY KEY,
    categoryname VARCHAR(255),
    description TEXT,
    picture TEXT
);
CREATE TABLE employees (
    employeeid SERIAL PRIMARY KEY,
    lastname VARCHAR(255),
    firstname VARCHAR(255),
    title VARCHAR(255),
    titleofcourtesy VARCHAR(255),
    birthdate DATE,
    hiredate DATE,
    address TEXT,
    city VARCHAR(255),
    region VARCHAR(255),
    postalcode VARCHAR(255),
    country VARCHAR(255),
    homephone VARCHAR(255),
    extension VARCHAR(255),
    photo TEXT,
    notes TEXT,
    reportsto INTEGER,
    photopath TEXT
);
CREATE TABLE suppliers (
    supplierid SERIAL PRIMARY KEY,
    companyname VARCHAR(255),
    contactname VARCHAR(255),
    contacttitle VARCHAR(255),
    address TEXT,
    city VARCHAR(255),
    region VARCHAR(255),
    postalcode VARCHAR(255),
    country VARCHAR(255),
    phone VARCHAR(255),
    fax VARCHAR(255),
    homepage TEXT
);
CREATE TABLE products (
    productid SERIAL PRIMARY KEY,
    productname VARCHAR(255),
    supplierid INTEGER REFERENCES suppliers(supplierid),
    categoryid INTEGER REFERENCES categories(categoryid),
    quantityperunit VARCHAR(255),
    unitprice DECIMAL,
    unitsinstock INTEGER,
    unitsonorder INTEGER,
    reorderlevel INTEGER,
    discontinued INTEGER
);
CREATE TABLE orders (
    orderid SERIAL PRIMARY KEY,
    customerid VARCHAR(255),
    employeeid INTEGER REFERENCES employees(employeeid),
    orderdate DATE,
    requireddate DATE,
    shippeddate DATE,
    shipvia INTEGER,
    freight DECIMAL,
    shipname VARCHAR(255),
    shipaddress TEXT,
    shipcity VARCHAR(255),
    shipregion VARCHAR(255),
    shippostalcode VARCHAR(255),
    shipcountry VARCHAR(255)
);
CREATE TABLE order_details (
    orderid INTEGER REFERENCES orders(orderid),
    productid INTEGER REFERENCES products(productid),
    unitprice DECIMAL,
    quantity INTEGER,
    discount DECIMAL,
    PRIMARY KEY (orderid, productid)
);