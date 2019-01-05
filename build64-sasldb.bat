nmake /F NTMakefile clean
set old_include=%include%
set include=%include%;\php-sdk\winlibs\cyrus-sasl\win32\include;\php-sdk\winlibs\cyrus-sasl\include
rem copy \php-sdk\win64build\lib\libsqlite3_a.lib \php-sdk\win64build\lib\libsqlite3.lib /y
nmake /F NTMakefile NTDLL=yes STATIC=no SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win64build\include\sqlite SQLITE_LIBPATH3=\php-sdk\win64build\lib DB_LIB=libdb48s.lib DB_INCLUDE=\php-sdk\win64build\include DB_LIBPATH=\php-sdk\win64build\lib OPENSSL_INCLUDE=\php-sdk\win64build\include OPENSSL_LIBPATH=\php-sdk\win64build\lib NTLM=1 SRP=0 OTP=1
rem copy \php-sdk\win64build\lib\libsqlite3_shared.lib \php-sdk\win64build\lib\libsqlite3.lib /y
set include=%old_include%
dir *.dll /s
dir *.exe /s

goto end

 Directory of C:\php-sdk\winlibs\cyrus-sasl\lib

05/01/19  10:23           103.936 libsasl.dll
               1 File(s)        103.936 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\plugins

05/01/19  10:23            14.848 saslANONYMOUS.dll
05/01/19  10:23            19.456 saslCRAMMD5.dll
05/01/19  10:23            56.320 saslDIGESTMD5.dll
05/01/19  10:23            15.872 saslLOGIN.dll
05/01/19  10:23            37.376 saslNTLM.dll
05/01/19  10:23            68.096 saslOTP.dll
05/01/19  10:23            17.408 saslPLAIN.dll
05/01/19  10:24         1.194.496 saslSASLDB.dll
05/01/19  10:23            38.912 saslSCRAM.dll
05/01/19  10:24           769.024 saslSQLITE.dll
              10 File(s)      2.231.808 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\sample

05/01/19  10:24            19.968 sample-client.exe
05/01/19  10:24            18.432 sample-server.exe
               2 File(s)         38.400 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\utils

05/01/19  10:24            17.920 pluginviewer.exe
05/01/19  10:24            12.288 sasldblistusers2.exe
05/01/19  10:24            14.848 saslpasswd2.exe
05/01/19  10:24            47.616 testsuite.exe
               4 File(s)         92.672 bytes

:end
