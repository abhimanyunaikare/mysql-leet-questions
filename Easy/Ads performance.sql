CREATE TABLE Ads (
    ad_id INT,
    user_id INT,
    action ENUM('Clicked', 'Viewed', 'Ignored'),
    PRIMARY KEY (ad_id, user_id)
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');

-- Write an SQL query to find the click-through rate (CTR) of each ad, rounded to 2 decimal points. The result should be ordered by ctr in descending order and by ad_id in ascending order in case of a tie. The CTR is calculated as:
-- 𝐶𝑇𝑅 =  ( Number of Clicks / (Number of Clicks + Number of Views) )  × 100


SELECT ad_id, 
    ROUND(
        (SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 ELSE 0 END)) * 100, 
    2) AS ctr
FROM Ads
WHERE action IN ('Clicked', 'Viewed')
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC;