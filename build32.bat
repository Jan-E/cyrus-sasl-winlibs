nmake /F NTMakefile clean
if exist c:\cmu rd c:\cmu /s /q
set old_include=%include%
set include=%include%;\php-sdk\winlibs\cyrus-sasl\win32\include;\php-sdk\winlibs\cyrus-sasl\include
copy \php-sdk\win32build\lib\libsqlite3_a.lib \php-sdk\win32build\lib\libsqlite3.lib /y
nmake /F NTMakefile NTDLL=yes STATIC=no SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win32build\include SQLITE_LIBPATH3=\php-sdk\win32build\lib SASLDB=1 DBLIB=berkeley DB_LIB=\php-sdk\win32build\lib\libdb48s.lib DB_INCLUDE=\php-sdk\win32build\include OPENSSL_INCLUDE=\php-sdk\win32build\include OPENSSL_LIBPATH=\php-sdk\win32build\lib NTLM=1 SRP=0 OTP=1 install
rem copy \php-sdk\win32build\lib\libsqlite3_shared.lib \php-sdk\win32build\lib\libsqlite3.lib /y
set include=%old_include%
dir *.dll /s
dir *.exe /s
if exist plugins\RC* del plugins\RC*

goto end
 Directory of C:\php-sdk\winlibs\cyrus-sasl\lib

05/01/19  09:18            79.360 libsasl.dll
               1 File(s)         79.360 bytes

 Directory of C:\php-sdk\winlibs\cyrus-sasl\plugins

05/01/19  09:18            11.776 saslANONYMOUS.dll
05/01/19  09:19            16.896 saslCRAMMD5.dll
05/01/19  09:19            46.080 saslDIGESTMD5.dll
05/01/19  09:19            12.800 saslLOGIN.dll
05/01/19  09:19            31.232 saslNTLM.dll
05/01/19  09:19            54.784 saslOTP.dll
05/01/19  09:18            13.312 saslPLAIN.dll
05/01/19  09:19            31.232 saslSCRAM.dll
05/01/19  09:19           988.160 saslSQLITE.dll
               9 File(s)      1.206.272 bytes

     Total Files Listed:
              10 File(s)      1.285.632 bytes
               0 Dir(s)  40.799.961.088 bytes free
:end
