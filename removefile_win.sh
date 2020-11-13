SET FILENAME="C:\Temp\issue.msg"

IF EXIST %FILENAME% (
    IF %forceApply%==True  (
	    del %FILENAME%
        IF EXIST %FILENAME% (
            EXIT 1
        ) ELSE (
            EXIT 0
        )
    ) ELSE (
        EXIT 1
    )
) ELSE (
    EXIT 0
)