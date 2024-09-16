USE Cartesian

SELECT * FROM EnDict, ChDict
SELECT * FROM EnDict CROSS JOIN ChDict
SELECT * FROM EnDict en CROSS JOIN ChDict ch WHERE en.Num = ch.Num
--Standard command
SELECT * FROM EnDict en INNER JOIN ChDict ch ON en.Num = ch.Num
SELECT * FROM EnDict en JOIN ChDict ch ON en.Num = ch.Num