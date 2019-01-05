nmake /F NTMakefile clean
set old_include=%include%
set include=%include%;\php-sdk\winlibs\cyrus-sasl\win32\include;\php-sdk\winlibs\cyrus-sasl\include
rem copy \php-sdk\win64build\lib\libsqlite3_a.lib \php-sdk\win64build\lib\libsqlite3.lib /y
nmake /F NTMakefile NTDLL=yes STATIC=no SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win32build\include\sqlite SQLITE_LIBPATH3=\php-sdk\win32build\lib DB_LIB=libdb48s.lib DB_INCLUDE=\php-sdk\win32build\include DB_LIBPATH=\php-sdk\win32build\lib OPENSSL_INCLUDE=\php-sdk\win32build\include OPENSSL_LIBPATH=\php-sdk\win32build\lib NTLM=1 SRP=0 OTP=1
rem copy \php-sdk\win64build\lib\libsqlite3_shared.lib \php-sdk\win64build\lib\libsqlite3.lib /y
set include=%old_include%
dir *.dll /s
dir *.exe /s

goto end

 Directory of C:\php-sdk\winlibs\cyrus-sasl\plugins

05/01/19  10:46            12.288 saslANONYMOUS.dll
05/01/19  10:46            16.384 saslCRAMMD5.dll
05/01/19  10:46            45.056 saslDIGESTMD5.dll
05/01/19  10:46            12.800 saslLOGIN.dll
05/01/19  10:46            30.208 saslNTLM.dll
05/01/19  10:46            54.272 saslOTP.dll
05/01/19  10:46            13.824 saslPLAIN.dll
05/01/19  10:47           990.208 saslSASLDB.dll
05/01/19  10:46            30.720 saslSCRAM.dll
05/01/19  10:47           619.008 saslSQLITE.dll
              10 File(s)      1.824.768 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\sample

05/01/19  10:47            16.896 sample-client.exe
05/01/19  10:47            15.360 sample-server.exe
               2 File(s)         32.256 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\utils

05/01/19  10:47            14.848 pluginviewer.exe
05/01/19  10:47            10.240 sasldblistusers2.exe
05/01/19  10:47            12.800 saslpasswd2.exe
05/01/19  10:42            41.472 testsuite.exe
               4 File(s)         79.360 bytes

:end
