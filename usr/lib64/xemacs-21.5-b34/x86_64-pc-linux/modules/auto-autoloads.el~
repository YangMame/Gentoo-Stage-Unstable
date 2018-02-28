;;; DO NOT MODIFY THIS FILE -*- coding: raw-text-unix -*-
;;;###coding system: raw-text-unix
(if (featurep 'modules-autoloads) (error "Feature modules-autoloads already loaded"))

;;;### (autoloads (ldap-open ldapp) "eldap" "ldap/eldap.c")
(when (locate-file "eldap" module-load-path module-extensions)

  (autoload 'ldapp "eldap" "\
Return t if OBJECT is a LDAP connection." nil nil)
  
  (autoload 'ldap-open "eldap" "\
Open a LDAP connection to HOST.
PLIST is a plist containing additional parameters for the connection.
Valid keys in that list are:
  `port' the TCP port to use for the connection if different from
`ldap-default-port'.
  `auth' is the authentication method to use, possible values depend on
the LDAP library XEmacs was compiled with: `simple', `krbv41' and `krbv42'.
  `binddn' is the distinguished name of the user to bind as (in RFC 1779 syntax).
  `passwd' is the password to use for simple authentication.
  `deref' is one of the symbols `never', `always', `search' or `find'.
  `timelimit' is the timeout limit for the connection in seconds.
  `sizelimit' is the maximum number of matches to return." nil nil)
  )
;;;***

;;;### (autoloads (pq-env-2-encoding pq-connect-start pq-connectdb pq-conn-defaults) "postgresql" "postgresql/postgresql.c")
(when (locate-file "postgresql" module-load-path module-extensions)

  (autoload 'pq-conn-defaults "postgresql" "\
Return a connection default structure." nil nil)
  
  (autoload 'pq-connectdb "postgresql" "\
Make a new connection to a PostgreSQL backend." nil nil)
  
  (autoload 'pq-connect-start "postgresql" "\
Make a new asynchronous connection to a PostgreSQL backend." nil nil)
  
  (autoload 'pq-env-2-encoding "postgresql" "\
Get encoding id from environment variable PGCLIENTENCODING." nil nil)
  )
;;;***

(provide 'modules-autoloads)
