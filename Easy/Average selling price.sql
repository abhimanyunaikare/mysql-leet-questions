CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);

CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

-- Question: Write an SQL query to find the average selling price for each product. The average price should be rounded to 2 decimal places.

SELECT
    us.product_id,
    ROUND(SUM(p.price * us.units) / SUM(us.units), 2) AS average_price
FROM
    UnitsSold us
JOIN
    Prices p ON us.product_id = p.product_id 
            AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    us.product_id;
