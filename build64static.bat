nmake /F NTMakefile clean
if exist c:\cmu rd c:\cmu /s /q
set old_include=%include%
set include=%include%;\php-sdk\winlibs\cyrus-sasl\win32\include;\php-sdk\winlibs\cyrus-sasl\include
copy \php-sdk\win64build\lib\libsqlite3_a.lib \php-sdk\win64build\lib\libsqlite3.lib /y
nmake /F NTMakefile STATIC_PLUGIN=yes SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win64build\include SQLITE_LIBPATH3=\php-sdk\win64build\lib SASLDB=0 OPENSSL_INCLUDE=\php-sdk\win64build\include OPENSSL_LIBPATH=\php-sdk\win64build\lib NTLM=1 SRP=0 OTP=1 install
rem copy \php-sdk\win64build\lib\libsqlite3_shared.lib \php-sdk\win64build\lib\libsqlite3.lib /y
set include=%old_include%
dir *.dll /s
dir *.exe /s

goto end


:end