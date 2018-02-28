/* src/config.h.  Generated from config.h.in by configure.  */
/* XEmacs site configuration template file.  -*- C -*-
   Copyright (C) 1986, 1991-1994, 1998, 1999 Free Software Foundation, Inc.
   Copyright (C) 2000, 2001, 2002, 2004, 2005, 2010 Ben Wing.

This file is part of XEmacs.

XEmacs is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs.  If not, see <http://www.gnu.org/licenses/>. */

/* Significantly divergent from FSF. */

/* No code in XEmacs #includes config.h twice, but some of the code
   intended to work with other packages as well (like gmalloc.c)
   think they can include it as many times as they like.  */
#ifndef _SRC_CONFIG_H_
#define _SRC_CONFIG_H_

/* The proper format of this file:

1. All #undef statements that are changed by configure should go together,
   BEFORE the inclusion of the s&m files, and need to be bracketed by
   #ifndef WIN32_NO_CONFIGURE.  There is currently only one exception to
   this: SYSTEM_TYPE.

2. All other code, except for the things that may be referenced in s&m
   files (there is very very little of this) need to go AFTER the inclusion
   of s&m files.

Together, this ensures that the s&m files can override configure
determinations as necessary, and we will properly notice this.
*/

/*
This file now serves both as config.h.in and simply as config.h under
Windows NT.  Under Windows NT, there is no configure script that
operates, so it is necessary for the relevant constants to be set
manually, either by the user (for user options) or in s/windowsnt.h.

Formerly, under NT there were three different places where constants
were defined -- nt/config.h, nt/xemacs.mak and s/windowsnt.h; now only
the latter two are used. (This separate config.h was a hassle because
it required constant synchronization between it and src/config.h.in.)
Since the options that are substituted by configure are written in
config.h.in with #undef, it is easy to make this file serve as
config.h under Windows NT.  Options that are set by the user are
specified in the file config.inc.samp, which is included by xemacs.mak
\(the makefile) and used to set command-line options to the
compiler.  The sorts of options that relate to the system and not to
the user and which are normally auto-determined by configure are set
in windowsnt.h.

What this means is that a little more care has to be taken in the way
things are arranged in config.h.in.  In particular:

-- Everything that is written with a #undef should be bracketed by
   #ifdef WIN32_NO_CONFIGURE, and these #ifdefs should in general be
   grouped together as much as possible.

-- Things that are not #undefs should not go inside this bracketed
   #ifdef, because these things typically set constants based on other
   constants and those latter constants may be set elsewhere under
   Windows NT.

-- Any #ifdefs that depend on constants that may be set in windowsnt.h
   need to be moved after the point at which this file is
   included. This applies for example to the error checking macros.
*/

#if defined (WIN32_NATIVE) && !defined (MINGW)
# define WIN32_NO_CONFIGURE
#endif

/* Use this to add code in a structured way to FSF-maintained source
   files so as to make it obvious where XEmacs changes are. */
#define XEMACS 1

#ifndef WIN32_NO_CONFIGURE /* Defined in xemacs.mak or s/windowsnt.h: */

/* Program name */
#define EMACS_PROGNAME "xemacs"

/* Name of the link to the program to be used with #! scripts */
#define SHEBANG_PROGNAME "xemacs-script"

/* Allow s&m files to differentiate OS versions without having
   multiple files to maintain. */
/* #undef OS_RELEASE */

/* The configuration name.  This is used as the install directory name
   for the lib-src programs. */
#define EMACS_CONFIGURATION "x86_64-pc-linux"

/* The configuration options.  This is exported to Lisp. */
#define EMACS_CONFIG_OPTIONS " '--build=x86_64-pc-linux-gnu' '--host=x86_64-pc-linux-gnu' '--mandir=/usr/share/man' '--infodir=/usr/share/info' '--datadir=/usr/share' '--sysconfdir=/etc' '--localstatedir=/var/lib' '--libdir=/usr/lib64' '--with-widgets=athena' '--with-dialogs=athena' '--with-menubars=lucid' '--with-scrollbars=lucid' '--with-athena=xaw' '--with-tiff' '--with-png' '--with-jpeg' '--without-xface' '--with-xft=no' '--with-sound=native,alsa' '--with-database=gdbm,berkdb' '--with-optimization' '--with-gif' '--with-gpm' '--without-postgresql' '--with-ldap' '--without-file-coding' '--without-pop' '--prefix=/usr' '--with-ncurses' '--with-msw=no' '--with-mail-locking=flock' '--with-site-lisp=yes' '--with-site-modules=yes' '--with-newgc' '--with-system-malloc' '--enable-option-checking=no' '--with-last-packages=/usr/lib/xemacs' 'build_alias=x86_64-pc-linux-gnu' 'host_alias=x86_64-pc-linux-gnu' 'CFLAGS=-O2 -pipe -no-pie' 'LDFLAGS=-Wl,-O1 -Wl,--as-needed' 'CPPFLAGS=' 'CXXFLAGS=-O2 -pipe -no-pie'"

/* The version info from version.sh. Used in #pragma ident in emacs.c */
#define EMACS_MAJOR_VERSION 21
#define EMACS_MINOR_VERSION 5
/* #undef EMACS_PATCH_LEVEL */
#define EMACS_BETA_VERSION 34
#define EMACS_VERSION "21.5-b34"
#define XEMACS_CODENAME "kale"
/* #undef XEMACS_EXTRA_NAME */
#define XEMACS_RELEASE_DATE "2013-06-24"

/* Make functions from IEEE Stds 1003.[123] available. */
#define _POSIX_C_SOURCE 199506L

/* Make some functions from Unix98 available. */
#define _XOPEN_SOURCE 500

/* Make "extensions" from Unix98 available. */
#define _XOPEN_SOURCE_EXTENDED 1

/* Make all functions available on AIX.  See AC_AIX. */
/* Some AIX compilers (cc) pre-define _ALL_SOURCE, some (xlc) don't. */
#ifndef _ALL_SOURCE
#define _ALL_SOURCE 1
#endif

/* Make all functions available on GNU libc systems.  See features.h. */
#define _GNU_SOURCE 1

/* Make all functions available on Solaris 2 systems. */
#define __EXTENSIONS__ 1

/* Define to the name of the typeof extension, if the compiler supports one */
#define TYPEOF __typeof__

/* Used to identify the XEmacs version in stack traces. */
#define STACK_TRACE_EYE_CATCHER xemacs_21_5_b34_x86_64_pc_linux

/* Allow the configurer to specify if she wants site-lisp. */
/* #undef INHIBIT_SITE_LISP */

/* Allow the configurer to specify if she wants site-modules. */
/* #undef INHIBIT_SITE_MODULES */

/* Undefine on systems which don't have processes */
#define HAVE_UNIX_PROCESSES 1

/* Define if you are using the GNU C Library. -- experimental. */
/* #undef DOUG_LEA_MALLOC */

/* Define if you are using libmcheck.a from the GNU C Library. */
/* #undef HAVE_LIBMCHECK */

/* Define if you are using dlmalloc from the Linux C library. */
/* #undef _NO_MALLOC_WARNING_ */

/* Use the system malloc? */
#define USE_SYSTEM_MALLOC 1

/* Use a debugging malloc? -- experimental */
/* #undef USE_DEBUG_MALLOC */

/* Use the relocating allocator for buffer space? */
/* #undef REL_ALLOC */

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at run-time.
        STACK_DIRECTION > 0 => grows toward higher addresses
        STACK_DIRECTION < 0 => grows toward lower addresses
        STACK_DIRECTION = 0 => direction of growth unknown */
/* #undef STACK_DIRECTION */

/* Is alloca() broken when part of an argument to a function call? */
/* #undef BROKEN_ALLOCA_IN_FUNCTION_CALLS */

/* Define to 1 if you have `alloca', as a function or macro. */
#define HAVE_ALLOCA 1

/* Define to 1 if you have <alloca.h> and it should be used. */
#define HAVE_ALLOCA_H 1

/* Define to 1 if using `alloca.c'. */
/* #undef C_ALLOCA */

/* Compile in TTY support? */
#define HAVE_TTY 1

/* Compile in support for MS windows? */
/* #undef HAVE_MS_WINDOWS */

/* special cygwin process handling? */
/* #undef HAVE_MSG_SELECT */

/* Compile in support for the X window system? */
#define HAVE_X_WINDOWS 1

/* Compile with support for fontconfig? */
/* #undef HAVE_FONTCONFIG */

/* Was the spelling of FcConfigGetRescanInterval corrected in this
   fontconfig version? */
/* #undef HAVE_FCCONFIGGETRESCANINTERVAL */

/* Was the spelling of FcConfigSetRescanInterval corrected in this
   fontconfig version? */
/* #undef HAVE_FCCONFIGSETRESCANINTERVAL */

/* Compile with support for Xft? */
/* #undef HAVE_XFT */
/* Per-widget stuff will go away? */
/* #undef HAVE_XFT_MENUBARS */
/* #undef HAVE_XFT_TABS */
/* #undef HAVE_XFT_GAUGES */

/* Defines for building X applications */
#ifdef HAVE_X_WINDOWS
/* The following will be defined if xmkmf thinks they are necessary */
/* #undef SVR4 */
/* #undef SYSV */
/* #undef AIXV3 */
/* #undef _POSIX_SOURCE */
/* #undef _BSD_SOURCE */
/* #undef _SVID_SOURCE */
/* #undef X_LOCALE */
/* #undef NARROWPROTO */
#endif /* HAVE_X_WINDOWS */

/* Defines for building Gtk applications */
/* #undef HAVE_GNOME */
/* #undef HAVE_GTK */
/* #undef HAVE_GDK_IMLIB_INIT */
/* #undef HAVE_GLADE_GLADE_H */
/* #undef HAVE_GLADE_H */
/* #undef LIBGLADE_XML_TXTDOMAIN */

/* XFree86 has a different prototype for this function */
#define HAVE_XREGISTERIMINSTANTIATECALLBACK 1
#define XREGISTERIMINSTANTIATECALLBACK_NONSTANDARD_PROTOTYPE 1

/* #undef THIS_IS_X11R4 */
/* #undef THIS_IS_X11R5 */
#define THIS_IS_X11R6 1

#define HAVE_XCONVERTCASE 1
#define HAVE_XTREGISTERDRAWABLE 1

#define HAVE_BALLOON_HELP 1

/* Where do we find bitmaps? */
/* #undef BITMAPDIR */

/* Define AMPERSAND_FULL_NAME if you use the convention
   that & in the full name stands for the login id. */
/* #undef AMPERSAND_FULL_NAME */

/* Some things figured out by the configure script, grouped as they are in
   configure.in. */
/* #undef HAVE_MCHECK_H */
#define HAVE_A_OUT_H 1
#define HAVE_ELF_H 1
/* #undef HAVE_CYGWIN_VERSION_H */
#define HAVE_FCNTL_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_LIBGEN_H 1
#define HAVE_LOCALE_H 1
#define HAVE_WCHAR_H 1
/* #undef HAVE_MACH_MACH_H */
#define HAVE_SYS_PARAM_H 1
/* #undef HAVE_SYS_PSTAT_H */
#define HAVE_SYS_RESOURCE_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_TIMEB_H 1
#define HAVE_SYS_TIMES_H 1
#define HAVE_SYS_UN_H 1
#define HAVE_SYS_VLIMIT_H 1
#define HAVE_ULIMIT_H 1
#define HAVE_UNISTD_H 1

#define HAVE_SYS_WAIT_H 1
/* #undef HAVE_LIBINTL_H */
#define HAVE_X11_XLOCALE_H 1

/* About __STDC__: Different compilers differ wrt __STDC__.  Sunpro C
    defines it, but its value is 0 unless we disable non-ANSI extensions.
    VC++ doesn't define it at all unless we disable non-ANSI extensions.
    But these compilers are all ANSI-compliant. So don't go testing
    __STDC__ anywhere except in code that runs only on known
    compilers. --ben

    Jamie wrote the following:

    [[ The ANSI standard says that defining __STDC__ to a non-zero value
    means that the compiler conforms to that standard.  The standard
    requires certain header files and library functions to be present.
    Therefore, if your compiler defines __STDC__ to non-0 but does not have
    ANSI headers and the ANSI library routines, then your compiler is
    buggy.  Conversely, an ANSI-conforming environment (which has both the
    ANSI headers and library routines, i.e., stdlib.h and `memmove') does
    not necessarily define the STDC_HEADERS flag.  Lucid Emacs requires an
    ANSI compiler.  Therefore, there is no need to consult the abominable
    STDC_HEADERS flag.  -- jwz ]]

    In reality, we should not be testing STDC_HEADERS at all except
    possibly in code we're purposely keeping in close sync with FSF code.
    STDC_HEADERS should be defined on *ALL* compilers.
*/

#define STDC_HEADERS 1

#define TIME_WITH_SYS_TIME 1
/* #undef WORDS_BIGENDIAN */

#define HAVE_LONG_FILE_NAMES 1

/* Use lock files to detect multiple edits of the same file? */
#define CLASH_DETECTION 1

/* Have shared library support */
#define HAVE_DLOPEN 1
#define HAVE_DLERROR 1
/* #undef HAVE__DLERROR */
/* #undef HAVE_SHL_LOAD */
/* #undef HAVE_DYLD */
/* #undef HAVE_LTDL */
/* #undef DLSYM_NEEDS_UNDERSCORE */
#define HAVE_SHLIB 1

/* #undef REALPATH_CORRECTS_CASE */
/* #undef DEFAULT_FILE_SYSTEM_IGNORE_CASE */

/* #undef HAVE_LIBINTL */
/* #undef HAVE_LIBDNET */
/* #undef HAVE_LIBRESOLV */

/* Is `sys_siglist' declared by <signal.h>? */
#define HAVE_DECL_SYS_SIGLIST 1

/* Is `struct timeval' declared by <sys/time.h>? */
#define HAVE_TIMEVAL 1


/* #undef TM_IN_SYS_TIME */
#define HAVE_TM_ZONE 1
/* #undef HAVE_TZNAME */

/* For `getloadavg' provided by system */
#define HAVE_GETLOADAVG 1
/* #undef HAVE_SYS_LOADAVG_H */
/* For implementing `getloadavg' ourselves */
/* #undef HAVE_LIBKSTAT */
/* #undef HAVE_KSTAT_H */

/* Is `h_errno' declared by <netdb.h>? */
#define HAVE_H_ERRNO 1

/* Does `localtime' cache TZ? */
/* #undef LOCALTIME_CACHE */

/* Can `gettimeofday' accept two arguments? */
/* #undef GETTIMEOFDAY_ONE_ARGUMENT */

/* Is scanf() broken? (Under certain versions of Cygwin) */
/* #undef CYGWIN_SCANF_BUG */

/* UTF-8-aware path-conversion function in Cygwin 1.7 and on */
/* #undef HAVE_CYGWIN_CONV_PATH */

/* #undef HAVE_MMAP */
#define HAVE_STRCOLL 1
#define HAVE_GETPGRP 1
#define GETPGRP_VOID 1

#define HAVE_INVERSE_HYPERBOLIC 1

/* Functions in the big list of functions checked for */
#define HAVE_CBRT 1
#define HAVE_CLOSEDIR 1
#define HAVE_DUP2 1
#define HAVE_EACCESS 1
#define HAVE_FMOD 1
#define HAVE_FPATHCONF 1
#define HAVE_FREXP 1
#define HAVE_FSYNC 1
#define HAVE_FTIME 1
#define HAVE_FTRUNCATE 1
#define HAVE_GETADDRINFO 1
#define HAVE_GETHOSTNAME 1
#define HAVE_GETNAMEINFO 1
#define HAVE_GETPAGESIZE 1
#define HAVE_GETRLIMIT 1
#define HAVE_GETTIMEOFDAY 1
#define HAVE_GETCWD 1
#define HAVE_LINK 1
#define HAVE_LOGB 1
#define HAVE_LRAND48 1
#define HAVE_MATHERR 1
#define HAVE_MKDIR 1
#define HAVE_MKTIME 1
#define HAVE_PERROR 1
#define HAVE_POLL 1
#define HAVE_RANDOM 1
#define HAVE_READLINK 1
#define HAVE_RENAME 1
/* #undef HAVE_RES_INIT */
#define HAVE_RMDIR 1
#define HAVE_SELECT 1
#define HAVE_SETITIMER 1
#define HAVE_SETPGID 1
#define HAVE_SETSID 1
#define HAVE_SIGBLOCK 1
#define HAVE_SIGHOLD 1
#define HAVE_SIGPROCMASK 1
#define HAVE_SNPRINTF 1
#define HAVE_STRERROR 1
/* #undef HAVE_STRLWR */
/* #undef HAVE_STRUPR */
#define HAVE_SYMLINK 1
#define HAVE_TZSET 1
#define HAVE_ULIMIT 1
#define HAVE_UMASK 1
#define HAVE_USLEEP 1
#define HAVE_VLIMIT 1
#define HAVE_VSNPRINTF 1
#define HAVE_WAITPID 1
#define HAVE_WCSCMP 1
#define HAVE_WCSLEN 1

/* Functions and structs checked for vdb. */
#define HAVE_MPROTECT 1
#define HAVE_SIGACTION 1
/* #undef HAVE_STRUCT_SIGINFO_SI_ADDR */
#define HAVE_SIGINFO_T_SI_ADDR 1
#define HAVE_SIGNAL 1
#define HAVE_STRUCT_SIGCONTEXT_CR2 1

#define HAVE_UTIME 1
/* #undef HAVE_UTIMES */
#define HAVE_SIGSETJMP 1

/* Many flavors of PTY support */
/* glibc's easy pty allocation function */
#define HAVE_GETPT 1
/* SGI's easy pty allocation function */
/* #undef HAVE__GETPTY */
/* BSD's easy pty allocation function */
#define HAVE_OPENPTY 1
/* Unix98 */
#define HAVE_GRANTPT 1
/* Unix98 */
#define HAVE_UNLOCKPT 1
/* Unix98 */
#define HAVE_PTSNAME 1
/* BSD */
#define HAVE_KILLPG 1
/* Posix 1 */
#define HAVE_TCGETPGRP 1
/* SysV streams */
#define HAVE_ISASTREAM 1
/* AIX */
/* #undef HAVE_SYS_PTY_H */
/* HP-UX */
/* #undef HAVE_SYS_PTYIO_H */
/* Linux, Tru64 */
#define HAVE_PTY_H 1
/* BSD openpty */
/* #undef HAVE_LIBUTIL_H */
/* NetBSD openpty */
/* #undef HAVE_UTIL_H */
/* SysV streams */
#define HAVE_STROPTS_H 1
/* SysV streams TIOCSIGNAL */
/* #undef HAVE_STRTIO_H */

#define HAVE_SOCKETS 1
/* #undef HAVE_SOCKADDR_SUN_LEN */
#define HAVE_MULTICAST 1
#define HAVE_SYSVIPC 1
#define HAVE_LOCKF 1
#define HAVE_FLOCK 1

#define SYSV_SYSTEM_DIR 1
/* #undef NONSYSTEM_DIR_LIBRARY */

#define HAVE_TERMIOS 1
/* #undef HAVE_TERMIO */
#define NO_TERMIO 1
#define SIGNALS_VIA_CHARACTERS 1

/* #undef NLIST_STRUCT */

/* Do IPv6 hostname canonicalization before IPv4 in getaddrinfo()? */
/* #undef IPV6_CANONICALIZE */

/* Compile in support for SOCKS? */
/* #undef HAVE_SOCKS */

/* Compile in support for X pixmaps via the `xpm' library? */
#define HAVE_XPM 1
/* #undef FOR_MSW */

/* Compile in support for "X faces" via the `compface' library?
   This enables graphical display of X-face headers in mail/news messages */
/* #undef HAVE_XFACE */

/* Compile in support for JPEG images */
#define HAVE_JPEG 1

/* Compile in support for TIFF images */
#define HAVE_TIFF 1

/* Compile in support for GIF images */
/* #undef HAVE_GIF */

/* Compile in support for PNG images */
#define HAVE_PNG 1

/* Compile in support for GZIP compression */
/* #undef HAVE_ZLIB */

/* Compile in support for DBM databases?  May require libgdbm or libdbm. */
#define HAVE_DBM 1
/* Full #include file path for GDBM's or platforms ndbm.h */
#define NDBM_H_FILE "gdbm/ndbm.h"
/* Can we trust the prototypes in ndbm.h?  If not, we need to declare our own */
#define TRUST_NDBM_H_PROTOTYPES 1

/* Define to 1 if the system has the type `u_int8_t'. */
#define HAVE_U_INT8_T 1
/* Define to 1 if the system has the type `u_int16_t'. */
#define HAVE_U_INT16_T 1
/* Define to 1 if the system has the type `u_int32_t'. */
#define HAVE_U_INT32_T 1
/* Define to 1 if the system has the type `u_int64_t'. */
/* #undef HAVE_U_INT64_T */

/* Compile in support for Berkeley DB style databases?  May require libdb. */
#define HAVE_BERKELEY_DB 1
/* Full #include file path for Berkeley DB's db.h */
#define DB_H_FILE "db.h"

/* Do we have either DBM or Berkeley DB database support? */
#define HAVE_DATABASE 1

/* Do we have LDAP support? */
#define HAVE_LDAP 1
/* Does the library define ldap_set_option () ? */
#define HAVE_LDAP_SET_OPTION 1
/* Does the library define ldap_get_lderrno () ? */
/* #undef HAVE_LDAP_GET_LDERRNO */
/* Does the library define ldap_result2error () ? */
#define HAVE_LDAP_RESULT2ERROR 1
/* Does the library define ldap_parse_result () ? */
#define HAVE_LDAP_PARSE_RESULT 1

/* Do we have PostgreSQL RDBMS support? */
/* #undef HAVE_POSTGRESQL */
/* #undef HAVE_POSTGRESQLV7 */
/* main PostgreSQL header file */
/* #undef LIBPQ_FE_H_FILE */

/* Do you have the Xauth library present?  This will add some extra
   functionality to gnuserv. */
#define HAVE_XAUTH 1

/* Compile in support for gpm (General Purpose Mouse)?  */
#define HAVE_GPM 1

/* Compile in support for ncurses?  */
#define HAVE_NCURSES 1
/* Full #include file paths for ncurses' curses.h and term.h. */
#define CURSES_H_FILE "curses.h"
#define TERM_H_FILE "term.h"

/* Define USE_ASSERTIONS if you want the abort() to be changed to assert().
   If the assertion fails, assert_failed() will be called.  This is
   recommended for general use because it gives more info about the crash
   than just the abort() message.  Too many people "Can't find the corefile"
   or have limit-ed core dumps out of existence. */
#define USE_ASSERTIONS 1

/* Define one or more of the following if you want lots of extra checks
   (e.g. structure validation) compiled in.  These should be turned
   on during the beta-test cycle.

   Keep macro names sorted to help with syncing this file to configure.ac.
   Don't forget the ERROR_CHECK_ALL stuff at the end of this file. */

/* Minor sanity checking of the bytecode interpreter.  Useful for
   debugging the byte compiler.  */
#define ERROR_CHECK_BYTE_CODE 1

/* Sanity-check the redisplay structures after each modification. */
#define ERROR_CHECK_DISPLAY 1

/* Check the entire extent structure of a buffer each time an extent
   change is done, and do other extent-related checks. */
#define ERROR_CHECK_EXTENTS 1

/* Attempt to catch bugs related to garbage collection (e.g. not GCPRO'ing). */
#define ERROR_CHECK_GC 1

/* Minor sanity checking of glyphs, especially subwindows and
   widgets. */
#define ERROR_CHECK_GLYPHS 1

/* Attempt to catch freeing of a non-malloc()ed block, heap corruption, etc. */
#define ERROR_CHECK_MALLOC 1

/* Define for any sanity checks on structures that are not handled by a
   more specific error-checking type. */
#define ERROR_CHECK_STRUCTURES 1

/* Turn on checks related to text -- check that text in strings and buffers
   is in a valid format before we use it, check that buffer positions are
   valid, etc. */
#define ERROR_CHECK_TEXT 1

/* Turn on checks related to types -- make sure that all X... macros are
   dereferencing the correct type, and that all XSET... macros (as much as
   possible) are setting the correct type of structure; check any other
   places that a specific type is expected. */
#define ERROR_CHECK_TYPES 1

/* Define DEBUG_XEMACS if you want extra debugging code compiled in.
   This is mainly intended for use by developers. */
#define DEBUG_XEMACS 1

/* Define MEMORY_USAGE_STATS if you want extra code compiled in to
   determine where XEmacs' memory is going. */
#define MEMORY_USAGE_STATS 1

/* Define QUANTIFY if using Quantify from Rational Software.
   This adds some additional calls to control data collection.
   It is only intended for use by the developers. */
/* #undef QUANTIFY */

/* Define PURIFY if using Purify from Rational Software.
   It is only intended for use by the developers. */
/* #undef PURIFY */

/* Define USE_VALGRIND to compile valgrind hints into the code.
   It is only intended for use by the developers. */
/* #undef USE_VALGRIND */

/* Define EXTERNAL_WIDGET to compile support for using the editor as a
   widget within another program. */
/* #undef EXTERNAL_WIDGET */

/* There are some special-case defines for gcc, g++ and lcc. */
#define USE_GCC 1
/* #undef USE_GPLUSPLUS */
/* #undef USE_LCC */

/* Compile in support for CDE (Common Desktop Environment) drag and drop?
   Requires libDtSvc, which typically must be present at runtime.  */
/* #undef HAVE_CDE */

/* Compile in generic Drag'n'Drop API */
/* #undef HAVE_DRAGNDROP */

/* Compile in support for proper handling of WM_COMMAND. */
#define HAVE_WMCOMMAND 1

/* Define this if you want Mule support (multi-byte character support).
   There may be some performance penalty, although it should be small
   if you're working with ASCII files. */
/* #undef MULE */

/* Define this if you want EOL detection of files to be on by default
   in a non-Mule Unix; otherwise, defaults will be set so that all
   files are read in as binary.  Doesn't apply to Cygwin or MinGW. */
/* #undef HAVE_DEFAULT_EOL_DETECTION */

/* Support X FontSets.  Evil, yes, but if we're going to make it go away
   by using faces in the menubar we should do so. */
/* #undef USE_XFONTSET */

/* Do we want to use X window input methods for use with Mule? (requires X11R5)
   If so, use raw Xlib or higher level Motif interface? */
/* #undef HAVE_XIM */
/* #undef XIM_XLIB */
/* #undef XIM_MOTIF */

/* Non-XIM input methods for use with Mule. */
/* #undef HAVE_CANNA */
/* #undef CANNA_NEW_WCHAR_AWARE */
/* #undef HAVE_WNN */
/* #undef WNN6 */

/* Debugging development option: Remove inessential but time consuming
   actions from happening during build.  This saves a lot of time when
   you're repeatedly compiling-running-crashing.  This (1) doesn't
   garbage-collect after loading each file during dumping, and (2)
   doesn't automatically rebuild the DOC file. (Remove it by hand to
   get it rebuilt.)
 */
/* #undef QUICK_BUILD */

/* If true, run the compiler with many files at once rather than one at a
   time.  May speed up compilation time with some compilers, particularly
   if the entire compilation happens in a single process -- the process can
   cache the results of processing include files.  This definitely helps
   with VC++ (although it doesn't use Makefile.in.in) but not with GCC,
   which runs many processes per file to compile. */
/* #undef BATCH_COMPILER_RUNS */

/* If defined, use unions instead of ints.  A few systems (DEC Alpha)
   seem to require this, probably because something with the int
   definitions isn't right with 64-bit systems.  */
/* #undef USE_UNION_TYPE */

/* If defined, use experimental pdump-based GC algorithms. */
#define USE_KKCC 1

/* If defined, use experimental incremental garbage collector and new
   allocator. */
#define NEW_GC 1

/* Virtual dirty bit implementation for incremental gc. */
#define VDB_POSIX 1
/* #undef VDB_MACH */
/* #undef VDB_WIN32 */
/* #undef VDB_FAKE */

/* Enable special GNU Make features in the Makefiles. */
/* #undef USE_GNU_MAKE */

/* Defined by AC_C_CONST in configure.in */
/* #undef const */

/* Allow the source to use standard types. Include these before the
 s&m files so that they can use them. */
/* #undef ssize_t */
/* #undef size_t */
/* #undef pid_t */
/* #undef mode_t */
/* #undef off_t */
/* #undef uid_t */
/* #undef gid_t */
/* #undef socklen_t */

/* Enhanced numeric support */
/* #undef WITH_NUMBER_TYPES */
/* #undef WITH_GMP */
/* #undef WITH_MPIR */
/* #undef WITH_MP */
/* #undef MP_PREFIX */
/* #undef HAVE_MP_MOVE */
/* #undef HAVE_MP_SET_MEMORY_FUNCTIONS */

#define SIZEOF_SHORT 2
#define SIZEOF_INT 4
#define SIZEOF_LONG 8
#define SIZEOF_LONG_LONG 8
#define SIZEOF_VOID_P 8
#define SIZEOF_DOUBLE 8
#define SIZEOF_OFF_T 8

/* Large file support */
#define HAVE_FSEEKO 1

/* some systems (Cygwin) typedef u?intptr_t in <sys/types.h>
   but the standard is <inttypes.h>
   ugliness due to last-resort conditional typedef'ing in lisp.h */
/* #undef HAVE_INTPTR_T_IN_SYS_TYPES_H */

/* Does the keyword `inline' exist?  */
/* #undef inline */

/* movemail options */
/* Should movemail use POP3 for mail access? */
/* #undef MAIL_USE_POP */
/* Should movemail use kerberos for POP authentication? */
/* #undef KERBEROS */
/* Should movemail use hesiod for getting POP server host? */
/* #undef HESIOD */
/* Determine type of mail locking. */
/* #undef MAIL_LOCK_LOCKF */
#define MAIL_LOCK_FLOCK 1
/* #undef MAIL_LOCK_DOT */
/* #undef MAIL_LOCK_LOCKING */
/* #undef MAIL_LOCK_MMDF */

#define HAVE_MKSTEMP 1

#define PREFIX_USER_DEFINED 1
/* #undef EXEC_PREFIX_USER_DEFINED */
#define MODULEDIR_USER_DEFINED 1
/* #undef SITEMODULEDIR_USER_DEFINED */
#define DOCDIR_USER_DEFINED 1
#define LISPDIR_USER_DEFINED 1
/* #undef EARLY_PACKAGE_DIRECTORIES_USER_DEFINED */
#define LATE_PACKAGE_DIRECTORIES_USER_DEFINED 1
#define LAST_PACKAGE_DIRECTORIES_USER_DEFINED 1
/* #undef PACKAGE_PATH_USER_DEFINED */
/* #undef SITELISPDIR_USER_DEFINED */
#define ARCHLIBDIR_USER_DEFINED 1
#define ETCDIR_USER_DEFINED 1
#define INFODIR_USER_DEFINED 1
/* #undef INFOPATH_USER_DEFINED */

#define PDUMP 1

/* Define DUMP_IN_EXEC to include the dump file in the executable
   file. */
/* #undef DUMP_IN_EXEC */

/* Compile in support for Sun Sparcworks/WorkShop? */
/* #undef SUNPRO */

/* Sun SparcStations, SGI machines, and HP9000s700s have built-in
   support for playing sound files. (On Suns, the sound support is
   usually found in /usr/demo/SOUND - you may need to install the
   "SUNWaudmo" package.) */
#define HAVE_NATIVE_SOUND 1

/* Native sound may be provided via soundcard.h, in various directories */
#define SOUNDCARD_H_FILE "sys/soundcard.h"

/* Compile in support for ALSA (Advanced Linux Sound Architecture) */
#define HAVE_ALSA_SOUND 1

/* Compile in support for NAS (Network Audio System)?
   NAS_NO_ERROR_JUMP means that the NAS libraries don't include some
   error handling changes. */
/* #undef HAVE_NAS_SOUND */
/* #undef NAS_NO_ERROR_JUMP */

/* Compile in support for ESD (Enlightened Sound Daemon)? */
/* #undef HAVE_ESD_SOUND */

/* Compile in support for SunPro usage-tracking code? */
/* #undef USAGE_TRACKING */

/* Compile in support for Tooltalk? */
/* #undef TOOLTALK */
/* tt_c.h might be in "Tt" or "desktop" subdirectories */
/* #undef TT_C_H_FILE */

/* Toolkits used by lwlib for various widgets... */

/* #undef LWLIB_USES_MOTIF */
#define LWLIB_USES_ATHENA 1
#define LWLIB_MENUBARS_LUCID 1
/* #undef LWLIB_MENUBARS_MOTIF */
#define LWLIB_SCROLLBARS_LUCID 1
/* #undef LWLIB_SCROLLBARS_MOTIF */
/* #undef LWLIB_SCROLLBARS_ATHENA */
/* #undef LWLIB_SCROLLBARS_ATHENA3D */
/* #undef LWLIB_DIALOGS_MOTIF */
#define LWLIB_DIALOGS_ATHENA 1
/* #undef LWLIB_DIALOGS_ATHENA3D */
#define LWLIB_TABS_LUCID 1
/* #undef LWLIB_WIDGETS_MOTIF */
#define LWLIB_WIDGETS_ATHENA 1
/* #undef HAVE_ATHENA_3D */

/* Other things that can be disabled by configure. */
#define HAVE_MENUBARS 1
#define HAVE_SCROLLBARS 1
#define HAVE_DIALOGS 1
#define HAVE_TOOLBARS 1
#define HAVE_WIDGETS 1

#endif /* WIN32_NO_CONFIGURE */

#ifdef _MSC_VER
/* Turn off tons of C4996 warnings in VC 8 about standard functions being
   "deprecated" in favor of Microsoft-specific "secure" ones (!)
   This must go *before* the inclusion of any system files. */
#define _CRT_SECURE_NO_DEPRECATE
#define _CRT_NONSTDC_NO_DEPRECATE
#endif

/* alloca twiddling.
   Because we might be #including alloca.h here, feature test macros
   such as _XOPEN_SOURCE must be defined above.

   #### This really should go below the inclusion of s&m files, like
   everything else. */

#ifndef NOT_C_CODE
#if defined (__CYGWIN__)
/* We get complaints about redefinitions if we just use the __GNUC__
   definition: stdlib.h also includes alloca.h, which defines it slightly
   differently */
#include <alloca.h>
#elif defined (__GNUC__)
#define alloca __builtin_alloca
#elif defined (WIN32_NO_CONFIGURE)
/* Defines size_t and alloca ().  */
#include <malloc.h>
#elif defined (__DECC)
#include <alloca.h>
#pragma intrinsic(alloca)
#elif defined (HAVE_ALLOCA_H)
#include <alloca.h>
#elif defined (_AIX)
/* AIX requires this before any "real" code in the translation unit.  */
#pragma alloca
#elif ! defined (alloca)
#ifdef C_ALLOCA
#define alloca xemacs_c_alloca
#else
void *alloca ();
#endif /* C_ALLOCA */
#endif /* !defined (alloca) */
#endif /* C code */

/* The configuration script may define `opsysfile' to be the name of
   the s/...h file that describes your operating system.
   The file name is chosen based on the configuration name. */

#if defined (__cplusplus) && !defined (NOT_C_CODE)
extern "C" {
#endif

#define config_opsysfile "s/linux.h"
#ifdef WIN32_NO_CONFIGURE
#include "s/windowsnt.h"
#elif defined (config_opsysfile)
#include config_opsysfile
#endif

/* Darwin uses this to set BSD appropriately. */
/* #undef USE_PARAM_H */
#ifdef USE_PARAM_H
# ifndef NOT_C_CODE
#  include <sys/param.h>
# endif
#endif

/* The configuration script may define `machfile' to be the name of
   the m/...h file that describes the machine you are using.
   The file name is chosen based on the configuration name. */

/* #undef config_machfile */
#ifdef WIN32_NO_CONFIGURE
#include "m/windowsnt.h"
#elif defined (config_machfile)
#include config_machfile
#endif

#if defined (__cplusplus) && !defined (NOT_C_CODE)
}
#endif

/* USER_FULL_NAME returns a string that is the user's full name.
   It can assume that the variable `pw' points to the password file
   entry for this user.

   At some sites, the pw_gecos field contains the user's full name.
   If neither this nor any other field contains the right thing, use
   pw_name, giving the user's login name, since that is better than
   nothing. */
#define USER_FULL_NAME pw->pw_gecos

#define XEMACS_WANTS_C_ALLOCA

/* s&m files shouldn't be required to define anything, or even to exist.
   If the s&m files don't define SYSTEM_TYPE, configure will select an
   appropriate default value. */
#ifndef SYSTEM_TYPE
/* #undef SYSTEM_TYPE */
#endif

#if defined (USE_SYSTEM_MALLOC) && !defined (SYSTEM_MALLOC)
#define SYSTEM_MALLOC
#endif

/* This enables type based information (updated during gc). The output
   is used by show-memory-usage to print memory information for each
   type. Since the new allocator does not distinguish between types
   anymore, this functionality is additionally implemented and
   consumes a lot of time.  That is why this functionality can be
   disabled; for the moment, we keep it enabled. */
#if !defined (MC_ALLOC) || 1
# define ALLOC_TYPE_STATS 1
#endif

/* Define the return type of signal handlers if the s/xxx.h file
   did not already do so. */
#define RETSIGTYPE void

#ifndef XCDECL
#define XCDECL
#endif

/* SIGTYPE is the macro we actually use. */
#ifndef SIGTYPE
#define SIGTYPE RETSIGTYPE XCDECL
#define SIGRETURN return
#endif

/* Define HAVE_WINDOW_SYSTEM if any windowing system is available. */
#if defined (HAVE_GTK) || defined (HAVE_X_WINDOWS) || defined (HAVE_MS_WINDOWS)
#define HAVE_WINDOW_SYSTEM
#endif

#if defined (HAVE_MENUBARS) || defined (HAVE_SCROLLBARS) || defined (HAVE_DIALOGS) || defined (HAVE_TOOLBARS) || defined (HAVE_WIDGETS)
#define HAVE_GUI_OBJECTS
#endif

#if defined (HAVE_MENUBARS) || defined (HAVE_DIALOGS)
#define HAVE_POPUPS
#endif

#if defined (HAVE_GTK) || defined (HAVE_X_WINDOWS)
#define HAVE_XLIKE
#endif

/* For the moment, Athena widgets and dialogs may be very unstable and not
   working well, but things under Windows work much better.  configure by
   default tries to turn Windows widgets and dialogs on, but the Athena
   ones off, so let's separate the defines. */
#if defined (HAVE_WIDGETS) && (defined (LWLIB_WIDGETS_MOTIF) || defined (LWLIB_WIDGETS_ATHENA))
#define HAVE_X_WIDGETS
#endif

#if defined (HAVE_DIALOGS) && (defined (LWLIB_DIALOGS_MOTIF) || defined (LWLIB_DIALOGS_ATHENA) || defined (LWLIB_DIALOGS_ATHENA3D))
#define HAVE_X_DIALOGS
#endif

#ifdef HAVE_X_WINDOWS
/* The following should always be defined, no matter what xmkmf thinks. */
#ifndef NeedFunctionPrototypes
#define NeedFunctionPrototypes 1
#endif
#ifndef FUNCPROTO
#define FUNCPROTO 15
#endif
#endif /* HAVE_X_WINDOWS */

#if (defined (QUANTIFY) || defined (PURIFY)) && !defined (XLIB_ILLEGAL_ACCESS)
#define XLIB_ILLEGAL_ACCESS 1
#endif

/* Define HAVE_UNIXOID_EVENT_LOOP if we use select() to wait for events. */
#if defined (HAVE_X_WINDOWS) || defined (HAVE_TTY) || defined (HAVE_MSG_SELECT)
#define HAVE_UNIXOID_EVENT_LOOP
#endif

#ifdef HAVE_CANNA
#  define CANNA_MULE
#  define CANNA_PURESIZE 0
#else  /* not CANNA */
#  define CANNA_PURESIZE 0
#endif /* not CANNA */

#if defined (HAVE_SOCKS) && !defined (DO_NOT_SOCKSIFY)
#define accept Raccept
#define bind Rbind
#define connect Rconnect
#define getsockname Rgetsockname
#define listen Rlisten
#endif /* HAVE_SOCKS && !DO_NOT_SOCKSIFY */

#ifndef BITS_PER_CHAR
#define BITS_PER_CHAR 8
#endif
#define SHORTBITS (SIZEOF_SHORT * BITS_PER_CHAR)
#define INTBITS (SIZEOF_INT * BITS_PER_CHAR)
#define LONGBITS (SIZEOF_LONG * BITS_PER_CHAR)
#define LONG_LONG_BITS (SIZEOF_LONG_LONG * BITS_PER_CHAR)
#define VOID_P_BITS (SIZEOF_VOID_P * BITS_PER_CHAR)
#define DOUBLE_BITS (SIZEOF_DOUBLE * BITS_PER_CHAR)

/* Use `INLINE_HEADER' to define inline functions in .h files.
   Use `inline static' to define inline functions in .c files.
   See the Internals manual for examples and more information. */

#if (defined ( __STDC_VERSION__) &&  __STDC_VERSION__ >= 199901L) \
  || defined (__cplusplus) || ! defined (__GNUC__) || ! defined(emacs)
# define INLINE_HEADERS_ARE_STATIC
# define INLINE_HEADER inline static
#elif defined (DONT_EXTERN_INLINE_HEADER_FUNCTIONS)
# define INLINE_HEADER inline
#else
# define INLINE_HEADER inline extern
#endif

/* Use DECLARE_INLINE_HEADER() to declare an inline function in a header
   file, like this: (This avoids the need to write a prototype directly
   followed by the function header itself, in order to avoid a
   "no prototype" warning from GCC.)

  DECLARE_INLINE_HEADER (int foo (int x))
  {
    return x * x;
  }

*/

#define DECLARE_INLINE_HEADER(header) \
  INLINE_HEADER header ; INLINE_HEADER header

#ifndef NOT_C_CODE /* Actually means C or C++ */
# if defined (__cplusplus)
#  define EXTERN_C extern "C"
# else /* C code */
#  define EXTERN_C extern
# endif
#endif /* C or C++ */

/* Strictly speaking, only int or unsigned int are valid types in a
   bitfield.  In practice, we would like to use enums as bitfields.
   The following should just result in warning avoidance:
   warning: nonportable bit-field type */
#ifdef __GNUC__
#define enum_field(enumeration_type) enum enumeration_type
#else
#define enum_field(enumeration_type) unsigned int
#endif

/* We want to avoid saving the signal mask if possible, because
   that necessitates a system call. */
#ifdef HAVE_SIGSETJMP
# define SETJMP(x) sigsetjmp (x, 0)
# define LONGJMP(x, y) siglongjmp (x, y)
# define JMP_BUF sigjmp_buf
#else
# define SETJMP(x) setjmp (x)
# define LONGJMP(x, y) longjmp (x, y)
# define JMP_BUF jmp_buf
#endif

/* For the moment, we go ahead and keep this, since it's used in mouse.el.
   #### font-lock does its own version using parse-partial-sexp.  We should
   merge the two. */
#define USE_C_FONT_LOCK

/* Keep the #defines sorted.
   #### Can this code ever be executed?  I guess if a developer #defines
   ERROR_CHECK_ALL above the #include it could be useful. */
#ifdef ERROR_CHECK_ALL
#define ERROR_CHECK_BYTE_CODE 1
#define ERROR_CHECK_DISPLAY 1
#define ERROR_CHECK_EXTENTS 1
#define ERROR_CHECK_GC 1
#define ERROR_CHECK_GLYPHS 1
#define ERROR_CHECK_MALLOC 1
#define ERROR_CHECK_STRUCTURES 1
#define ERROR_CHECK_TEXT 1
#define ERROR_CHECK_TYPES 1
#endif /* ERROR_CHECK_ALL */

/* It's very tricky.  In some circumstances, if we don't include the
   ERROR_CHECK_TYPES functions in xemacs.def.in.in, we get lots of
   undefined references from eldap.o and postgresql.o; but in other
   circumstances, if we DO include them, we get undefined references
   in xemacs-export.o to the same functions.  We try here to grok when
   we need to include them in xemacs.def.in.in.  I originally thought
   it was enough to condition on !defined (INLINE_HEADERS_ARE_STATIC) --
   if they're static, they shouldn't lead to any external references
   in the modules, right?  Wrong, under non-optimized builds.  So now
   let's try conditioning on !C++ -- by examining inline.o with nm,
   it seems it's the C++ builds where inline.o doesn't get any inline
   functions compiled into it at all, which would lead to problems if
   we reference them in xemacs.def.in.in.

   #### FIXME Should we condition on GCC and defined(emacs), like we
   do (inverted) for INLINE_HEADERS_ARE_STATIC? --ben */

/* Checking for !defined (__cplusplus) doesn't work, because we typically
   aren't using the C++ preprocessor when processing xemacs.def.in.in
   even if we're using a C++ compiler.  I suspect we only need this at
   all GCC is being used. */
#if !defined (USE_GPLUSPLUS)
/* #if !defined (INLINE_HEADERS_ARE_STATIC) */
#define XEMACS_DEFS_NEEDS_INLINE_DECLS
#endif

/* Do we need to be able to run code compiled by and written for 21.4? */
#define NEED_TO_HANDLE_21_4_CODE 1

#define SUPPORT_CONFOUNDING_FUNCTIONS NEED_TO_HANDLE_21_4_CODE

/* Large file support */
#ifdef HAVE_FSEEKO
# define OFF_T off_t
# define FSEEK(stream, offset, whence) fseeko (stream, offset, whence)
# define FTELL(stream) ftello (stream)
#else
# define OFF_T long
# define FSEEK(stream, offset, whence) fseek (stream, offset, whence)
# define FTELL(stream) ftell (stream)
#endif

#endif /* _SRC_CONFIG_H_ */
