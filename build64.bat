nmake /F NTMakefile clean
nmake /F NTMakefile GUARD=no NTDLL=yes STATIC=no SQL=SQLITE3 SQLITE_INCLUDES3=\php-sdk\win64build\include\sqlite SQLITE_LIBPATH3=\php-sdk\win64build\lib DB_LIB=libdb48s.lib DB_INCLUDE=\php-sdk\win64build\include DB_LIBPATH=\php-sdk\win64build\lib OPENSSL_INCLUDE=\php-sdk\win64build\include OPENSSL_LIBPATH=\php-sdk\win64build\lib NTLM=1 SRP=0 OTP=1
dir *.dll /s
