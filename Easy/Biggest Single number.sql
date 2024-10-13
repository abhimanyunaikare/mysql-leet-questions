CREATE TABLE my_numbers (
    num INT
);

INSERT INTO my_numbers (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);

-- Question: Write a SQL query to find the largest number 
-- in the my_numbers table that appears only once.

select max(a.num) as mnum from 
(
    select num, count(*) as count from my_numbers
    group by num
    having count(num)=1
)a