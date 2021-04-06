@echo off
chcp 65001
color fc
cls
rem Напишите командный файл, который принимает 
rem имена файлов в качестве параметров. Если их количество четное, 
rem создайте каталог с именем PAR, в противном случае - IMPAR. 
rem Потом файлы на чётных позициях копируются в каталог PAR, файлы 
rem на нечетных позициях - в IMPAR (в зависимости от их количества).


set /a count = 0

echo количество файлов в начале: %count%
for /r "../" %%i in (*) do (
	set /a count += 1
)

set /a even = number %% 2



echo количество файлов в этой папке: %count%

if %even% == 0 (
	if exist par (
		for /r "../" %%i in ( %~f1 ) do (
			copy par %~f1
			shift %~f1
		)
		echo exist
	) else (
		md Par
		cd Par
	)
) else (
	if exist impar (
		echo exist impar
	) else (
		md Impar
		cd impar
	)
)