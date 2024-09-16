USE Cartesian

INSERT INTO EnDict VALUES(4, 'Four')
INSERT INTO ChDict VALUES(5, N'五')
SELECT * FROM EnDict
SELECT * FROM ChDict
DELETE FROM EnDict WHERE Num = 4;
DELETE FROM ChDict WHERE Num = 5;

SELECT * FROM EnDict e LEFT JOIN ChDict c ON e.Num = c.Num
SELECT * FROM EnDict e RIGHT JOIN ChDict c ON e.Num = c.Num
SELECT * FROM EnDict e FULL JOIN ChDict c ON e.Num = c.Num

SELECT * FROM EnDict e LEFT JOIN ChDict c ON e.Num = c.Num WHERE e.Num >= 3