nmake /F NTMakefile clean
del *.obj /s
del *.pdb /s
if exist c:\cmu rd c:\cmu /s /q
set old_include=%include%
set include=%include%
copy \php-sdk\win32build\lib\libsqlite3_a.lib \php-sdk\win32build\lib\libsqlite3.lib /y
nmake /F NTMakefile STATIC_PLUGIN=yes SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win32build\include SQLITE_LIBPATH3=\php-sdk\win32build\lib SASLDB=0 OPENSSL_INCLUDE=\php-sdk\win32build\include OPENSSL_LIBPATH=\php-sdk\win32build\lib NTLM=1 SRP=0 OTP=1 install
set include=%old_include%
xcopy plugins\sasl*.pdb c:\cmu\bin\sasl2\ /y
dir *.dll /s
dir *.exe /s
if exist plugins\RC* del plugins\RC*

goto end



:end
