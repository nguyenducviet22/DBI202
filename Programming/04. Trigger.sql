USE DB_PROGRAMMING

DROP TRIGGER TR_CheckInsertionOnEvent
DROP TRIGGER TR_ForbidInsertionOnEvent
DROP TRIGGER TR_LimitInsertionOnEvent

GO
CREATE TRIGGER TR_CheckInsertionOnEvent ON Event FOR INSERT
AS
BEGIN
	PRINT 'Inserted'
END	
GO

EXEC PR_InsertEvent 'Blockchain & Game'

GO
CREATE TRIGGER TR_ForbidInsertionOnEvent ON Event FOR INSERT
AS
BEGIN
	PRINT 'Insert failed'
	ROLLBACK
END
GO

EXEC PR_InsertEvent 'High Risk High Return'

GO
CREATE TRIGGER TR_LimitInsertionOnEvent ON Event FOR INSERT
AS
BEGIN
	DECLARE @NoEvent int 
	SELECT @NoEvent = COUNT(*) FROM Event
	-- PRINT @NoEvent
	IF @NoEvent > 5
	BEGIN
		PRINT 'Excessive Events'
		SELECT * FROM INSERTED
		ROLLBACK
	END
END
GO

EXEC PR_InsertEvent 'High Risk High Return'
EXEC PR_InsertEvent 'Survive in Uni Life'
SELECT * FROM Event