#!INCLUDE ..\win32\common.mak

!IF "$(NTLM)" == "1"
PLUGINS_EXT=saslNTLM.dll
STATIC_PLUGIN_SRC=ntlm.c
STATIC_PLUGIN_OBJ=ntlm.obj
STATIC_PLUGIN_CFLAGS=/D "STATIC_NTLM"
!ELSE 
PLUGINS_EXT=
STATIC_PLUGIN_SRC=
STATIC_PLUGIN_OBJ=
STATIC_PLUGIN_CFLAGS=
!ENDIF 

!IF "$(GSSAPI)" == "CyberSafe"
PLUGINS_EXT=$(PLUGINS_EXT) saslGSSAPI.dll
STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) gssapi.c
STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) gssapi.obj
STATIC_PLUGIN_CFLAGS=$(STATIC_PLUGIN_CFLAGS) /D "STATIC_GSSAPIV2"
!ENDIF 

!IF "$(SRP)" == "1"
PLUGINS_EXT=$(PLUGINS_EXT) saslSRP.dll
STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) srp.c
STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) srp.obj
STATIC_PLUGIN_CFLAGS=$(STATIC_PLUGIN_CFLAGS) /D "STATIC_SRP"
!IF "$(DO_SRP_SETPASS)" == "1"
SRP_FLAGS=/DDO_SRP_SETPASS=1
!ENDIF 
!ENDIF 

!IF "$(OTP)" == "1"
PLUGINS_EXT=$(PLUGINS_EXT) saslOTP.dll
STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) otp.c otp.h
STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) otp.obj
STATIC_PLUGIN_CFLAGS=$(STATIC_PLUGIN_CFLAGS) /D "STATIC_OTP"
!ENDIF

!IF "$(LDAP)" == "1"
PLUGINS_EXT=$(PLUGINS_EXT) saslLDAPDB.dll
# STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) ldapdb.c
# STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) ldapdb.obj
# STATIC_PLUGIN_CFLAGS=$(STATIC_PLUGIN_CFLAGS) /D "STATIC_LDAPDB"
!ENDIF 

!IF "$(SQL)" == "SQLITE" || "$(SQL)" == "SQLITE3"
PLUGINS_EXT=$(PLUGINS_EXT) saslSQLITE.dll
STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) sql.c
STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) sql.obj
STATIC_PLUGIN_CFLAGS=$(STATIC_PLUGIN_CFLAGS) /D "STATIC_SQL"
!ENDIF

!IF "$(SASLDB)" == "1"
PLUGINS_EXT=$(PLUGINS_EXT) saslSASLDB.dll
STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) sasldb.c sasldb.h
STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) sasldb.obj
STATIC_PLUGIN_CFLAGS=$(STATIC_PLUGIN_CFLAGS) /D "STATIC_SASLDB"
!IF "$(DBLIB)" == "berkeley"
SASLDB_SRC=allockey.c db_berkeley.c
SASLDB_OBJ=allockey.obj db_berkeley.obj
!ELSE
DBLIB="no"
SASLDB_SRC=db_none.c
SASLDB_OBJ=db_none.obj
!ENDIF # DBLIB
STATIC_PLUGIN_SRC=$(STATIC_PLUGIN_SRC) $(SASLDB_SRC)
STATIC_PLUGIN_OBJ=$(STATIC_PLUGIN_OBJ) $(SASLDB_OBJ)
!ENDIF # SASLDB


STATIC_PLUGIN_SRC=anonymous.c \
                  plain.c \
                  cram.c \
                  digestmd5.c \
                  login.c \
                  $(STATIC_PLUGIN_SRC)

STATIC_PLUGIN_OBJ=anonymous.obj \
                  plain.obj \
                  cram.obj \
                  digestmd5.obj \
                  login.obj \
                  $(STATIC_PLUGIN_OBJ)

STATIC_PLUGIN_CFLAGS=/D "STATIC_ANONYMOUS" \
                     /D "STATIC_PLAIN" \
                     /D "STATIC_CRAMMD5" \
                     /D "STATIC_DIGESTMD5" \
                     /D "STATIC_LOGIN" \
                     $(STATIC_PLUGIN_CFLAGS)

PLUGINS=saslANONYMOUS.dll \
	saslPLAIN.dll \
	saslCRAMMD5.dll \
	saslDIGESTMD5.dll \
	saslLOGIN.dll \
	$(PLUGINS_EXT)


anonymous.c: ..\plugins\anonymous.c
	copy ..\plugins\anonymous.c .

plain.c: ..\plugins\plain.c
	copy ..\plugins\plain.c .

cram.c: ..\plugins\cram.c
	copy ..\plugins\cram.c .

digestmd5.c: ..\plugins\digestmd5.c
	copy ..\plugins\digestmd5.c .

login.c: ..\plugins\login.c
	copy ..\plugins\login.c .

ntlm.c: ..\plugins\ntlm.c
	copy ..\plugins\ntlm.c .

gssapi.c: ..\plugins\gssapi.c
	copy ..\plugins\gssapi.c .

srp.c: ..\plugins\srp.c
	copy ..\plugins\srp.c .

otp.c: ..\plugins\otp.c otp.h
	copy ..\plugins\otp.c .

otp.h: ..\plugins\otp.h
	copy ..\plugins\otp.h .

ldapdb.c: ..\plugins\ldapdb.c
	copy ..\plugins\ldapdb.c .

sql.c: ..\plugins\sql.c
	copy ..\plugins\sql.c .

sasldb.c: ..\plugins\sasldb.c ..\sasldb\sasldb.h
	copy ..\plugins\sasldb.c .

#sasldb.h: ..\sasldb\sasldb.h
#	copy ..\sasldb\sasldb.h .

getaddrinfo.c: ..\lib\getaddrinfo.c
	copy ..\lib\getaddrinfo.c .

getnameinfo.c: ..\lib\getnameinfo.c
	copy ..\lib\getnameinfo.c .

allockey.c: ..\sasldb\allockey.c
	copy ..\sasldb\allockey.c .

db_berkeley.c: ..\sasldb\db_berkeley.c
	copy ..\sasldb\db_berkeley.c .

db_none.c: ..\sasldb\db_none.c
	copy ..\sasldb\db_none.c .



#
# COMPILER FLAGS
#

!IF "$(NTLM)" == "1" || "$(SRP)" == "1" || "$(OTP)" == "1"
OPENSSL_FLAGS= /I $(OPENSSL_INCLUDE)
OPENSSL_LIBS=/libpath:$(OPENSSL_LIBPATH) libcrypto.lib libssl.lib
!ELSE 
OPENSSL_FLAGS=
OPENSSL_LIBS=
!ENDIF 

!IF "$(GSSAPI)" == "CyberSafe"
GSS_FLAGS= /I $(GSSAPI_INCLUDE) /D "HAVE_GSS_C_NT_HOSTBASED_SERVICE" /D "HAVE_GSS_C_NT_USER_NAME"
GSS_LIBS=/libpath:$(GSSAPI_LIBPATH) gssapi32.lib
!ELSE 
GSS_FLAGS=
GSS_LIBS=
!ENDIF 

!IF "$(LDAP)" == "1"
LDAP_FLAGS = /I $(LDAP_INCLUDE)
LDAP_LIBS = $(LDAP_LIB_BASE)\olber32_a.lib $(LDAP_LIB_BASE)\oldap32_a.lib ..\lib\libsasl.lib
!ENDIF

!IF "$(SQL)" == "SQLITE"
SQL_FLAGS= $(SQLITE_INCLUDES) /DHAVE_SQLITE=1
SQLITE_LIBS = /libpath:$(SQLITE_LIBPATH) libsqlite.lib
!ELSEIF "$(SQL)" == "SQLITE3"
SQL_FLAGS= /I$(SQLITE_INCLUDES3) /DHAVE_SQLITE3=1
SQLITE_LIBS = /libpath:$(SQLITE_LIBPATH3) libsqlite3.lib
!ENDIF

DIGEST_FLAGS=/D "WITH_RC4"

# LIBSASL_EXPORTS is required to export additional DB routines from sasldb
!IF "$(SASLDB)" == "1"
DB_FLAGS = /I $(DB_INCLUDE) /I "..\sasldb" /D "LIBSASL_EXPORTS" /D "KEEP_DB_OPEN" /D "SASL_DB_PATH=\"$(SASL_DB_PATH)\""
!IF "$(DBLIB)" == "berkeley"
DB_FLAGS = $(DB_FLAGS) /D "SASL_BERKELEYDB"
!ENDIF #DBLIB
DB_LIBS=/libpath:$(DB_LIBPATH) $(DB_LIB)
!ELSE
DB_FLAGS=
DB_LIBS=
!ENDIF #SASLDB

!IF $(TARGET_WIN_SYSTEM) >= 51
EXTRA_FLAGS = /D TARGET_WIN_SYSTEM=$(TARGET_WIN_SYSTEM) $(EXTRA_FLAGS)
!ENDIF

EXTRA_FLAGS=$(EXTRA_FLAGS) $(DB_FLAGS) $(OPENSSL_FLAGS) $(GSS_FLAGS) $(SRP_FLAGS) $(SQL_FLAGS) $(DIGEST_FLAGS) $(LDAP_FLAGS)
CPPFLAGS = /I "..\win32\include" /I "." /I "..\include" $(EXTRA_FLAGS) /D "WIN32" /D "_WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "_CRT_SECURE_NO_WARNINGS" /D "_SCL_SECURE_NO_WARNINGS"

STATIC_PLUGIN_EXTLIBS=$(OPENSSL_LIBS) $(GSS_LIBS) $(DB_LIBS) $(SQLITE_LIBS) $(LDAP_LIBS)
