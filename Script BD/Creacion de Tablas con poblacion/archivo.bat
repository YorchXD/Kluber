SETLOCAL
SET directory=.
SET mysqldir="C:\xampp\mysql\bin
SET user=root
SET pwd=
SET dbname=kluber
SET server=localhost

for %%f in (.\*.sql) do %mysqldir%\mysql" --user=%user% --password=%pwd% --host=%server% %dbname%   --default-character-set=utf8 < %%f
ENDLOCAL
PAUSE