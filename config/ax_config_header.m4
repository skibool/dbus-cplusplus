dnl AX_CONFIG_PRIVATE_HEADER(OUTPUT_HEADER_FILE[,LIBRARY_NAME[,INCLUDE_DEFINE]])
dnl
dnl Parameter 1: Output file for private config header (Default: config-private.h)
dnl Parameter 2: Library name
dnl Parameter 3: define for header include (Default: HAVE_capitalize(Library name)_CONFIG_H
dnl              needs to be redefined if library name containes a char that isn't allowed in #define
dnl
AC_DEFUN([AX_CONFIG_PRIVATE_HEADER],
[

if test x$# = x0; then
	dnl define a fallback output if nothing given
	CONFIG_HEADER="config-private.h"
else
	CONFIG_HEADER=$1
fi

CF_NAME=`basename $1`
DATE=`date`

dnl Create new file or empty it
echo "/* File: $CF_NAME generated on $DATE */" > $CONFIG_HEADER

if test x$# = x2; then
	echo "" >> $CONFIG_HEADER
	echo "/* Build configuration for $2  */" >> $CONFIG_HEADER
fi

echo "" >> $CONFIG_HEADER

if test x$# = x3; then
	PRIVATE_CFLAGS="-D$3"
else
	PRIVATE_CFLAGS="-DHAVE_$2_CONFIG_H"
fi

AC_SUBST(PRIVATE_CFLAGS)

])dnl

dnl AX_DEFINE_PRIVATE(DEFINE_NAME[,DEFINE_VALUE[,DEFINE_COMENT]])
dnl
dnl Parameter 1: Define name
dnl Parameter 2: Define value (optional)
dnl Parameter 3: Define coment (optional)
dnl
AC_DEFUN([AX_DEFINE_PRIVATE],
[

if test x$# = x1; then
	echo "#define $1" >> $CONFIG_HEADER
	echo "" >> $CONFIG_HEADER
elif test x$# = x2; then
	echo "#define $1 $2" >> $CONFIG_HEADER
	echo "" >> $CONFIG_HEADER
elif test x$# = x3; then
	echo "/* $3 */" >> $CONFIG_HEADER
	echo "#define $1 $2" >> $CONFIG_HEADER
	echo "" >> $CONFIG_HEADER
fi

])dnl

