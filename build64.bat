nmake /F NTMakefile clean
if exist c:\cmu rd c:\cmu /s /q
set old_include=%include%
set include=%include%;\php-sdk\winlibs\cyrus-sasl\win32\include;\php-sdk\winlibs\cyrus-sasl\include
copy \php-sdk\win64build\lib\libsqlite3_a.lib \php-sdk\win64build\lib\libsqlite3.lib /y
nmake /F NTMakefile NTDLL=yes STATIC=no SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win64build\include SQLITE_LIBPATH3=\php-sdk\win64build\lib LDAP=1 LDAP_INCLUDE=\php-sdk\win64build\include\openldap LDAP_LIB_BASE=\php-sdk\win64build\lib SASLDB=0 OPENSSL_INCLUDE=\php-sdk\win64build\include OPENSSL_LIBPATH=\php-sdk\win64build\lib NTLM=1 SRP=0 OTP=1 install
rem copy \php-sdk\win64build\lib\libsqlite3_shared.lib \php-sdk\win64build\lib\libsqlite3.lib /y
set include=%old_include%
dir *.dll /s
dir *.exe /s

goto end

 Directory of C:\php-sdk\winlibs\cyrus-sasl\lib

06/01/19  15:36           102.400 libsasl.dll
               1 File(s)        102.400 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\plugins

06/01/19  15:36            14.848 saslANONYMOUS.dll
06/01/19  15:36            20.480 saslCRAMMD5.dll
06/01/19  15:36            60.416 saslDIGESTMD5.dll
06/01/19  15:36            16.384 saslLOGIN.dll
06/01/19  15:36            37.888 saslNTLM.dll
06/01/19  15:37            68.608 saslOTP.dll
06/01/19  15:36            17.408 saslPLAIN.dll
06/01/19  15:36            38.400 saslSCRAM.dll
06/01/19  15:37         1.287.680 saslSQLITE.dll
               9 File(s)      1.562.112 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\sample

06/01/19  15:38            19.968 sample-client.exe
06/01/19  15:38            18.944 sample-server.exe
               2 File(s)         38.912 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\utils

06/01/19  15:37            17.920 pluginviewer.exe
06/01/19  15:37            14.848 saslpasswd2.exe
06/01/19  15:37            49.152 testsuite.exe
               3 File(s)         81.920 bytes

:end
