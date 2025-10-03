
CREATE TABLE A (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

INSERT INTO A VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

CREATE TABLE B (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

INSERT INTO B VALUES
(2, 'BB', 400),
(3, 'CC', 100);


SELECT EmpID, Ename, MIN(Salary) AS Salary
FROM (
    SELECT * FROM A
    UNION ALL
    SELECT * FROM B
) AS Combined
GROUP BY EmpID, Ename
ORDER BY EmpID;
