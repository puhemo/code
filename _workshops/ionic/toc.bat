@echo off
 setlocal

 set source=.
 set extension=*.md
 set string="DOCTOC SKIP"

 for /f "tokens=*" %%G in ('dir "%source%\%extension%" /a:-d /b') do (
   find /c /i %string% "%%G" > NUL || (
   echo "Add TOC to %%G"
   doctoc --github --title "<h2>Table of Contents</h2>" "%%G"
  )
 )


 pause