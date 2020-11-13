SET FILENAME="C:\Temp\comvoy.cfg"

IF EXIST %FILENAME% (
    EXIT 0
) ELSE (
    IF %forceApply%==True  (
	    echo “Comvoy Config” > %FILENAME%
        IF EXIST %FILENAME% (
            EXIT 0
        ) ELSE (
            EXIT 1
        )
    ) ELSE (
        EXIT 1
    )
)