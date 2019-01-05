nmake /F NTMakefile clean
set old_include=%include%
set include=%include%;\php-sdk\winlibs\cyrus-sasl\win32\include;\php-sdk\winlibs\cyrus-sasl\include
rem copy \php-sdk\win64build\lib\libsqlite3_a.lib \php-sdk\win64build\lib\libsqlite3.lib /y
nmake /F NTMakefile NTDLL=yes STATIC=no SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win64build\include SQLITE_LIBPATH3=\php-sdk\win64build\lib SASLDB=0 OPENSSL_INCLUDE=\php-sdk\win64build\include OPENSSL_LIBPATH=\php-sdk\win64build\lib NTLM=1 SRP=0 OTP=1
rem copy \php-sdk\win64build\lib\libsqlite3_shared.lib \php-sdk\win64build\lib\libsqlite3.lib /y
set include=%old_include%
dir *.dll /s
dir *.exe /s

goto end

 Directory of C:\php-sdk\winlibs\cyrus-sasl\lib

05/01/19  09:56           102.400 libsasl.dll
               1 File(s)        102.400 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\plugins

05/01/19  09:56            14.848 saslANONYMOUS.dll
05/01/19  09:56            19.456 saslCRAMMD5.dll
05/01/19  09:56            58.880 saslDIGESTMD5.dll
05/01/19  09:56            15.872 saslLOGIN.dll
05/01/19  09:56            37.888 saslNTLM.dll
05/01/19  09:57            68.096 saslOTP.dll
05/01/19  09:56            16.384 saslPLAIN.dll
05/01/19  09:56            37.376 saslSCRAM.dll
05/01/19  09:57         1.285.120 saslSQLITE.dll
               9 File(s)      1.553.920 bytes

     Total Files Listed:
              10 File(s)      1.656.320 bytes
               0 Dir(s)  46.096.859.136 bytes free

 Directory of C:\php-sdk\winlibs\cyrus-sasl\utils

05/01/19  09:50            14.848 pluginviewer.exe
05/01/19  09:57            14.848 saslpasswd2.exe
05/01/19  09:50            42.496 testsuite.exe
               3 File(s)         72.192 bytes

:end
