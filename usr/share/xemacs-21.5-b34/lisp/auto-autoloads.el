;;; DO NOT MODIFY THIS FILE -*- coding: raw-text-unix -*-
;;;###coding system: raw-text-unix
(if (featurep 'auto-autoloads) (error "Feature auto-autoloads already loaded"))

;;;### (autoloads (about-xemacs) "about" "lisp/about.el")

(autoload 'about-xemacs "about" "\
Describe the True Editor and its minions.

arguments: ()
" t nil)

;;;***

;;;### (autoloads (set-modified-alist modify-alist remove-alist set-alist del-alist put-alist vassoc) "alist" "lisp/alist.el")

(autoload 'vassoc "alist" "\
Search VALIST for a vector whose first element is equal to KEY.
See also `assoc'.

arguments: (KEY VALIST)
" nil nil)

(autoload 'put-alist "alist" "\
Modify ALIST to set VALUE to ITEM.
If there is a pair whose car is ITEM, replace its cdr by VALUE.
If there is not such pair, create new pair (ITEM . VALUE) and
return new alist whose car is the new pair and cdr is ALIST.
[tomo's ELIS like function]

arguments: (ITEM VALUE ALIST)
" nil nil)

(autoload 'del-alist "alist" "\
If there is a pair whose key is ITEM, delete it from ALIST.
[tomo's ELIS emulating function]

arguments: (ITEM ALIST)
" nil nil)

(autoload 'set-alist "alist" "\
Modify a alist indicated by SYMBOL to set VALUE to ITEM.

arguments: (SYMBOL ITEM VALUE)
" nil nil)

(autoload 'remove-alist "alist" "\
Remove ITEM from the alist indicated by SYMBOL.

arguments: (SYMBOL ITEM)
" nil nil)

(autoload 'modify-alist "alist" "\
Modify alist DEFAULT into alist MODIFIER.

arguments: (MODIFIER DEFAULT)
" nil nil)

(autoload 'set-modified-alist "alist" "\
Modify a value of a symbol SYM into alist MODIFIER.
The symbol SYM should be alist. If it is not bound,
its value regard as nil.

arguments: (SYM MODIFIER)
" nil nil)

;;;***

;;;### (autoloads (apropos-documentation apropos-value apropos apropos-command) "apropos" "lisp/apropos.el")

(fset 'command-apropos 'apropos-command)

(autoload 'apropos-command "apropos" "\
Shows commands (interactively callable functions) that match REGEXP.
With optional prefix ARG or if `apropos-do-all' is non-nil, also show
variables.

arguments: (APROPOS-REGEXP &optional DO-ALL)
" t nil)

(autoload 'apropos "apropos" "\
Show all bound symbols whose names match REGEXP.
With optional prefix ARG or if `apropos-do-all' is non-nil, also show unbound
symbols and key bindings, which is a little more time-consuming.
Returns list of symbols and documentation found.

arguments: (APROPOS-REGEXP &optional DO-ALL)
" t nil)

(autoload 'apropos-value "apropos" "\
Show all symbols whose value's printed image matches REGEXP.
With optional prefix ARG or if `apropos-do-all' is non-nil, also looks
at the function and at the names and values of properties.
Returns list of symbols and values found.

arguments: (APROPOS-REGEXP &optional DO-ALL)
" t nil)

(autoload 'apropos-documentation "apropos" "\
Show symbols whose documentation contain matches for REGEXP.
With optional prefix ARG or if `apropos-do-all' is non-nil, also use
documentation that is not stored in the documentation file and show key
bindings.
Returns list of symbols and documentation found.

arguments: (APROPOS-REGEXP &optional DO-ALL)
" t nil)

;;;***

;;;### (autoloads (batch-update-autoloads update-custom-define-files update-autoload-files batch-update-directory-custom-defines batch-update-directory-autoloads update-file-autoloads generate-custom-defines generate-file-autoloads) "autoload" "lisp/autoload.el")

(autoload 'generate-file-autoloads "autoload" "\
Insert at point an autoload section for FILE.
autoloads are generated for defuns and defmacros in FILE
marked by `generate-autoload-cookie' (which see).
If FILE is being visited in a buffer, the contents of the buffer
are used.

arguments: (FILE)
" t nil)

(autoload 'generate-custom-defines "autoload" "\
Insert at point a custom-define section for FILE.
If FILE is being visited in a buffer, the contents of the buffer
are used.

arguments: (FILE)
" t nil)

(autoload 'update-file-autoloads "autoload" "\
Update the autoloads for FILE in `generated-autoload-file'
\(which FILE might bind in its local variables).
This function is a no-op for an autoloads file (ie, a file whose name is
equal to `autoload-file-name').

arguments: (FILE)
" t nil)

(autoload 'batch-update-directory-autoloads "autoload" "\
Update the autoloads for a directory, using a specified feature prefix.
Must be used only with -batch.  The feature prefix and directory to update
are taken from the first and second elements of `command-line-args-left',
respectively, and they are then removed from `command-line-args-left'.

Runs `update-file-autoloads' on each file in the given directory.  Always
rewrites the autoloads file, even if unchanged.  Makes a feature name by
applying `autoload-make-feature-name' to the specified feature prefix.

#### The API and semantics of this function are subject to change.

arguments: ()
" nil nil)

(autoload 'batch-update-directory-custom-defines "autoload" "\
Update the custom defines for a directory, using a specified feature prefix.
Must be used only with -batch.  The feature prefix and directory to update
are taken from the first and second elements of `command-line-args-left',
respectively, and they are then removed from `command-line-args-left'.

Runs `update-file-autoloads' on each file in the given directory.  Always
rewrites the autoloads file, even if unchanged.  Makes a feature name by
applying `autoload-make-feature-name' to the specified feature prefix.

#### The API and semantics of this function are subject to change.

arguments: ()
" nil nil)

(autoload 'update-autoload-files "autoload" "\
Update all the autoload files associated with FILES-OR-DIRS.
FILES-OR-DIRS is a list of files and/or directories to be processed.

An appropriate autoload file is chosen and a feature constructed for
each element of FILES-OR-DIRS.  Fixup code testing for the autoload file's
feature and to provide the feature is added.

If optional INTO-FILE is non-`nil', it should specify a file into which
the autoloads will be placed.  Otherwise, the autoloads will be placed into
a file named `auto-autoloads.el' in the directory of each element in
FILES-OR-DIRS.

FEATURE-PREFIX should be set to an appropriate prefix which will
be concatenated with \"-autoloads\" to produce the feature name.  Otherwise
the appropriate autoload file for each file or directory (located in that
directory, or in the directory of the specified file) will be updated with
the directory's or file's autoloads and the protective forms will be added,
and the files will be saved.  Use of the default here is unreliable, and
therefore deprecated.

Note that if some of FILES-OR-DIRS are directories, recursion goes only
one level deep.

If FORCE is non-nil, always save out the autoload files even if unchanged.

arguments: (FILES-OR-DIRS FEATURE-PREFIX &optional INTO-FILE FORCE)
" nil nil)

(autoload 'update-custom-define-files "autoload" "\
Update all the custom-define files associated with FILES-OR-DIRS.
Works just like `update-file-autoloads'.

arguments: (FILES-OR-DIRS FEATURE-PREFIX &optional INTO-FILE FORCE)
" nil nil)

(autoload 'batch-update-autoloads "autoload" "\
Update the autoloads for the files or directories on the command line.
Runs `update-file-autoloads' on files and `update-directory-autoloads'
on directories.  Must be used only with -batch, and kills Emacs on completion.
Each file will be processed even if an error occurred previously.
For example, invoke `xemacs -batch -f batch-update-autoloads *.el'.
The directory to which the auto-autoloads.el file must be the first parameter
on the command line.

arguments: ()
" nil nil)

;;;***

;;;### (autoloads (batch-build-report build-report) "build-report" "lisp/build-report.el")

(autoload 'build-report "build-report" "\
Report build information including Installation and make output.

Prompts for status (usually \"Success\" or \"Failure\").  Then uses
`compose-mail' to create a mail message.  The Subject header contains
status and version information.  Point is left at the beginning of the
mail text.  Add some notes if you like, and send the report.

Looks for Installation and the make output file (`beta.err' by
default, customizable via `build-report-make-output-files') in the
build directory of the running XEmacs by default (customizable via
`build-report-make-output-dir').  The output from make is filtered
through `build-report-keep-regexp' and `build-report-delete-regexp'
before including in the message.

See also `mail-user-agent', `build-report-destination', and
`build-report-installation-file'.

arguments: (&rest ARGS)
" t nil)

(autoload 'batch-build-report "build-report" "\
Format a build report.  Save it as \"./BUILD-REPORT\".
If the file \"./BUILD-REPORT-COMMENT\" is readable, insert its contents.
Optional STATUS is a string to insert in the subject.  It defaults to
\"Success\".  (This will be made customizable.)
Optional DESTINATION is a string containing the destination mailbox.  It
defaults to \"XEmacs Build Reports <xemacs-buildreports@xemacs.org>\".
\(This will be made customizable.)
This function may be invoked as a command.

arguments: (&optional STATUS DESTINATION)
" t nil)

;;;***

;;;### (autoloads (batch-byte-recompile-directory batch-byte-recompile-directory-norecurse batch-byte-compile-one-file batch-byte-compile display-call-tree byte-compile-sexp byte-compile compile-defun byte-compile-buffer byte-compile-and-load-file byte-compile-file byte-recompile-file byte-recompile-directory byte-force-recompile) "bytecomp" "lisp/bytecomp.el")

(autoload 'byte-force-recompile "bytecomp" "\
Recompile every `.el' file in DIRECTORY that already has a `.elc' file.
Files in subdirectories of DIRECTORY are processed also.

arguments: (DIRECTORY)
" t nil)

(autoload 'byte-recompile-directory "bytecomp" "\
Recompile every `.el' file in DIRECTORY that needs recompilation.
This is if a `.elc' file exists but is older than the `.el' file.
Files in subdirectories of DIRECTORY are also processed unless
optional argument NORECURSION is non-nil.

If the `.elc' file does not exist, normally the `.el' file is *not* compiled.
But a prefix argument (optional second arg) means ask user,
for each such `.el' file, whether to compile it.  Prefix argument 0 means
don't ask and compile the file anyway.

A nonzero prefix argument also means ask about each subdirectory.

If the fourth optional argument FORCE is non-nil,
recompile every `.el' file that already has a `.elc' file.

arguments: (DIRECTORY &optional ARG NORECURSION FORCE)
" t nil)

(autoload 'byte-recompile-file "bytecomp" "\
Recompile a file of Lisp code named FILENAME if it needs recompilation.
This is if the `.elc' file exists but is older than the `.el' file.

If the `.elc' file does not exist, normally the `.el' file is *not*
compiled.  But a prefix argument (optional second arg) means ask user
whether to compile it.  Prefix argument 0 don't ask and recompile anyway.

arguments: (FILENAME &optional FORCE)
" t nil)

(autoload 'byte-compile-file "bytecomp" "\
Compile a file of Lisp code named FILENAME into a file of byte code.
The output file's name is made by appending `c' to the end of FILENAME.
With prefix arg (noninteractively: 2nd arg), load the file after compiling.

arguments: (FILENAME &optional LOAD)
" t nil)

(autoload 'byte-compile-and-load-file "bytecomp" "\
Compile a file of Lisp code named FILENAME into a file of byte code,
and then load it.  The output file's name is made by appending \"c\" to
the end of FILENAME.

arguments: (&optional FILENAME)
" t nil)

(autoload 'byte-compile-buffer "bytecomp" "\
Byte-compile and evaluate contents of BUFFER (default: the current buffer).

arguments: (&optional BUFFER)
" t nil)

(autoload 'compile-defun "bytecomp" "\
Compile and evaluate the current top-level form.
Print the result in the minibuffer.
With argument, insert value in current buffer after the form.

arguments: (&optional ARG)
" t nil)

(autoload 'byte-compile "bytecomp" "\
If FORM is a symbol, byte-compile its function definition.
If FORM is a lambda or a macro, byte-compile it as a function.

arguments: (FORM)
" nil nil)

(autoload 'byte-compile-sexp "bytecomp" "\
Compile and return SEXP.

arguments: (SEXP &optional MSG)
" nil nil)

(autoload 'display-call-tree "bytecomp" "\
Display a call graph of a specified file.
This lists which functions have been called, what functions called
them, and what functions they call.  The list includes all functions
whose definitions have been compiled in this Emacs session, as well as
all functions called by those functions.

The call graph does not include macros, inline functions, or
primitives that the byte-code interpreter knows about directly (eq,
cons, etc.).

The call tree also lists those functions which are not known to be called
\(that is, to which no calls have been compiled), and which cannot be
invoked interactively.

arguments: (&optional FILENAME)
" t nil)

(autoload 'batch-byte-compile "bytecomp" "\
Run `byte-compile-file' on the files remaining on the command line.
Use this from the command line, with `-batch';
it won't work in an interactive Emacs.
Each file is processed even if an error occurred previously.
For example, invoke \"xemacs -batch -f batch-byte-compile $emacs/ ~/*.el\".

arguments: ()
" nil nil)

(autoload 'batch-byte-compile-one-file "bytecomp" "\
Run `byte-compile-file' on a single file remaining on the command line.
Use this from the command line, with `-batch';
it won't work in an interactive Emacs.

arguments: ()
" nil nil)

(autoload 'batch-byte-recompile-directory-norecurse "bytecomp" "\
Same as `batch-byte-recompile-directory' but without recursion.

arguments: ()
" nil nil)

(autoload 'batch-byte-recompile-directory "bytecomp" "\
Runs `byte-recompile-directory' on the dirs remaining on the command line.
Must be used only with `-batch', and kills Emacs on completion.
For example, invoke `xemacs -batch -f batch-byte-recompile-directory .'.

The optional argument is passed to `byte-recompile-directory' as the
prefix argument; see the documentation there for its meaing.
In particular, passing 0 means to compile files for which no `.elc' files
exist.

arguments: (&optional ARG)
" nil nil)

;;;***

;;;### (autoloads (flet labels load-time-value declare the compiler-macroexpand define-compiler-macro ignore-file-errors ignore-errors assert check-type typep deftype cl-struct-setf-expander defstruct define-modify-macro callf2 callf letf* letf rotatef shiftf remf cl-do-pop psetf setf get-setf-method defsetf define-setf-method locally nth-value multiple-value-list multiple-value-setq multiple-value-bind lexical-let* lexical-let symbol-macrolet macrolet progv psetq do-all-symbols do-symbols dotimes dolist do* do loop return-from return block etypecase typecase ecase case eval-when destructuring-bind cl-function-arglist function* defmacro* defun* cl-compile-time-init) "cl-macs" "lisp/cl-macs.el")

(autoload 'cl-compile-time-init "cl-macs" "\


arguments: ()
" nil nil)

(autoload 'defun* "cl-macs" "\
Define NAME as a function.
Like normal `defun', except ARGLIST allows full Common Lisp conventions,
and BODY is implicitly surrounded by (block NAME ...).

\"Full Common Lisp conventions\" means that:

-- In addition to &optional and &rest, the lambda-list keywords &key,
   &allow-other-keys, and &aux are allowed.

-- The format of the arguments to &optional is expanded: As well as simple
   variables, they can be lists of the form (VAR [INITFORM [SVAR]]); when
   no argument is available for VAR, INITFORM is evaluated (or nil, if
   INITFORM is omitted) and stored as VAR's value, and SVAR is bound to t.
   If an argument is available for VAR, and INITFORM is unused, SVAR is
   bound to nil.

-- &key specifies keyword arguments.  The format of each argument is
   VAR || ( { VAR || (KEYWORD VAR) } [INITFORM [SVAR]]).  

   If VAR is specified on its own, VAR is bound within BODY to the value
   supplied by the caller for the corresponding keyword; for example, &key
   my-value means callers write :my-value RUNTIME-EXPRESSION.

   If (VAR INITFORM) is specified, INITFORM is an expression evaluated at
   runtime to determine a default value for VAR.

   If (VAR INITFORM SVAR) is specified, SVAR is variable available within
   BODY that is non-nil if VAR was explicitly specified in the calling
   expression.

   If ((KEYWORD VAR)) is specified, KEYWORD is the keyword to be used by
   callers, and VAR is the corresponding variable binding within BODY.

   In calls to NAME, values for a given keyword may be supplied multiple
   times.  The first value is the only one used.

-- &allow-other-keys means that if other keyword arguments are given that are
   not specifically list in the arg list, they are allowed, rather than an
   error being signalled.  They can be retrieved with an &rest form.

-- &aux specifies extra bindings, exactly like a `let*' enclosing the body.
   The format of each binding is VAR || (VAR [INITFORM]) -- exactly like the
   format of `let'/`let*' bindings.


arguments: (NAME ARGLIST &optional DOCSTRING &rest BODY)
" nil 'macro)

(autoload 'defmacro* "cl-macs" "\
Define NAME as a macro.
Like normal `defmacro', except ARGLIST allows full Common Lisp conventions,
and BODY is implicitly surrounded by (block NAME ...).

\"Full Common Lisp conventions\" means that:

-- The lambda-list keywords &optional, &rest, &key, &allow-other-keys, and
   &aux are allowed, as in `defun*'.

-- Three additional lambda-list keywords are allowed: &body, &whole, and
   &environment:

   &body is equivalent to &rest, but is intended to indicate that the
   following arguments are the body of some piece of code, and should be
   indented as such.

   &whole must come first; it is followed by a single variable that, at
   macro expansion time, reflects all the arguments supplied to the macro,
   as if it had been declared with a single &rest argument.

   &environment allows access to the macro environment at the time of
   expansion; it is most relevant when it's necessary to force macro expansion
   of the body of a form at the time of macro expansion of its top level.
   &environment is followed by variable name, and this variable will be bound
   to the value of the macro environment within BODY. See the ENVIRONMENT
   argument to `macroexpand'.

-- The macro arg list syntax allows for \"destructuring\" -- see also
   `destructuring-bind', which destructures exactly like `defmacro*', and
   `loop', which does a rather different way of destructuring.  Anywhere
   that a simple argument may appear, and (if following a lambda-list
   keyword) a list may not normally appear, an embedded lambda list can be
   substituted.  (The format of the embedded lambda list is exactly the
   same as for a top-level list except that &environment is not allowed.)
   When matching this lambda list against a caller-specified argument, that
   argument is treated as a list and normal lambda-list processing occurs,
   just as if the entire operation were happening at top level.
   Furthermore, any lambda list, embedded or top-level, can be dotted at its
   end, and this will cause matching with an appropriate dotted list given
   as an argument.

   See `loop' for practical examples of destructuring, but
   keep in mind that `loop' destructuring is somewhat different from macro
   destructuring in that

   (a) Macro destructuring has extra features in the various lambda-list
       keywords, allowing for special processing of a list other than just
       simple matching.
   (b) Macro destructuring is strict, in that an error is signalled if the
       actual structure does not match the expected structure.  On the
       other hand, loop destructuring is lax -- extra arguments in a list
       are ignored, not enough arguments cause the remaining parameters to
       receive a value of nil, etc.


arguments: (NAME ARGLIST &optional DOCSTRING &rest BODY)
" nil 'macro)

(autoload 'function* "cl-macs" "\
Introduce a function.
Like normal `function', except that if argument is a lambda form, its
ARGLIST allows full Common Lisp conventions.

arguments: (SYMBOL-OR-LAMBDA)
" nil 'macro)

(autoload 'cl-function-arglist "cl-macs" "\
Returns string with printed representation of arguments list.
Supports Common Lisp lambda lists.

arguments: (ARGLIST)
" nil nil)

(autoload 'destructuring-bind "cl-macs" "\
Bind the arguments in ARGS to EXPR then eval BODY.
This is similar to `let' but it does \"destructuring\", in that it matches
the structure of ARGS to the structure of EXPR and binds corresponding
arguments in ARGS to their values in EXPR.  The format of ARGS, and the
way the destructuring works, is exactly like the destructuring that occurs
in `defmacro*'; see that for more information.

An alternative means of destructuring is using the `loop' macro. `loop'
gives practical examples of destructuring.  `defmacro*' describes the
differences between loop and macro-style destructuring.

You can rewrite a call to (destructuring-bind ARGS EXPR &rest BODY) using
`loop', approximately like this:

  (loop for ARGS = EXPR
    return (progn BODY))

I say \"approximately\" because the destructuring works in a somewhat
different fashion, although for most reasonably simple constructs the
results will be the same.

arguments: (ARGS EXPR &rest BODY)
" nil 'macro)

(autoload 'eval-when "cl-macs" "\
Control when BODY is evaluated.
If `compile' is in WHEN, BODY is evaluated when compiled at top-level.
If `load' is in WHEN, BODY is evaluated when loaded after top-level compile.
If `eval' is in WHEN, BODY is evaluated when interpreted or at non-top-level.

arguments: ((&rest WHEN) &body BODY)" nil 'macro)

(autoload 'case "cl-macs" "\
Evals EXPR, chooses from CLAUSES on that value.
Each clause looks like (KEYLIST BODY...).  EXPR is evaluated and compared
against each key in each KEYLIST; the corresponding BODY is evaluated.
If no clause succeeds, case returns nil.  A single atom may be used in
place of a KEYLIST of one atom.  A KEYLIST of `t' or `otherwise' is
allowed only in the final clause, and matches if no other keys match.
Key values are compared by `eql'.

arguments: (EXPR &rest CLAUSES)
" nil 'macro)

(autoload 'ecase "cl-macs" "\
Like `case', but error if no case fits.
`otherwise'-clauses are not allowed.

arguments: (EXPR &rest CLAUSES)
" nil 'macro)

(autoload 'typecase "cl-macs" "\
Evals EXPR, chooses from CLAUSES on that value.
Each clause looks like (TYPE BODY...).  EXPR is evaluated and, if it
satisfies TYPE, the corresponding BODY is evaluated.  If no clause succeeds,
typecase returns nil.  A TYPE of `t' or `otherwise' is allowed only in the
final clause, and matches if no other keys match.

arguments: (EXPR &rest CLAUSES)
" nil 'macro)

(autoload 'etypecase "cl-macs" "\
Like `typecase', but error if no case fits.
`otherwise'-clauses are not allowed.

arguments: (EXPR &rest CLAUSES)
" nil 'macro)

(autoload 'block "cl-macs" "\
Define a lexically-scoped block named NAME.
NAME may be any symbol.  Code inside the BODY forms can call `return-from'
to jump prematurely out of the block.  This differs from `catch' and `throw'
in two respects:  First, the NAME is an unevaluated symbol rather than a
quoted symbol or other form; and second, NAME is lexically rather than
dynamically scoped:  Only references to it within BODY will work.  These
references may appear inside macro expansions and in lambda expressions, but
not inside other functions called from BODY.

arguments: (NAME &rest BODY)
" nil 'macro)

(autoload 'return "cl-macs" "\
Return from the block named nil.
This is equivalent to `(return-from nil RESULT)'.

arguments: (&optional RESULT)
" nil 'macro)

(autoload 'return-from "cl-macs" "\
Return from the block named NAME.
This jumps out to the innermost enclosing `(block NAME ...)' form,
returning RESULT from that form (or nil if RESULT is omitted).
This is compatible with Common Lisp, but note that `defun' and
`defmacro' do not create implicit blocks as they do in Common Lisp.

arguments: (NAME &optional RESULT)
" nil 'macro)

(autoload 'loop "cl-macs" "\
The Common Lisp `loop' macro.

The loop macro consists of a series of clauses, which do things like
iterate variables, set conditions for exiting the loop, accumulating values
to be returned as the return value of the loop, and executing arbitrary
blocks of code.  Each clause is processed in turn, and the loop executes its
body repeatedly until an exit condition is hit.

It's important to understand that loop clauses such as `for' and `while',
which look like loop-establishing constructs, don't actually *establish* a
loop; the looping is established by the `loop' clause itself, which will
repeatedly process its body until told to stop.  `while' merely establishes
a condition which, when true, causes the loop to finish, and `for' sets a
variable to different values on each iteration (e.g. successive elements of
a list) and sets an exit condition when there are no more values.  This
means, for example, that if two `for' clauses appear, you don't get two
nested loops, but instead two variables that are stepped in parallel, and
two exit conditions, either of which, if triggered, will cause the loop to
end.  Similarly for a loop with a `for' and a `while' clause.  For example:

\(loop
  for x in list
  while x
  do ...)

In each successive iteration, X is set to the next element of the list.  If
there are no more elements, or if any element is nil (the `while' clause),
the loop exits.  Otherwise, the block of code following `do' is executed.)

This example also shows that some clauses establish variable bindings --
essentially like a `let' binding -- and that following clauses can
reference these variables.  Furthermore, the entire loop is surrounded by a
block named nil (unless the `named' clause is given), so you can return
from the loop using the macro `return'. (The other way to exit the loop is
through the macro `loop-finish'.  The difference is that some loop clauses
establish or accumulate a value to be returned, and `loop-finish' returns
this. `return', however, can only return an explicitly-specified value.
NOTE CAREFULLY: There is a loop clause called `return' as well as a
standard Lisp macro called `return'.  Normally they work similarly; but if
you give the loop a name with `named', you will need to use the macro
`return-from'.)

Another extremely useful feature of loops is called \"destructuring\".  If,
in place of VAR, a list (possibly dotted, possibly a tree of arbitrary
complexity) is given, the value to be assigned is assumed to have a similar
structure to the list given, and variables in the list will be matched up
with corresponding elements in the structure.  For example:

\(loop
  for (x y) in '((foo 1) (bar 2) (baz 3))
  do (puthash x y some-hash-table))

will add three elements to a hash table, mapping foo -> 1, bar -> 2, and
baz -> 3.  As other examples, you can conveniently process alists using

\(loop for (x . y) in alist do ...)

and plists using

\(loop for (x y) on plist by #'cddr do ...)

Destructuring is forgiving in that mismatches in the number of elements on
either size will be handled gracefully, either by ignoring or initializing
to nil.  Destructuring is extremely powerful, and is probably the single
most useful feature of `loop'.

Other useful features of loops are iterating over hash-tables, collecting values into lists, and being able to modify lists in-place as you iterate over them.  As an example of the first two,

\(loop for x being the hash-key in table using (hash-value y)
  collect (cons x y))

converts hash-table TABLE to an alist. (What `collect' actually does is
push its value onto the end of an internal list and establish this list as
the default return value of the loop.  See below for more information.)

An example of in-place modification is

\(setq foo '(1 3 5))
\(loop for x in-ref foo do
  (setf x (* x x)))

after which foo will contain '(1 9 25).

If you don't understand how a particular loop clause works, create an
example and use `macroexpand-sexp' to expand the macro.

Valid clauses are:

\(NOTE: Keywords in lowercase; slashes separate different possibilities
for keywords, some of which are synonymous; brackets indicate optional
parts of the clause.  In all of the clauses with `being', the word `being',
the words `each' or `the', and the difference between singular and plural
keywords are all just syntactic sugar.  Stylistically, you should write
either `being each foo' or `being the foos'.)

  for VAR from/upfrom/downfrom NUM1 to/upto/downto/above/below NUM2 [by NUMSTEP]
    Step VAR across numbers.  `upfrom', `upto', and `below' explicitly
    indicate upward stepping; `downfrom', `downto', and `above' explicitly
    indicate downward stepping. (If none of these is given, the default is
    upward.) `to', `upto', and `downto' cause stepping to include NUM2 as
    the last iteration, while `above' and `below' stop just before reaching
    NUM2.  `by' can be given to indicate a stepping increment other than 1.

  for VAR in LIST [by FUNC]
    Step VAR over elements of a LIST.  FUNC specifies how to get successive
    sublists and defaults to `cdr'.

  for VAR on LIST [by FUNC]
    Step VAR over tails of a LIST.  FUNC specifies how to get successive
    sublists and defaults to `cdr'.

  for VAR in-ref LIST [by FUNC]
    Step VAR over elements of a LIST, like `for ... in', except the VAR is
    bound using `symbol-macrolet' instead of `let'.  In essence, VAR is set
    to a \"reference\" to the list element instead of the element itself;
    this us, you can destructively modify the list using `setf' on VAR, and
    any changes to the list will \"magically\" reflect themselves in
    subsequent uses of VAR.

  for VAR = INIT [then EXPR]
    Set VAR on each iteration of the loop.  If only INIT is given, use it
    on each iteration.  Otherwise, use INIT on the first iteration and EXPR
    on subsequent ones.

  for VAR across/across-ref ARRAY
    Step VAR across a sequence other than a list (string, vector, bit
    vector).  If `across-ref' is given, VAR is bound using
    `symbol-macrolet' instead of `let' -- see above.

  for VAR being each/the element/elements in/of/in-ref/of-ref SEQUENCE [using (index INDEX-VAR)]
    Step VAR across any sequence.  A variable can be specified with a
    `using' phrase to receive the index, starting at 0.  If `in-ref' or
    `of-ref' is given, VAR is bound using `symbol-macrolet' instead of
    `let' -- see above.

  for VAR being each/the hash-key/hash-keys/hash-value/hash-values in/of HASH-TABLE [using (hash-value/hash-key OTHER-VAR)]

  for VAR being each/the hash-key/hash-keys/hash-value/hash-values in/of HASH-TABLE [using (hash-value/hash-key OTHER-VAR)]
    Map VAR over a hash table.  The various keywords are synonymous except
    those that distinguish between keys and values.  The `using' phrase is
    optional and allows both key and value to be bound.

  for VAR being each/the symbol/present-symbol/external-symbol/symbols/present-symbols/external-symbols in/of OBARRAY
    Map VAR over the symbols in an obarray.  All symbol keywords are
    currently synonymous.

  for VAR being each/the extent/extents [in/of BUFFER-OR-STRING] [from POS] [to POS]
    Map VAR over the extents in a buffer or string, defaulting to the
    current buffer, the beginning and the end, respectively.

  for VAR being each/the interval/intervals [in/of BUFFER-OR-STRING] [property PROPERTY] [from POS] [to POS]
    Map VAR over the intervals without property change in a buffer or
    string, defaulting to the current buffer, the beginning and the end,
    respectively.  If PROPERTY is given, iteration occurs using
    `next-single-property-change'; otherwise, using
    `next-property-change'.

  for VAR being each/the window/windows [in/of FRAME]
    Step VAR over the windows in FRAME, defaulting to the selected frame.

  for VAR being each/the frame/frames
    Step VAR over all frames.

  for VAR being each/the buffer/buffers [by FUNC]
    Step VAR over all buffers.  This is actually equivalent to
    `for VAR in (buffer-list) [by FUNC]'.

  for VAR being each/the key-code/key-codes/key-seq/key-seqs/key-binding/key-bindings in KEYMAP [using (key-code/key-codes/key-seq/key-seqs/key-binding/key-bindings OTHER-VAR)]
    Map VAR over the entries in a keymap.  Keyword `key-seq' causes
    recursive mapping over prefix keymaps occurring in the keymap, with VAR
    getting the built-up sequence (a vector).  Otherwise, mapping does not
    occur recursively.  `key-code' and `key-seq' refer to what is bound
    (second argument of `define-key'), and `key-binding' what it's bound to
    (third argument of `define-key').

  as VAR ...
    `as' is a synonym for `for'.

  and VAR ...
    `and' clauses have the same syntax as `for' clauses except that the
    variables in the clause are bound in parallel with a preceding
    `and'/`for' clause instead of in series.

  with VAR = INIT
    Set VAR to INIT once, before doing any iterations.

  repeat NUM
    Exit the loop if more than NUM iterations have occurred.

  while COND
    Exit the loop if COND isn't true.

  until COND
    Exit the loop if COND is true.

  collect EXPR [into VAR]
    Push EXPR onto the end of a list of values -- stored either in VAR or a
    temporary variable that will be returned as the return value of the
    loop if it terminates through an exit condition or a call to
    `loop-finish'.

  append EXPR [into VAR]
    Append EXPR (a list) onto the end of a list of values, like `collect'.

  nconc EXPR [into VAR]
    Nconc EXPR (a list) onto the end of a list of values, like `collect'.

  concat EXPR [into VAR]
    Concatenate EXPR (a string) onto the end of a string of values, like
    `collect'.

  vconcat EXPR [into VAR]
    Concatenate EXPR (a vector) onto the end of a vector of values, like
    `collect'.

  bvconcat EXPR [into VAR]
    Concatenate EXPR (a bit vector) onto the end of a bit vector of values,
    like `collect'.

  sum EXPR [into VAR]
    Add EXPR to a value, like `collect'.

  count EXPR [into VAR]
    If EXPR is true, increment a value by 1, like `collect'.

  maximize EXPR [into VAR]
    IF EXPR is greater than a value, replace the value with EXPR, like
    `collect'.

  minimize EXPR [into VAR]
    IF EXPR is less than a value, replace the value with EXPR, like
    `collect'.

  always COND
    If COND is true, continue the loop and set the loop return value (the
    same value that's manipulated by `collect' and friends and is returned
    by a normal loop exit or an exit using `loop-finish') to t; otherwise,
    exit the loop and return nil.  The effect is to determine and return
    whether a condition is true \"always\" (all iterations of the loop).

  never COND
    If COND is false, continue the loop and set the loop return value (like
    `always') to t; otherwise, exit the loop and return nil.  The effect
    is to determine and return whether a condition is \"never\" true (all
    iterations of the loop).

  thereis COND
    If COND is true, exit the loop and return COND.

  if/when COND CLAUSE [and CLAUSE]... else CLAUSE [and CLAUSE...]
    If COND is true, execute the directly following clause(s); otherwise,
    execute the clauses following `else'.

  unless COND CLAUSE [and CLAUSE]... else CLAUSE [and CLAUSE...]
    If COND is false, execute the directly following clause(s); otherwise, execute the clauses following `else'.

  do EXPRS...
    Execute the expressions (any Lisp forms).

  initially EXPRS...
    Execute EXPR once, before doing any iterations, and after values have
    been set using `with'.

  finally EXPRS...
    Execute EXPR once, directly before the loop terminates.  This will not
    be executed if the loop terminates prematurely as a result of `always',
    `never', `thereis', or `return'.

  return EXPR
    Exit from the loop and return EXPR.

  finally return EXPR
    Specify the value to be returned when the loop exits. (Unlike `return',
    this doesn't cause the loop to immediately exit; it will exit whenever
    it normally would have.) This takes precedence over a return value
    specified with `collect' and friends or `always' and friends.

  named NAME
    Specify the name for block surrounding the loop, in place of nil.
    (See `block'.)


arguments: (&rest CLAUSES)
" nil 'macro)

(autoload 'do "cl-macs" "\
The Common Lisp `do' loop.
Format is: (do ((VAR INIT [STEP])...) (END-TEST [RESULT...]) BODY...)

arguments: (STEPS ENDTEST &rest BODY)
" nil 'macro)

(autoload 'do* "cl-macs" "\
The Common Lisp `do*' loop.
Format is: (do* ((VAR INIT [STEP])...) (END-TEST [RESULT...]) BODY...)

arguments: (STEPS ENDTEST &rest BODY)
" nil 'macro)

(autoload 'dolist "cl-macs" "\
Loop over a list.
Evaluate BODY with VAR bound to each `car' from LIST, in turn.
Then evaluate RESULT to get return value, default nil.

arguments: ((VAR LIST &optional RESULT) &body BODY)
" nil 'macro)

(autoload 'dotimes "cl-macs" "\
Loop a certain number of times.
Evaluate BODY with VAR bound to successive integers from 0, inclusive,
to COUNT, exclusive.  Then evaluate RESULT to get return value, default
nil.

arguments: ((VAR COUNT &optional RESULT) &body BODY)
" nil 'macro)

(autoload 'do-symbols "cl-macs" "\
Loop over all interned symbols.
Evaluate BODY with VAR bound to each interned symbol, or to each symbol
from OBARRAY.

arguments: ((VAR &optional OBARRAY RESULT) &rest BODY)
" nil 'macro)

(autoload 'do-all-symbols "cl-macs" "\


arguments: (SPEC &rest BODY)
" nil 'macro)

(autoload 'psetq "cl-macs" "\
(psetq SYM VAL SYM VAL ...): set SYMs to the values VALs in parallel.
This is like `setq', except that all VAL forms are evaluated (in order)
before assigning any symbols SYM to the corresponding values.

arguments: (&rest ARGS)
" nil 'macro)

(autoload 'progv "cl-macs" "\
Bind SYMBOLS to VALUES dynamically in BODY.
The forms SYMBOLS and VALUES are evaluated, and must evaluate to lists.
Each SYMBOL in the first list is bound to the corresponding VALUE in the
second list (or made unbound if VALUES is shorter than SYMBOLS); then the
BODY forms are executed and their result is returned.  This is much like
a `let' form, except that the list of symbols can be computed at run-time.

arguments: (SYMBOLS VALUES &rest BODY)
" nil 'macro)

(autoload 'macrolet "cl-macs" "\
Make temporary macro definitions.
This is like `flet', but for macros instead of functions.

arguments: ((&rest MACROS) &body FORM &environment ENV)
" nil 'macro)

(autoload 'symbol-macrolet "cl-macs" "\
Make temporary symbol macro definitions.
Elements in SYMBOL-MACROS look like (NAME EXPANSION).
Within the body FORMs, a reference to NAME is replaced with its EXPANSION,
and (setq NAME ...) acts like (setf EXPANSION ...).

arguments: ((&rest SYMBOL-MACROS) &body FORM &environment ENV)
" nil 'macro)

(autoload 'lexical-let "cl-macs" "\
Like `let', but lexically scoped.
The main visible difference is that lambdas inside BODY will create
lexical closures as in Common Lisp.

arguments: (BINDINGS &rest BODY &environment ENV)
" nil 'macro)

(autoload 'lexical-let* "cl-macs" "\
Like `let*', but lexically scoped.
The main visible difference is that lambdas inside BODY will create
lexical closures as in Common Lisp.

arguments: (BINDINGS &rest BODY)
" nil 'macro)

(autoload 'multiple-value-bind "cl-macs" "\
Collect and bind multiple return values.

If FORM returns multiple values, each symbol in SYMS is bound to one of
them, in order, and BODY is executed.  If FORM returns fewer multiple values
than there are SYMS, remaining SYMS are bound to nil.  If FORM does
not return multiple values, it is treated as returning one multiple value.

Returns the value given by the last element of BODY.

arguments: (SYMS FORM &rest BODY)
" nil 'macro)

(autoload 'multiple-value-setq "cl-macs" "\
Collect and set multiple values.

FORM should normally return multiple values; the first N values are stored
in the symbols in SYMS in turn.  If FORM returns fewer than N values, the
remaining symbols have their values set to nil.  FORM not returning multiple
values is treated as FORM returning one multiple value, with other elements
of SYMS initialized to nil.

Returns the first of the multiple values given by FORM.

arguments: (SYMS FORM)
" nil 'macro)

(autoload 'multiple-value-list "cl-macs" "\
Evaluate FORM and return a list of the multiple values it returned.

arguments: (FORM)
" nil 'macro)

(autoload 'nth-value "cl-macs" "\
Evaluate FORM and return the Nth multiple value it returned.

arguments: (N FORM)
" nil 'macro)

(autoload 'locally "cl-macs" "\


arguments: (&rest BODY)
" nil 'macro)

(autoload 'define-setf-method "cl-macs" "\
Define a `setf' method.
This method shows how to handle `setf's to places of the form (NAME ARGLIST...).
The argument forms are bound according to ARGLIST, as if NAME were
going to be expanded as a macro, then the BODY forms are executed and must
return a list of five elements: a temporary-variables list, a value-forms
list, a store-variables list (of length one), a store-form, and an access-
form.  See `defsetf' for a simpler way to define most setf-methods.

arguments: (NAME ARGLIST &rest BODY)
" nil 'macro)

(autoload 'defsetf "cl-macs" "\
(defsetf NAME FUNC): define a `setf' method.
This macro is an easy-to-use substitute for `define-setf-method' that works
well for simple place forms.  In the simple `defsetf' form, `setf's of
the form (setf (NAME ARGS...) VAL) are transformed to function or macro
calls of the form (FUNC ARGS... VAL).  Example: (defsetf aref aset).
Alternate form: (defsetf NAME ARGLIST (STORE) BODY...).
Here, the above `setf' call is expanded by binding the argument forms ARGS
according to ARGLIST, binding the value form VAL to STORE, then executing
BODY, which must return a Lisp form that does the necessary `setf' operation.
Actually, ARGLIST and STORE may be bound to temporary variables which are
introduced automatically to preserve proper execution order of the arguments.
Example: (defsetf nth (n x) (v) (list 'setcar (list 'nthcdr n x) v)).

arguments: (FUNC ARG1 &rest ARGS)
" nil 'macro)

(autoload 'get-setf-method "cl-macs" "\
Return a list of five values describing the setf-method for PLACE.
PLACE may be any Lisp form which can appear as the PLACE argument to
a macro like `setf' or `incf'.

arguments: (PLACE &optional ENV)
" nil nil)

(autoload 'setf "cl-macs" "\
(setf PLACE VAL PLACE VAL ...): set each PLACE to the value of its VAL.
This is a generalized version of `setq'; the PLACEs may be symbolic
references such as (car x) or (aref x i), as well as plain symbols.
For example, (setf (cadar x) y) is equivalent to (setcar (cdar x) y).
The return value is the last VAL in the list.

arguments: (&rest ARGS)
" nil 'macro)

(autoload 'psetf "cl-macs" "\
(psetf PLACE VAL PLACE VAL ...): set PLACEs to the values VALs in parallel.
This is like `setf', except that all VAL forms are evaluated (in order)
before assigning any PLACEs to the corresponding values.

arguments: (&rest ARGS)
" nil 'macro)

(autoload 'cl-do-pop "cl-macs" "\


arguments: (PLACE)
" nil nil)

(autoload 'remf "cl-macs" "\
Remove TAG from property list PLACE.
PLACE may be a symbol, or any generalized variable allowed by `setf'.
The form returns true if TAG was found and removed, nil otherwise.

arguments: (PLACE TAG)
" nil 'macro)

(autoload 'shiftf "cl-macs" "\
(shiftf PLACE PLACE... VAL): shift left among PLACEs.
Example: (shiftf A B C) sets A to B, B to C, and returns the old A.
Each PLACE may be a symbol, or any generalized variable allowed by `setf'.

arguments: (PLACE &rest ARGS)
" nil 'macro)

(autoload 'rotatef "cl-macs" "\
Rotate left among PLACES.
Example: (rotatef A B C) sets A to B, B to C, and C to A.  It returns nil.
Each PLACE may be a symbol, or any generalized variable allowed by `setf'.

arguments: (&rest PLACES)
" nil 'macro)

(autoload 'letf "cl-macs" "\
Temporarily bind to PLACEs.
This is the analogue of `let', but with generalized variables (in the
sense of `setf') for the PLACEs.  Each PLACE is set to the corresponding
VALUE, then the BODY forms are executed.  On exit, either normally or
because of a `throw' or error, the PLACEs are set back to their original
values.  Note that this macro is *not* available in Common Lisp.
As a special case, if `(PLACE)' is used instead of `(PLACE VALUE)',
the PLACE is not modified before executing BODY.

arguments: (((PLACE VALUE) &rest BINDINGS) &body BODY)" nil 'macro)

(autoload 'letf* "cl-macs" "\
Temporarily bind to PLACES.
This is the analogue of `let*', but with generalized variables (in the
sense of `setf') for the PLACEs.  Each PLACE is set to the corresponding
VALUE, then the BODY forms are executed.  On exit, either normally or
because of a `throw' or error, the PLACEs are set back to their original
values.  Note that this macro is *not* available in Common Lisp.
As a special case, if `(PLACE)' is used instead of `(PLACE VALUE)',
the PLACE is not modified before executing BODY.

arguments: (((PLACE VALUE) &rest BINDINGS) &body BODY)" nil 'macro)

(autoload 'callf "cl-macs" "\
Set PLACE to (FUNC PLACE ARGS...).
FUNC should be an unquoted function name.  PLACE may be a symbol,
or any generalized variable allowed by `setf'.

arguments: (FUNC PLACE &rest ARGS)
" nil 'macro)

(autoload 'callf2 "cl-macs" "\
Set PLACE to (FUNC ARG1 PLACE ARGS...).
Like `callf', but PLACE is the second argument of FUNC, not the first.

arguments: (FUNC ARG1 PLACE &rest ARGS)
" nil 'macro)

(autoload 'define-modify-macro "cl-macs" "\
Define a `setf'-like modify macro.
If NAME is called, it combines its PLACE argument with the other arguments
from ARGLIST using FUNC: (define-modify-macro incf (&optional (n 1)) +)

arguments: (NAME ARGLIST FUNC &optional DOC)
" nil 'macro)

(autoload 'defstruct "cl-macs" "\
(defstruct (NAME OPTIONS...) (SLOT SLOT-OPTS...)...): define a struct type.
This macro defines a new Lisp data type called NAME, which contains data
stored in SLOTs.  This defines a `make-NAME' constructor, a `copy-NAME'
copier, a `NAME-p' predicate, and setf-able `NAME-SLOT' accessors.

arguments: (STRUCT &rest DESCS)
" nil 'macro)

(autoload 'cl-struct-setf-expander "cl-macs" "\


arguments: (X NAME ACCESSOR PRED-FORM POS)
" nil nil)

(autoload 'deftype "cl-macs" "\
Define NAME as a new data type.
The type name can then be used in `typecase', `check-type', etc.

arguments: (NAME ARGLIST &rest BODY)
" nil 'macro)

(autoload 'typep "cl-macs" "\
Check that OBJECT is of type TYPE.
TYPE is a Common Lisp-style type specifier.

arguments: (OBJECT TYPE)
" nil nil)

(autoload 'check-type "cl-macs" "\
Verify that PLACE is of type TYPE; signal a continuable error if not.
STRING is an optional description of the desired type.

arguments: (PLACE TYPE &optional STRING)
" nil 'macro)

(autoload 'assert "cl-macs" "\
Verify that FORM returns non-nil; signal an error if not.
Second arg SHOW-ARGS means to include arguments of FORM in message.
Other args STRING and ARGS... are arguments to be passed to `error'.
They are not evaluated unless the assertion fails.  If STRING is
omitted, a default message listing FORM itself is used.

arguments: (FORM &optional SHOW-ARGS STRING &rest ARGS)
" nil 'macro)

(autoload 'ignore-errors "cl-macs" "\
Execute BODY; if an error occurs, return nil.
Otherwise, return result of last form in BODY.

arguments: (&rest BODY)
" nil 'macro)

(autoload 'ignore-file-errors "cl-macs" "\
Execute FORMS; if an error of type `file-error' occurs, return nil.
Otherwise, return result of last FORM.

arguments: (&rest BODY)
" nil 'macro)

(autoload 'define-compiler-macro "cl-macs" "\
Define a compiler-only macro.
This is like `defmacro', but macro expansion occurs only if the call to
FUNC is compiled (i.e., not interpreted).  Compiler macros should be used
for optimizing the way calls to FUNC are compiled; the form returned by
BODY should do the same thing as a call to the normal function called
FUNC, though possibly more efficiently.  Note that, like regular macros,
compiler macros are expanded repeatedly until no further expansions are
possible.  Unlike regular macros, BODY can decide to \"punt\" and leave the
original function call alone by declaring an initial `&whole foo' parameter
and then returning foo.

arguments: (FUNC ARGS &rest BODY)
" nil 'macro)

(autoload 'compiler-macroexpand "cl-macs" "\


arguments: (FORM)
" nil nil)

(autoload 'the "cl-macs" "\
Assert that FORM gives a result of type TYPE, and return that result.

TYPE is a Common Lisp type specifier.

If macro expansion of a `the' form happens during byte compilation, and the
byte compiler customization variable `byte-compile-delete-errors' is
non-nil, `the' is equivalent to FORM without any type checks.

arguments: (TYPE FORM)
" nil 'macro)

(autoload 'declare "cl-macs" "\


arguments: (&rest SPECS)
" nil 'macro)

(autoload 'load-time-value "cl-macs" "\
Evaluate FORM once at load time if byte-compiled.

The result of FORM is returned and stored for later access.  In
interpreted code, `load-time-value' is equivalent to `progn'.

arguments: (FORM &optional READ-ONLY)
" nil 'macro)

(autoload 'labels "cl-macs" "\
Make temporary function bindings.

This is like `flet', except the bindings are lexical instead of dynamic.
Unlike `flet', this macro is compliant with the Common Lisp standard with
regard to the scope and extent of the function bindings.

Each function may be called from within FORM, from within the BODY of the
function itself (that is, recursively), and from any other function bodies
in FUNCTIONS.

Within FORM, to access the function definition of a bound function (for
example, to pass it as a FUNCTION argument to `map'), quote its symbol name
using `function'.

arguments: (((FUNCTION ARGLIST &body BODY) &rest FUNCTIONS) &body FORM)
" nil 'macro)

(autoload 'flet "cl-macs" "\
Make temporary function definitions.

This is an analogue of `let' that operates on the function cell of FUNC
rather than its value cell.  The FORMs are evaluated with the specified
function definitions in place, then the definitions are undone (the FUNCs go
back to their previous definitions, or lack thereof).  This is in
contravention of Common Lisp, where `flet' makes a lexical, not a dynamic,
function binding.

Normally you should use `labels', not `flet'; `labels' does not have the
problems caused by dynamic scope, is less expensive when byte-compiled, and
allows lexical shadowing of functions with byte-codes and byte-compile
methods, where `flet' will fail.  The byte-compiler will warn when this
happens.

If you need to shadow some existing function at run time, and that function
has no associated byte code or compiler macro, then `flet' is appropriate.

arguments: (((FUNCTION ARGLIST &body BODY) &rest FUNCTIONS) &body FORM)" nil 'macro)

;;;***

;;;### (autoloads (config-value config-value-hash-table) "config" "lisp/config.el")

(autoload 'config-value-hash-table "config" "\
Return hash table of configuration parameters and their values.

arguments: ()
" nil nil)

(autoload 'config-value "config" "\
Return the value of the configuration parameter CONFIG_SYMBOL.

arguments: (CONFIG-SYMBOL)
" nil nil)

;;;***

;;;### (autoloads (Custom-make-dependencies) "cus-dep" "lisp/cus-dep.el")

(autoload 'Custom-make-dependencies "cus-dep" "\
Extract custom dependencies from .el files in SUBDIRS.
SUBDIRS is a list of directories.  If it is nil, the command-line
arguments are used.  If it is a string, only that directory is
processed.  This function is especially useful in batch mode.

Batch usage: xemacs -batch -l cus-dep.el -f Custom-make-dependencies DIRS

arguments: (&optional SUBDIRS)
" t nil)

;;;***

;;;### (autoloads (custom-migrate-custom-file customize-menu-create custom-menu-create custom-save-all customize-save-customized customize-browse custom-buffer-create-other-window custom-buffer-create customize-apropos-groups customize-apropos-faces customize-apropos-options customize-apropos customize-saved customize-customized customize-face-other-window customize-face customize-option-other-window customize-changed-options customize-variable customize-other-window customize customize-save-variable customize-set-variable customize-set-value) "cus-edit" "lisp/cus-edit.el")

(autoload 'customize-set-value "cus-edit" "\
Set VARIABLE to VALUE.  VALUE is a Lisp object.

If VARIABLE has a `variable-interactive' property, that is used as if
it were the arg to `interactive' (which see) to interactively read the value.

If VARIABLE has a `custom-type' property, it must be a widget and the
`:prompt-value' property of that widget will be used for reading the value.

If given a prefix (or a COMMENT argument), also prompt for a comment.

arguments: (VAR VAL &optional COMMENT)
" t nil)

(autoload 'customize-set-variable "cus-edit" "\
Set the default for VARIABLE to VALUE.  VALUE is any Lisp object.

If VARIABLE has a `custom-set' property, that is used for setting
VARIABLE, otherwise `set-default' is used.

The `customized-value' property of the VARIABLE will be set to a list
with a quoted VALUE as its sole list member.

If VARIABLE has a `variable-interactive' property, that is used as if
it were the arg to `interactive' (which see) to interactively read the value.

If VARIABLE has a `custom-type' property, it must be a widget and the
`:prompt-value' property of that widget will be used for reading the value.

If given a prefix (or a COMMENT argument), also prompt for a comment.

arguments: (VARIABLE VALUE &optional COMMENT)
" t nil)

(autoload 'customize-save-variable "cus-edit" "\
Set the default for VARIABLE to VALUE, and save it for future sessions.
If VARIABLE has a `custom-set' property, that is used for setting
VARIABLE, otherwise `set-default' is used.

The `customized-value' property of the VARIABLE will be set to a list
with a quoted VALUE as its sole list member.

If VARIABLE has a `variable-interactive' property, that is used as if
it were the arg to `interactive' (which see) to interactively read the value.

If VARIABLE has a `custom-type' property, it must be a widget and the
`:prompt-value' property of that widget will be used for reading the value.

If given a prefix (or a COMMENT argument), also prompt for a comment.

arguments: (VARIABLE VALUE &optional COMMENT)
" t nil)

(autoload 'customize "cus-edit" "\
Select a customization buffer which you can use to set user options.
User options are structured into \"groups\".
The default group is `Emacs'.

arguments: (GROUP)
" t nil)

(defalias 'customize-group 'customize)

(autoload 'customize-other-window "cus-edit" "\
Customize SYMBOL, which must be a customization group.

arguments: (SYMBOL)
" t nil)

(defalias 'customize-group-other-window 'customize-other-window)

(defalias 'customize-option 'customize-variable)

(autoload 'customize-variable "cus-edit" "\
Customize SYMBOL, which must be a user option variable.

arguments: (SYMBOL)
" t nil)

(autoload 'customize-changed-options "cus-edit" "\
Customize all user option variables whose default values changed recently.
This means, in other words, variables defined with a `:version' keyword.

arguments: (SINCE-VERSION)
" t nil)

(defalias 'customize-variable-other-window 'customize-option-other-window)

(autoload 'customize-option-other-window "cus-edit" "\
Customize SYMBOL, which must be a user option variable.
Show the buffer in another window, but don't select it.

arguments: (SYMBOL)
" t nil)

(autoload 'customize-face "cus-edit" "\
Open a customization buffer for FACE.
FACE should be either:
- nil, meaning to customize all faces,
- a list of symbols naming faces, meaning to customize only those,
- a symbol naming a face, meaning to customize this face only.

When called interactively, use a prefix (the AT-POINT argument) to
make a choice among the faces found at current position.

arguments: (&optional FACE AT-POINT)
" t nil)

(autoload 'customize-face-other-window "cus-edit" "\
Like `customize-face', but use another window.

arguments: (&optional FACE AT-POINT)
" t nil)

(autoload 'customize-customized "cus-edit" "\
Customize all user options set since the last save in this session.

arguments: ()
" t nil)

(autoload 'customize-saved "cus-edit" "\
Customize all already saved user options.

arguments: ()
" t nil)

(defalias 'apropos-customize 'customize-apropos)

(autoload 'customize-apropos "cus-edit" "\
Customize all user options matching REGEXP.
If ALL is `options', include only options.
If ALL is `faces', include only faces.
If ALL is `groups', include only groups.
If ALL is t (interactively, with prefix arg), include options which are not
user-settable, as well as faces and groups.

arguments: (REGEXP &optional ALL)
" t nil)

(autoload 'customize-apropos-options "cus-edit" "\
Customize all user options matching REGEXP.
With prefix arg, include options which are not user-settable.

arguments: (REGEXP &optional ARG)
" t nil)

(autoload 'customize-apropos-faces "cus-edit" "\
Customize all user faces matching REGEXP.

arguments: (REGEXP)
" t nil)

(autoload 'customize-apropos-groups "cus-edit" "\
Customize all user groups matching REGEXP.

arguments: (REGEXP)
" t nil)

(autoload 'custom-buffer-create "cus-edit" "\
Create a buffer containing OPTIONS.
Optional NAME is the name of the buffer.
OPTIONS should be an alist of the form ((SYMBOL WIDGET)...), where
SYMBOL is a customization option, and WIDGET is a widget for editing
that option.

arguments: (OPTIONS &optional NAME DESCRIPTION)
" nil nil)

(autoload 'custom-buffer-create-other-window "cus-edit" "\
Create a buffer containing OPTIONS.
Optional NAME is the name of the buffer.
OPTIONS should be an alist of the form ((SYMBOL WIDGET)...), where
SYMBOL is a customization option, and WIDGET is a widget for editing
that option.

arguments: (OPTIONS &optional NAME DESCRIPTION)
" nil nil)

(autoload 'customize-browse "cus-edit" "\
Create a tree browser for the customize hierarchy.

arguments: (&optional GROUP)
" t nil)

(autoload 'customize-save-customized "cus-edit" "\
Save all user options which have been set in this session.

arguments: ()
" t nil)

(autoload 'custom-save-all "cus-edit" "\
Save all customizations in `custom-file'.

arguments: ()
" nil nil)

(autoload 'custom-menu-create "cus-edit" "\
Create menu for customization group SYMBOL.
The menu is in a format applicable to `easy-menu-define'.

arguments: (SYMBOL)
" nil nil)

(autoload 'customize-menu-create "cus-edit" "\
Return a customize menu for customization group SYMBOL.
If optional NAME is given, use that as the name of the menu.
Otherwise the menu will be named `Customize'.
The format is suitable for use with `easy-menu-define'.

arguments: (SYMBOL &optional NAME)
" nil nil)

(autoload 'custom-migrate-custom-file "cus-edit" "\
Migrate custom file from home directory.

arguments: (NEW-CUSTOM-FILE-NAME)
" nil nil)

;;;***

;;;### (autoloads (custom-reset-faces custom-theme-reset-faces custom-theme-face-value custom-theme-set-faces custom-set-faces custom-set-face-update-spec custom-set-face-bold custom-declare-face) "cus-face" "lisp/cus-face.el")

(autoload 'custom-declare-face "cus-face" "\
Like `defface', but FACE is evaluated as a normal argument.

arguments: (FACE SPEC DOC &rest ARGS)
" nil nil)

(autoload 'custom-set-face-bold "cus-face" "\
Set the bold property of FACE to VALUE.

arguments: (FACE VALUE &optional FRAME TAGS)
" nil nil)

(autoload 'custom-set-face-update-spec "cus-face" "\
Customize the FACE for display types matching DISPLAY, merging
in the new items from PLIST.

arguments: (FACE DISPLAY PLIST)
" nil nil)

(autoload 'custom-set-faces "cus-face" "\
Initialize faces according to user preferences.
This asociates the setting with the USER theme.
The arguments should be a list where each entry has the form:

  (FACE SPEC [NOW [COMMENT]])

SPEC will be stored as the saved value for FACE.  If NOW is present
and non-nil, FACE will also be created according to SPEC.
COMMENT is a string comment about FACE.

See `defface' for the format of SPEC.

arguments: (&rest ARGS)
" nil nil)

(autoload 'custom-theme-set-faces "cus-face" "\
Initialize faces according to settings specified by args.
Records the settings as belonging to THEME.

See `custom-set-faces' for a description of the arguments ARGS.

arguments: (THEME &rest ARGS)
" nil nil)

(autoload 'custom-theme-face-value "cus-face" "\
Return spec of FACE in THEME if the THEME modifies the
FACE.  Nil otherwise.

arguments: (FACE THEME)
" nil nil)

(autoload 'custom-theme-reset-faces "cus-face" "\
Reset the value of the face to values previously defined.
Associate this setting with THEME.

ARGS is a list of lists of the form

    (face to-theme)

This means reset face to its value in to-theme.

arguments: (THEME &rest ARGS)
" nil nil)

(autoload 'custom-reset-faces "cus-face" "\
Reset the value of the face to values previously defined.
Associate this setting with the 'user' theme.

ARGS is defined as for `custom-theme-reset-faces'.

arguments: (&rest ARGS)
" nil nil)

;;;***

;;;### (autoloads (describe-char describe-char-unicode-data describe-text-properties) "descr-text" "lisp/descr-text.el")

(autoload 'describe-text-properties "descr-text" "\
Describe widgets, buttons, overlays and text properties at POS.
Interactively, describe them for the character after point.
If optional second argument OUTPUT-BUFFER is non-nil,
insert the output into that buffer, and don't initialize or clear it
otherwise.

arguments: (POS &optional OUTPUT-BUFFER)
" t nil)

(autoload 'describe-char-unicode-data "descr-text" "\
Return a list of Unicode data for unicode CHAR.
Each element is a list of a property description and the property value.
The list is null if CHAR isn't found in `describe-char-unicodedata-file'.

arguments: (CHAR)
" nil nil)

(autoload 'describe-char "descr-text" "\
Describe the character after POS (interactively, the character after point).
The information includes character code, charset and code points in it,
syntax, category, how the character is encoded in a file,
character composition information (if relevant),
as well as widgets, buttons, overlays, and text properties.

arguments: (POS)
" t nil)

;;;***

;;;### (autoloads (disassemble) "disass" "lisp/disass.el")

(autoload 'disassemble "disass" "\
Print disassembled code for OBJECT in (optional) BUFFER.
OBJECT can be a symbol defined as a function, or a function itself
\(a lambda expression or a compiled-function object).
If OBJECT is not already compiled, we compile it, but do not
redefine OBJECT if it is a symbol.

arguments: (OBJECT &optional BUFFER INDENT INTERACTIVE-P)
" t nil)

;;;***

;;;### (autoloads (standard-display-european standard-display-underline standard-display-graphic standard-display-g1 standard-display-ascii standard-display-default standard-display-8bit frob-display-table describe-current-display-table make-display-table) "disp-table" "lisp/disp-table.el")

(autoload 'make-display-table "disp-table" "\
Return a new, empty display table.

This returns a generic character table; previously it returned a vector, but
that was not helpful when dealing with internationalized characters above
?ÿ.  See `make-char-table' for details of character tables in general.  To
write code that works with both vectors and character tables, add something
like the following to the beginning of your file, and use
`put-display-table' to set what a given character is displayed as, and
`get-display-table' to examine what that character is currently displayed
as:

\(defun-when-void put-display-table (range value display-table)
  \"Set the value for char RANGE to VALUE in DISPLAY-TABLE.  \"
  (if (sequencep display-table)
      (aset display-table range value)
    (put-char-table range value display-table)))

\(defun-when-void get-display-table (character display-table)
  \"Find value for CHARACTER in DISPLAY-TABLE.  \"
  (if (sequencep display-table)
      (aref display-table character)
    (get-char-table character display-table)))

In this implementation, `put-display-table' and `get-display-table' are
aliases of `put-char-table' and `get-char-table' respectively, and are
always available.

arguments: ()
" nil nil)

(defalias 'put-display-table (function put-char-table))

(defalias 'get-display-table (function get-char-table))

(autoload 'describe-current-display-table "disp-table" "\
Describe the display table in use in the selected window and buffer.

arguments: (&optional DOMAIN)
" t nil)

(autoload 'frob-display-table "disp-table" "\


arguments: (FDT-FUNCTION FDT-LOCALE &optional TAG-SET)
" nil nil)

(autoload 'standard-display-8bit "disp-table" "\
Display characters in the range L to H literally [sic].

GNU Emacs includes this function.  There, `literally' has no good meaning.
Under XEmacs, this function makes characters with numeric values in the
range L to H display as themselves; that is, as ASCII, latin-iso8859-1,
latin-iso8859-2 or whatever.  See `standard-display-default' for the inverse
function.  

arguments: (L H &optional LOCALE)
" nil nil)

(autoload 'standard-display-default "disp-table" "\
Display characters in the range L to H using octal escape notation.

In the XEmacs context this function is misnamed.  Under GNU Emacs,
characters in the range #xA0 to #xFF display as octal escapes unless
`standard-display-european' has been called; this function neutralizes the
effects of `standard-display-european'.  Under XEmacs, those characters
normally do not display as octal escapes (this ignores hackery like
specifying the X11 font character set on non-Mule builds) and this function
sets them to display as octal escapes.  

arguments: (L H &optional LOCALE)
" nil nil)

(autoload 'standard-display-ascii "disp-table" "\
Display character C using printable string S.

arguments: (C S &optional LOCALE)
" nil nil)

(autoload 'standard-display-g1 "disp-table" "\
Display character C as character SC in the g1 character set.
This only has an effect on TTY devices and assumes that your terminal uses
the SO/SI characters.

arguments: (C SC &optional LOCALE)
" nil nil)

(autoload 'standard-display-graphic "disp-table" "\
Display character C as character GC in graphics character set.
This only has an effect on TTY devices and assumes VT100-compatible escapes.

arguments: (C GC &optional LOCALE)
" nil nil)

(autoload 'standard-display-underline "disp-table" "\
Display character C as character UC plus underlining.

arguments: (C UC &optional LOCALE)
" nil nil)

(autoload 'standard-display-european "disp-table" "\
Toggle display of European characters encoded with ISO 8859-1.
When enabled (the default), characters in the range of 160 to 255 display
as accented characters. With negative prefix argument, display characters in
that range as octal escapes.  

If you want to work in a Western European language under XEmacs, it
shouldn't be necessary to call this function--things should just work.  But
it's in a sufficient number of init files that we're not in a hurry to
remove it.  

arguments: (ARG &optional LOCALE)
" t nil)

;;;***

;;;### (autoloads (pop-tag-mark tags-apropos list-tags tags-query-replace tags-search tags-loop-continue next-file tag-complete-symbol find-tag-other-window find-tag find-tag-at-point visit-tags-table) "etags" "lisp/etags.el")

(autoload 'visit-tags-table "etags" "\
Tell tags commands to use tags table file FILE when all else fails.
FILE should be the name of a file created with the `etags' program.
A directory name is ok too; it means file TAGS in that directory.

arguments: (FILE)
" t nil)

(autoload 'find-tag-at-point "etags" "\
*Find tag whose name contains TAGNAME.
Identical to `find-tag' but does not prompt for tag when called interactively;
instead, uses tag around or before point.

arguments: (TAGNAME &optional OTHER-WINDOW)
" t nil)

(autoload 'find-tag "etags" "\
*Find tag whose name contains TAGNAME.
 Selects the buffer that the tag is contained in
and puts point at its definition.
 If TAGNAME is a null string, the expression in the buffer
around or before point is used as the tag name.
 If called interactively with a numeric argument, searches for the next tag
in the tag table that matches the tagname used in the previous find-tag.
 If second arg OTHER-WINDOW is non-nil, uses another window to display
the tag.

This version of this function supports multiple active tags tables,
and completion.

Variables of note:

  tag-table-alist		controls which tables apply to which buffers
  tags-file-name		a default tags table
  tags-build-completion-table   controls completion behavior
  buffer-tag-table		another way of specifying a buffer-local table
  make-tags-files-invisible	whether tags tables should be very hidden
  tag-mark-stack-max		how many tags-based hops to remember

arguments: (TAGNAME &optional OTHER-WINDOW)
" t nil)

(autoload 'find-tag-other-window "etags" "\
*Find tag whose name contains TAGNAME, in another window.
 Selects the buffer that the tag is contained in in another window
and puts point at its definition.
 If TAGNAME is a null string, the expression in the buffer
around or before point is used as the tag name.
 If second arg NEXT is non-nil (interactively, with prefix arg),
searches for the next tag in the tag table
that matches the tagname used in the previous find-tag.

This version of this function supports multiple active tags tables,
and completion.

Variables of note:

  tag-table-alist		controls which tables apply to which buffers
  tags-file-name		a default tags table
  tags-build-completion-table   controls completion behavior
  buffer-tag-table		another way of specifying a buffer-local table
  make-tags-files-invisible	whether tags tables should be very hidden
  tag-mark-stack-max		how many tags-based hops to remember

arguments: (TAGNAME &optional NEXT)
" t nil)

(autoload 'tag-complete-symbol "etags" "\
The function used to do tags-completion (using 'tag-completion-predicate).

arguments: ()
" t nil)

(autoload 'next-file "etags" "\
Select next file among files in current tag table(s).

A first argument of t (prefix arg, if interactive) initializes to the
beginning of the list of files in the (first) tags table.  If the argument
is neither nil nor t, it is evalled to initialize the list of files.

Non-nil second argument NOVISIT means use a temporary buffer
to save time and avoid uninteresting warnings.

Value is nil if the file was already visited;
if the file was newly read in, the value is the filename.

arguments: (&optional INITIALIZE NOVISIT)
" t nil)

(autoload 'tags-loop-continue "etags" "\
Continue last \\[tags-search] or \\[tags-query-replace] command.
Used noninteractively with non-nil argument to begin such a command (the
argument is passed to `next-file', which see).
Two variables control the processing we do on each file:
the value of `tags-loop-scan' is a form to be executed on each file
to see if it is interesting (it returns non-nil if so)
and `tags-loop-operate' is a form to execute to operate on an interesting file
If the latter returns non-nil, we exit; otherwise we scan the next file.

arguments: (&optional FIRST-TIME)
" t nil)

(autoload 'tags-search "etags" "\
Search through all files listed in tags table for match for REGEXP.
Stops when a match is found.
To continue searching for next match, use command \\[tags-loop-continue].

See documentation of variable `tag-table-alist'.

arguments: (REGEXP &optional FILE-LIST-FORM)
" t nil)

(autoload 'tags-query-replace "etags" "\
Query-replace-regexp FROM with TO through all files listed in tags table.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
If you exit (\\[keyboard-quit] or ESC), you can resume the query-replace
with the command \\[tags-loop-continue].

See documentation of variable `tag-table-alist'.

arguments: (FROM TO &optional DELIMITED FILE-LIST-FORM)
" t nil)

(autoload 'list-tags "etags" "\
Display list of tags in FILE.

arguments: (FILE)
" t nil)

(autoload 'tags-apropos "etags" "\
Display list of all tags in tag table REGEXP matches.

arguments: (STRING)
" t nil)
 (define-key esc-map "*" 'pop-tag-mark)

(autoload 'pop-tag-mark "etags" "\
Go to last tag position.
`find-tag' maintains a mark-stack separate from the \\[set-mark-command] mark-stack.
This function pops (and moves to) the tag at the top of this stack.

arguments: (ARG)
" t nil)

;;;***

;;;### (autoloads (finder-by-keyword finder-commentary) "finder" "lisp/finder.el")

(autoload 'finder-commentary "finder" "\
Display FILE's commentary section.
FILE should be in a form suitable for passing to `locate-library'.

arguments: (FILE)
" t nil)

(autoload 'finder-by-keyword "finder" "\
Find packages matching a given keyword.

arguments: ()
" t nil)

;;;***

;;;### (autoloads (font-lock-set-defaults-1 font-lock-fontify-buffer turn-off-font-lock turn-on-font-lock font-lock-mode font-lock-mode font-lock-mode-line-string font-lock-fontify-string-delimiters font-lock-maximum-size font-lock-maximum-decoration font-lock-use-fonts font-lock-use-colors font-lock-mode-disable-list font-lock-mode-enable-list font-lock-auto-fontify) "font-lock" "lisp/font-lock.el")

(defvar font-lock-auto-fontify t "\
*Whether font-lock should automatically fontify files as they're loaded.
This will only happen if font-lock has fontifying keywords for the major
mode of the file.  You can get finer-grained control over auto-fontification
by using this variable in combination with `font-lock-mode-enable-list' or
`font-lock-mode-disable-list'.")

(defvar font-lock-mode-enable-list nil "\
*List of modes to auto-fontify, if `font-lock-auto-fontify' is nil.")

(defvar font-lock-mode-disable-list nil "\
*List of modes not to auto-fontify, if `font-lock-auto-fontify' is t.")

(defvar font-lock-use-colors '(color) "\
*Specification for when Font Lock will set up color defaults.
Normally this should be '(color), meaning that Font Lock will set up
color defaults that are only used on color displays.  Set this to nil
if you don't want Font Lock to set up color defaults at all.  This
should be one of

-- a list of valid tags, meaning that the color defaults will be used
   when all of the tags apply. (e.g. '(color x))
-- a list whose first element is 'or and whose remaining elements are
   lists of valid tags, meaning that the defaults will be used when
   any of the tag lists apply.
-- nil, meaning that the defaults should not be set up at all.

\(If you specify face values in your init file, they will override any
that Font Lock specifies, regardless of whether you specify the face
values before or after loading Font Lock.)

See also `font-lock-use-fonts'.  If you want more control over the faces
used for fontification, see the documentation of `font-lock-mode' for
how to do it.")

(defvar font-lock-use-fonts '(or (mono) (grayscale)) "\
*Specification for when Font Lock will set up non-color defaults.

Normally this should be '(or (mono) (grayscale)), meaning that Font
Lock will set up non-color defaults that are only used on either mono
or grayscale displays.  Set this to nil if you don't want Font Lock to
set up non-color defaults at all.  This should be one of

-- a list of valid tags, meaning that the non-color defaults will be used
   when all of the tags apply. (e.g. '(grayscale x))
-- a list whose first element is 'or and whose remaining elements are
   lists of valid tags, meaning that the defaults will be used when
   any of the tag lists apply.
-- nil, meaning that the defaults should not be set up at all.

\(If you specify face values in your init file, they will override any
that Font Lock specifies, regardless of whether you specify the face
values before or after loading Font Lock.)

See also `font-lock-use-colors'.  If you want more control over the faces
used for fontification, see the documentation of `font-lock-mode' for
how to do it.")

(defvar font-lock-maximum-decoration t "\
*If non-nil, the maximum decoration level for fontifying.
If nil, use the minimum decoration (equivalent to level 0).
If t, use the maximum decoration available.
If a number, use that level of decoration (or if not available the maximum).
If a list, each element should be a cons pair of the form (MAJOR-MODE . LEVEL),
where MAJOR-MODE is a symbol or t (meaning the default).  For example:
 ((c++-mode . 2) (c-mode . t) (t . 1))
means use level 2 decoration for buffers in `c++-mode', the maximum decoration
available for buffers in `c-mode', and level 1 decoration otherwise.")

(define-obsolete-variable-alias 'font-lock-use-maximal-decoration 'font-lock-maximum-decoration)

(defvar font-lock-maximum-size (* 250 1024) "\
*If non-nil, the maximum size for buffers for fontifying.
Only buffers less than this can be fontified when Font Lock mode is turned on.
If nil, means size is irrelevant.
If a list, each element should be a cons pair of the form (MAJOR-MODE . SIZE),
where MAJOR-MODE is a symbol or t (meaning the default).  For example:
 ((c++-mode . 256000) (c-mode . 256000) (rmail-mode . 1048576))
means that the maximum size is 250K for buffers in `c++-mode' or `c-mode', one
megabyte for buffers in `rmail-mode', and size is irrelevant otherwise.")

(defvar font-lock-fontify-string-delimiters nil "\
*If non-nil, apply font-lock-string-face to string delimiters as well as
string text when fontifying.")

(defvar font-lock-mode-line-string " Font" "\
*String to display in the modeline when Font Lock mode is active.
Set this to nil if you don't want a modeline indicator.")

(defvar font-lock-keywords nil "\
A list defining the keywords for `font-lock-mode' to highlight.

 FONT-LOCK-KEYWORDS := List of FONT-LOCK-FORM's.

 FONT-LOCK-FORM     :== MATCHER
                      | (MATCHER . MATCH)
                      | (MATCHER . FACE-FORM)
                      | (MATCHER . HIGHLIGHT)
                      | (MATCHER HIGHLIGHT ...)
                      | (eval . FORM)

 MATCHER            :== A string containing a regexp.
                      | A variable containing a regexp to search for.
                      | A function to call to make the search.
                        It is called with one arg, the limit of the search,
                        and should leave MATCH results in the XEmacs global
                        match data.

 MATCH              :== An integer match subexpression number from MATCHER.

 FACE-FORM           :== The symbol naming a defined face.
                      | Expression whos value is the face name to use.  If you
                        want FACE-FORM to be a symbol that evaluates to a face,
                        use a form like \"(progn sym)\".

 HIGHLIGHT          :== MATCH-HIGHLIGHT
                      | MATCH-ANCHORED

 FORM               :== Expression returning a FONT-LOCK-FORM, evaluated when
                        the FONT-LOCK-FORM is first used in a buffer.  This
                        feature can be used to provide a FONT-LOCK-FORM that
                        can only be generated when Font Lock mode is actually
                        turned on.

 MATCH-HIGHLIGHT    :== (MATCH FACE-FORM OVERRIDE LAXMATCH)

 OVERRIDE           :== t        - overwrite existing fontification
                      | 'keep    - only parts not already fontified are
                                   highlighted.
                      | 'prepend - merge faces, this fontification has
                                   precedence over existing
                      | 'append  - merge faces, existing fontification has
                                   precedence over
                                   this face.

 LAXMATCH           :== If non-nil, no error is signalled if there is no MATCH
                        in MATCHER.

 MATCH-ANCHORED     :== (ANCHOR-MATCHER PRE-MATCH-FORM \\
                                          POST-MATCH-FORM MATCH-HIGHLIGHT ...)

 ANCHOR-MATCHER     :== Like a MATCHER, except that the limit of the search
                        defaults to the end of the line after PRE-MATCH-FORM
                        is evaluated.  However, if PRE-MATCH-FORM returns a
                        position greater than the end of the line, that
                        position is used as the limit of the search.  It is
                        generally a bad idea to return a position greater than
                        the end of the line, i.e., cause the ANCHOR-MATCHER
                        search to span lines.

 PRE-MATCH-FORM     :== Evaluated before the ANCHOR-MATCHER is used, therefore
                        can be used to initialize before, ANCHOR-MATCHER is
                        used.  Typically, PRE-MATCH-FORM is used to move to
                        some position relative to the original MATCHER, before
                        starting with the ANCHOR-MATCHER.

 POST-MATCH-FORM    :== Like PRE-MATCH-FORM, but used to clean up after the
                        ANCHOR-MATCHER.  It might be used to move, before
                        resuming with MATCH-ANCHORED's parent's MATCHER.

For example, an element of the first form highlights (if not already highlighted):

  \"\\\\\\=<foo\\\\\\=>\"                    Discrete occurrences of \"foo\" in the value
                                 of the variable `font-lock-keyword-face'.

  (\"fu\\\\(bar\\\\)\" . 1)            Substring \"bar\" within all occurrences of
                                 \"fubar\" in the value of
                                 `font-lock-keyword-face'.

  (\"fubar\" . fubar-face)         Occurrences of \"fubar\" in the value of
                                 `fubar-face'.

  (\"foo\\\\|bar\" 0 foo-bar-face t) Occurrences of either \"foo\" or \"bar\" in the
                                 value of `foo-bar-face', even if already
                                 highlighted.

  (fubar-match 1 fubar-face)     The first subexpression within all
                                 occurrences of whatever the function
                                 `fubar-match' finds and matches in the value
                                 of `fubar-face'.

  (\"\\\\\\=<anchor\\\\\\=>\" (0 anchor-face) (\"\\\\\\=<item\\\\\\=>\" nil nil (0 item-face)))
   -------------- ---------------  ------------ --- --- -------------
       |            |               |            |   |          |
   MATCHER          |         ANCHOR-MATCHER     |   +------+ MATCH-HIGHLIGHT
             MATCH-HIGHLIGHT                 PRE-MATCH-FORM |
                                                           POST-MATCH-FORM

  Discrete occurrences of \"anchor\" in the value of `anchor-face', and
  subsequent discrete occurrences of \"item\" (on the same line) in the value
  of `item-face'.  (Here PRE-MATCH-FORM and POST-MATCH-FORM are nil.
  Therefore \"item\" is initially searched for starting from the end of the
  match of \"anchor\", and searching for subsequent instance of \"anchor\"
  resumes from where searching for \"item\" concluded.)

For highlighting single items, typically only MATCH-HIGHLIGHT is required.
However, if an item or (typically) several items are to be highlighted
following the instance of another item (the anchor) then MATCH-ANCHORED may be
required.

These regular expressions should not match text which spans lines.  While
\\[font-lock-fontify-buffer] handles multi-line patterns correctly, updating when you
edit the buffer does not, since it considers text one line at a time.

Be very careful composing regexps for this list; the wrong pattern can
dramatically slow things down!
")

(make-variable-buffer-local 'font-lock-keywords)

(defvar font-lock-syntactic-keywords nil "\
A list of the syntactic keywords to highlight.
Can be the list or the name of a function or variable whose value is the list.
See `font-lock-keywords' for a description of the form of this list;
the differences are listed below.  MATCH-HIGHLIGHT should be of the form:

 (MATCH SYNTAX OVERRIDE LAXMATCH)

where SYNTAX can be of the form (SYNTAX-CODE . MATCHING-CHAR), the name of a
syntax table, or an expression whose value is such a form or a syntax table.
OVERRIDE cannot be `prepend' or `append'.

For example, an element of the form highlights syntactically:

 (\"\\\\$\\\\(#\\\\)\" 1 (1 . nil))

 a hash character when following a dollar character, with a SYNTAX-CODE of
 1 (meaning punctuation syntax).  Assuming that the buffer syntax table does
 specify hash characters to have comment start syntax, the element will only
 highlight hash characters that do not follow dollar characters as comments
 syntactically.

 (\"\\\\('\\\\).\\\\('\\\\)\"
  (1 (7 . ?'))
  (2 (7 . ?')))

 both single quotes which surround a single character, with a SYNTAX-CODE of
 7 (meaning string quote syntax) and a MATCHING-CHAR of a single quote (meaning
 a single quote matches a single quote).  Assuming that the buffer syntax table
 does not specify single quotes to have quote syntax, the element will only
 highlight single quotes of the form 'c' as strings syntactically.
 Other forms, such as foo'bar or 'fubar', will not be highlighted as strings.

This is normally set via `font-lock-defaults'.")

(make-variable-buffer-local 'font-lock-syntactic-keywords)

(defvar font-lock-mode nil "\
Non nil means `font-lock-mode' is on")

(custom-add-to-group 'font-lock 'font-lock-mode 'custom-variable)

(custom-add-load 'font-lock-mode 'font-lock)

(defvar font-lock-mode-hook nil "\
Function or functions to run on entry to font-lock-mode.")

(autoload 'font-lock-mode "font-lock" "\
Toggle Font Lock Mode.
With arg, turn font-lock mode on if and only if arg is positive.

When Font Lock mode is enabled, text is fontified as you type it:

 - Comments are displayed in `font-lock-comment-face';
 - Strings are displayed in `font-lock-string-face';
 - Documentation strings (in Lisp-like languages) are displayed in
   `font-lock-doc-string-face';
 - Language keywords (\"reserved words\") are displayed in
   `font-lock-keyword-face';
 - Function names in their defining form are displayed in
   `font-lock-function-name-face';
 - Variable names in their defining form are displayed in
   `font-lock-variable-name-face';
 - Type names are displayed in `font-lock-type-face';
 - References appearing in help files and the like are displayed
   in `font-lock-reference-face';
 - Preprocessor declarations are displayed in
  `font-lock-preprocessor-face';

   and

 - Certain other expressions are displayed in other faces according
   to the value of the variable `font-lock-keywords'.

Where modes support different levels of fontification, you can use the variable
`font-lock-maximum-decoration' to specify which level you generally prefer.
When you turn Font Lock mode on/off the buffer is fontified/defontified, though
fontification occurs only if the buffer is less than `font-lock-maximum-size'.
To fontify a buffer without turning on Font Lock mode, and regardless of buffer
size, you can use \\[font-lock-fontify-buffer].

See the variable `font-lock-keywords' for customization.

arguments: (&optional ARG)
" t nil)

(autoload 'turn-on-font-lock "font-lock" "\
Unconditionally turn on Font Lock mode.

arguments: ()
" t nil)

(autoload 'turn-off-font-lock "font-lock" "\
Unconditionally turn off Font Lock mode.

arguments: ()
" t nil)

(autoload 'font-lock-fontify-buffer "font-lock" "\
Fontify the current buffer the way `font-lock-mode' would.
See `font-lock-mode' for details.

This can take a while for large buffers.

arguments: ()
" t nil)

(autoload 'font-lock-set-defaults-1 "font-lock" "\


arguments: (&optional EXPLICIT-DEFAULTS)
" nil nil)

(add-minor-mode 'font-lock-mode 'font-lock-mode-line-string)

;;;***

;;;### (autoloads (font-menu-weight-constructor font-menu-size-constructor font-menu-family-constructor reset-device-font-menus font-menu-this-frame-only-p font-menu-ignore-scaled-fonts) "font-menu" "lisp/font-menu.el")

(defvar font-menu-ignore-scaled-fonts nil "\
*If non-nil, the font menu shows only bitmap fonts.

Bitmap fonts at their design size are generally noticeably higher quality than
scaled fonts, unless the device is capable of interpreting antialiasing hints.
In general, setting this option non-`nil' is useful mostly on older X servers.

Not all devices make the distinction between bitmap and scaled fonts.")

(defvar font-menu-this-frame-only-p nil "\
*If non-nil, the menu affects the default font only on the selected frame.")

(fset 'install-font-menus 'reset-device-font-menus)

(autoload 'reset-device-font-menus "font-menu" "\
Generates the `Font', `Size', and `Weight' submenus for the Options menu.
This is run the first time that a font-menu is needed for each device.

If you don't like the lazy invocation of this function, you can add it to
`create-device-hook' and that will make the font menus respond more quickly
when they are selected for the first time.  If you add fonts to your system,
or if you change your font path, you can call this to re-initialize the menus.

arguments: (&optional DEVICE DEBUG)
" nil nil)

(autoload 'font-menu-family-constructor "font-menu" "\


arguments: (IGNORED)
" nil nil)

(autoload 'font-menu-size-constructor "font-menu" "\


arguments: (IGNORED)
" nil nil)

(autoload 'font-menu-weight-constructor "font-menu" "\


arguments: (IGNORED)
" nil nil)

;;;***

;;;### (autoloads (x-font-build-cache font-default-size-for-device font-default-encoding-for-device font-default-registry-for-device font-default-family-for-device font-default-object-for-device font-default-font-for-device font-create-object) "font" "lisp/font.el")

(autoload 'font-create-object "font" "\
Return a font descriptor object for FONTNAME, appropriate for DEVICE.

arguments: (FONTNAME &optional DEVICE)
" nil nil)

(autoload 'font-default-font-for-device "font" "\


arguments: (&optional DEVICE)
" nil nil)

(autoload 'font-default-object-for-device "font" "\


arguments: (&optional DEVICE)
" nil nil)

(autoload 'font-default-family-for-device "font" "\


arguments: (&optional DEVICE)
" nil nil)

(autoload 'font-default-registry-for-device "font" "\


arguments: (&optional DEVICE)
" nil nil)

(autoload 'font-default-encoding-for-device "font" "\


arguments: (&optional DEVICE)
" nil nil)

(autoload 'font-default-size-for-device "font" "\


arguments: (&optional DEVICE)
" nil nil)

(autoload 'x-font-build-cache "font" "\


arguments: (&optional DEVICE)
" nil nil)

;;;***

;;;### (autoloads (gnuserv-start gnuserv-running-p gnuserv-frame gnuserv-mode-line-string) "gnuserv" "lisp/gnuserv.el")

(defvar gnuserv-mode-line-string " Server" "\
*String to display in the modeline when Gnuserv is active.
Set this to nil if you don't want a modeline indicator.")

(defvar gnuserv-frame nil "\
*The frame to be used to display all edited files.
If nil, then a new frame is created for each file edited.
If t, then the currently selected frame will be used.
If a function, then this will be called with a symbol `x' or `tty' as the
only argument, and its return value will be interpreted as above.")

(autoload 'gnuserv-running-p "gnuserv" "\
Return non-nil if a gnuserv process is running from this XEmacs session.

arguments: ()
" nil nil)

(autoload 'gnuserv-start "gnuserv" "\
Allow this Emacs process to be a server for client processes.
This starts a gnuserv communications subprocess through which
client \"editors\" (gnuclient and gnudoit) can send editing commands to
this Emacs job.  See the gnuserv(1) manual page for more details.

Prefix arg means just kill any existing server communications subprocess.

arguments: (&optional LEAVE-DEAD)
" t nil)

;;;***

;;;### (autoloads (gtk-font-menu-font-data gtk-reset-device-font-menus) "gtk-font-menu" "lisp/gtk-font-menu.el")

(autoload 'gtk-reset-device-font-menus "gtk-font-menu" "\
Generates the `Font', `Size', and `Weight' submenus for the Options menu.
This is run the first time that a font-menu is needed for each device.
If you don't like the lazy invocation of this function, you can add it to
`create-device-hook' and that will make the font menus respond more quickly
when they are selected for the first time.  If you add fonts to your system, 
or if you change your font path, you can call this to re-initialize the menus.

arguments: (DEVICE &optional DEBUG)
" nil nil)

(autoload 'gtk-font-menu-font-data "gtk-font-menu" "\


arguments: (FACE DCACHE)
" nil nil)

;;;***

;;;### (autoloads (three-step-help) "help-macro" "lisp/help-macro.el")

(defvar three-step-help t "\
*Non-nil means give more info about Help command in three steps.
The three steps are simple prompt, prompt with all options,
and window listing and describing the options.
A value of nil means skip the middle step, so that
\\[help-command] \\[help-command] gives the window that lists the options.")

;;;***

;;;### (autoloads (hyper-apropos-popup-menu hyper-apropos-set-variable hyper-set-variable hyper-apropos-read-variable-symbol hyper-describe-function hyper-where-is hyper-describe-variable hyper-describe-face hyper-describe-key-briefly hyper-describe-key hyper-apropos command-hyper-apropos) "hyper-apropos" "lisp/hyper-apropos.el")

(autoload 'command-hyper-apropos "hyper-apropos" "\
Display lists of commands and user options matching REGEXP
in buffer \"*Hyper Apropos*\".  See `hyper-apropos-mode' for a
description of the available commands in a Hyper-Apropos buffer.

arguments: (REGEXP)
" t nil)

(autoload 'hyper-apropos "hyper-apropos" "\
Display lists of functions and variables matching REGEXP
in buffer \"*Hyper Apropos*\".  If optional prefix arg is given, then the
value of `hyper-apropos-programming-apropos' is toggled for this search.
See `hyper-apropos-mode' for a description of the available commands in
a Hyper-Apropos buffer.

arguments: (REGEXP TOGGLE-APROPOS)
" t nil)

(autoload 'hyper-describe-key "hyper-apropos" "\


arguments: (KEY)
" t nil)

(autoload 'hyper-describe-key-briefly "hyper-apropos" "\


arguments: (KEY &optional SHOW)
" t nil)

(autoload 'hyper-describe-face "hyper-apropos" "\
Describe face..
See also `hyper-apropos' and `hyper-describe-function'.

arguments: (SYMBOL &optional THIS-REF-BUFFER)
" t nil)

(autoload 'hyper-describe-variable "hyper-apropos" "\
Hypertext drop-in replacement for `describe-variable'.
See also `hyper-apropos' and `hyper-describe-function'.

arguments: (SYMBOL &optional THIS-REF-BUFFER)
" t nil)

(autoload 'hyper-where-is "hyper-apropos" "\
Print message listing key sequences that invoke specified command.

arguments: (SYMBOL)
" t nil)

(autoload 'hyper-describe-function "hyper-apropos" "\
Hypertext replacement for `describe-function'.  Unlike `describe-function'
in that the symbol under the cursor is the default if it is a function.
See also `hyper-apropos' and `hyper-describe-variable'.

arguments: (SYMBOL &optional THIS-REF-BUFFER)
" t nil)

(autoload 'hyper-apropos-read-variable-symbol "hyper-apropos" "\
Hypertext drop-in replacement for `describe-variable'.
See also `hyper-apropos' and `hyper-describe-function'.

arguments: (PROMPT &optional PREDICATE)
" nil nil)

(define-obsolete-function-alias 'hypropos-read-variable-symbol 'hyper-apropos-read-variable-symbol)

(define-obsolete-function-alias 'hypropos-get-doc 'hyper-apropos-get-doc)

(autoload 'hyper-set-variable "hyper-apropos" "\


arguments: (VAR VAL &optional THIS-REF-BUFFER)
" t nil)

(autoload 'hyper-apropos-set-variable "hyper-apropos" "\
Interactively set the variable on the current line.

arguments: (VAR VAL &optional THIS-REF-BUFFER)
" t nil)

(define-obsolete-function-alias 'hypropos-set-variable 'hyper-apropos-set-variable)

(autoload 'hyper-apropos-popup-menu "hyper-apropos" "\


arguments: (EVENT)
" t nil)

(define-obsolete-function-alias 'hypropos-popup-menu 'hyper-apropos-popup-menu)

;;;***

;;;### (autoloads (Info-search-index-in-xemacs-and-lispref Info-search-index-in-lispref Info-search-text-in-xemacs Info-search-text-in-lispref Info-elisp-ref Info-emacs-key Info-goto-emacs-key-command-node Info-goto-emacs-command-node Info-emacs-command Info-search Info-visit-file Info-goto-node Info-batch-rebuild-dir Info-find-node Info-query info) "info" "lisp/info.el")

(defvar Info-directory-list nil "\
List of directories to search for Info documentation files.

The first directory in this list, the \"dir\" file there will become
the (dir)Top node of the Info documentation tree.

Note: DO NOT use the `customize' interface to change the value of this
variable.  Its value is created dynamically on each startup, depending
on XEmacs packages installed on the system.  If you want to change the
search path, make the needed modifications on the variable's value
from .emacs.  For instance:

    (setq Info-directory-list (cons \"~/info\" Info-directory-list))")

(autoload 'info "info" "\
Enter Info, the documentation browser.
Optional argument FILE specifies the file to examine;
the default is the top-level directory of Info.

Called from a program, FILE may specify an Info node of the form
`(FILENAME)NODENAME'.

In interactive use, a prefix argument directs this command
to read a file name from the minibuffer.

arguments: (&optional FILE)
" t nil)

(autoload 'Info-query "info" "\
Enter Info, the documentation browser.  Prompt for name of Info file.

arguments: (FILE)
" t nil)

(autoload 'Info-find-node "info" "\
Go to an info node specified as separate FILENAME and NODENAME.
Look for a plausible filename, or if not found then look for URL's and
dispatch to the appropriate fn.  NO-GOING-BACK is non-nil if recovering
from an error in this function; it says do not attempt further (recursive)
error recovery.  TRYFILE indicates that NODENAME might actually be a
filename, so if we can't find a node of this name, try going to the `Top'
node of a file of this name.

arguments: (FILENAME &optional NODENAME NO-GOING-BACK TRYFILE LINE)
" nil nil)

(autoload 'Info-batch-rebuild-dir "info" "\
(Re)build `dir' files in the directories remaining on the command line.
Use this from the command line, with `-batch', it won't work in an
interactive XEmacs.

Each file is processed even if an error occurred previously. For example,
invoke \"xemacs -batch -f Info-batch-rebuild-dir /usr/local/info\".

arguments: ()
" nil nil)

(autoload 'Info-goto-node "info" "\
Go to info node named NAME.  Give just NODENAME or (FILENAME)NODENAME.
Actually, the following interpretations of NAME are tried in order:
    (FILENAME)NODENAME
    (FILENAME)     (using Top node)
    NODENAME       (in current file)
    TAGNAME        (see below)
    FILENAME       (using Top node)
where TAGNAME is a string that appears in quotes: \"TAGNAME\", in an
annotation for any node of any file.  (See `a' and `x' commands.)

arguments: (NODENAME &optional NO-GOING-BACK TRYFILE)
" t nil)

(autoload 'Info-visit-file "info" "\
Directly visit an info file.

arguments: (FILE)
" t nil)

(autoload 'Info-search "info" "\
Search for REGEXP, starting from point, and select node it's found in.

arguments: (REGEXP)
" t nil)

(autoload 'Info-emacs-command "info" "\
Look up an Emacs command in the Emacs manual in the Info system.
This command is designed to be used whether you are already in Info or not.

arguments: (COMMAND)
" t nil)

(autoload 'Info-goto-emacs-command-node "info" "\
Look up an Emacs command in the Emacs manual in the Info system.
This command is designed to be used whether you are already in Info or not.

arguments: (KEY)
" t nil)

(autoload 'Info-goto-emacs-key-command-node "info" "\
Look up an Emacs key sequence in the Emacs manual in the Info system.
This command is designed to be used whether you are already in Info or not.

arguments: (KEY)
" t nil)

(autoload 'Info-emacs-key "info" "\
Look up an Emacs key sequence in the Emacs manual in the Info system.
This command is designed to be used whether you are already in Info or not.

arguments: (KEY)
" t nil)

(autoload 'Info-elisp-ref "info" "\
Look up an Emacs Lisp function in the Elisp manual in the Info system.
This command is designed to be used whether you are already in Info or not.

arguments: (FUNC)
" t nil)

(autoload 'Info-search-text-in-lispref "info" "\
Search for REGEXP in Lispref text and select node it's found in.

arguments: (REGEXP)
" t nil)

(autoload 'Info-search-text-in-xemacs "info" "\
Search for REGEXP in User's Manual text and select node it's found in.

arguments: (REGEXP)
" t nil)

(autoload 'Info-search-index-in-lispref "info" "\
Search for REGEXP in Lispref index and select node it's found in.

arguments: (REGEXP)
" t nil)

(autoload 'Info-search-index-in-xemacs-and-lispref "info" "\
Search for REGEXP in both User's Manual and Lispref indices.
Select node it's found in.

arguments: (REGEXP)
" t nil)

;;;***

;;;### (autoloads (mswindows-font-menu-font-data mswindows-reset-device-font-menus) "msw-font-menu" "lisp/msw-font-menu.el")

(autoload 'mswindows-reset-device-font-menus "msw-font-menu" "\
Generates the `Font', `Size', and `Weight' submenus for the Options menu.
This is run the first time that a font-menu is needed for each device.
If you don't like the lazy invocation of this function, you can add it to
`create-device-hook' and that will make the font menus respond more quickly
when they are selected for the first time.  If you add fonts to your system, 
or if you change your font path, you can call this to re-initialize the menus.

arguments: (DEVICE &optional DEBUG)
" nil nil)

(autoload 'mswindows-font-menu-font-data "msw-font-menu" "\


arguments: (FACE DCACHE)
" nil nil)

;;;***

;;;### (autoloads (mwheel-install) "mwheel" "lisp/mwheel.el")

(autoload 'mwheel-install "mwheel" "\
Enable mouse wheel support.

arguments: ()
" t nil)

(define-behavior 'mwheel "This code enables the use of the infamous 'wheel' on the new\ncrop of mice.  Under XFree86 and the XSuSE X Servers, the wheel\nevents are sent as button4/button5 events, which are automatically\nset up to do scrolling in the expected way.  The actual way that the\nscrolling works can be controlled by `mwheel-scroll-amount' and\n`mwheel-follow-mouse'." :group 'mouse :short-doc "Mouse wheel support for X Windows" :enable 'mwheel-install)

;;;***

;;;### (autoloads (next-error-framework-next-error) "next-error" "lisp/next-error.el")

(autoload 'next-error-framework-next-error "next-error" "\
Visit next `next-error-framework-next-error' message and corresponding source code.

If all the error messages parsed so far have been processed already,
the message buffer is checked for new ones.

A prefix ARG specifies how many error messages to move;
negative means move back to previous error messages.
Just \\[universal-argument] as a prefix means reparse the error message buffer
and start at the first error.

The RESET argument specifies that we should restart from the beginning.

\\[next-error-framework-next-error] normally uses the most recently started
compilation, grep, or occur buffer.  It can also operate on any
buffer with output from the \\[compile], \\[grep] commands, or,
more generally, on any buffer in Compilation mode or with
Compilation Minor mode enabled, or any buffer in which
`next-error-function' is bound to an appropriate function.
To specify use of a particular buffer for error messages, type
\\[next-error-framework-next-error] in that buffer when it is the only one displayed
in the current frame.

Once \\[next-error-framework-next-error] has chosen the buffer for error messages, it
runs `next-error-hook' with `run-hooks', and stays with that buffer
until you use it in some other buffer which uses Compilation mode
or Compilation Minor mode.

See variables `compilation-parse-errors-function' and
`compilation-error-regexp-alist' for customization ideas.

arguments: (&optional ARG RESET)
" t nil)

;;;***

;;;### (autoloads (multi-occur-by-filename-regexp multi-occur occur occur-rename-buffer occur-mode) "occur" "lisp/occur.el")

(autoload 'occur-mode "occur" "\
Major mode for output from \\[occur].
\\<occur-mode-map>Move point to one of the items in this buffer, then use
\\[occur-mode-goto-occurrence] to go to the occurrence that the item refers to.
Alternatively, click \\[occur-mode-mouse-goto] on an item to go to it.

\\{occur-mode-map}

arguments: ()
" t nil)

(defalias 'list-matching-lines 'occur)

(autoload 'occur-rename-buffer "occur" "\
Rename the current *Occur* buffer to *Occur: original-buffer-name*.
Here `original-buffer-name' is the buffer name were Occur was originally run.
When given the prefix argument, or called non-interactively, the renaming
will not clobber the existing buffer(s) of that name, but use
`generate-new-buffer-name' instead.  You can add this to `occur-hook'
if you always want a separate *Occur* buffer for each buffer where you
invoke `occur'.

arguments: (&optional UNIQUE-P INTERACTIVE-P)
" t nil)

(autoload 'occur "occur" "\
Show all lines in the current buffer containing a match for REGEXP.
This function can not handle matches that span more than one line.

Each line is displayed with NLINES lines before and after, or -NLINES
before if NLINES is negative.
NLINES defaults to `list-matching-lines-default-context-lines'.
Interactively it is the prefix arg.

The lines are shown in a buffer named `*Occur*'.
It serves as a menu to find any of the occurrences in this buffer.
\\<occur-mode-map>\\[describe-mode] in that buffer will explain how.

If REGEXP contains upper case characters (excluding those preceded by `\\'),
the matching is case-sensitive.

arguments: (REGEXP &optional NLINES)
" t nil)

(autoload 'multi-occur "occur" "\
Show all lines in buffers BUFS containing a match for REGEXP.
This function acts on multiple buffers; otherwise, it is exactly like
`occur'.

arguments: (BUFS REGEXP &optional NLINES)
" t nil)

(autoload 'multi-occur-by-filename-regexp "occur" "\
Show all lines matching REGEXP in buffers named by BUFREGEXP.
See also `multi-occur'.

arguments: (BUFREGEXP REGEXP &optional NLINES)
" t nil)

;;;***

;;;### (autoloads (package-admin-add-binary-package) "package-admin" "lisp/package-admin.el")

(autoload 'package-admin-add-binary-package "package-admin" "\
Install a pre-bytecompiled XEmacs package into package hierarchy.

arguments: (FILE &optional PKG-DIR)
" t nil)

;;;***

;;;### (autoloads (package-get-package-provider package-get package-get-list-packages-where package-get-info package-get-dependencies package-get-all package-get-update-all package-get-delete-package package-get-save-base package-get-update-base-from-buffer package-get-update-base package-get-update-base-entry package-get-require-base package-get-site-release-download-sites package-get-pre-release-download-sites package-get-download-sites package-get-install-to-user-init-directory package-get-package-index-file-location) "package-get" "lisp/package-get.el")

(defvar package-get-base nil "\
List of packages that are installed at this site.
For each element in the alist,  car is the package name and the cdr is
a plist containing information about the package.   Typical fields
kept in the plist are:

version		- version of this package
provides	- list of symbols provided
requires	- list of symbols that are required.
		  These in turn are provided by other packages.
filename	- name of the file.
size		- size of the file (aka the bundled package)
md5sum		- computed md5 checksum
description	- What this package is for.
type		- Whether this is a 'binary (default) or 'single file package

More fields may be added as needed.  An example:

'(
 (name
  (version \"<version 2>\"
   file \"filename\"
   description \"what this package is about.\"
   provides (<list>)
   requires (<list>)
   size <integer-bytes>
   md5sum \"<checksum\"
   type single
   )
  (version \"<version 1>\"
   file \"filename\"
   description \"what this package is about.\"
   provides (<list>)
   requires (<list>)
   size <integer-bytes>
   md5sum \"<checksum\"
   type single
   )
   ...
   ))

For version information, it is assumed things are listed in most
recent to least recent -- in other words, the version names don't have to
be lexically ordered.  It is debatable if it makes sense to have more than
one version of a package available.")

(defvar package-get-package-index-file-location (cond ((getenv "EMACSPACKAGEPATH") (split-path (getenv "EMACSPACKAGEPATH"))) ((getenv "EMACSEARLYPACKAGES") (split-path (getenv "EMACSEARLYPACKAGES"))) (configure-early-package-directories (car configure-early-package-directories)) (t user-init-directory)) "\
*The directory where the package-index file can be found.")

(defvar package-get-install-to-user-init-directory nil "\
*If non-nil install packages under `user-init-directory'.")

(defvar package-get-download-sites '(("US (Main XEmacs Site)" "ftp.xemacs.org" "pub/xemacs/packages") ("Argentina (xmundo.net)" "xemacs.xmundo.net" "pub/mirrors/xemacs/packages") ("Australia (aarnet.edu.au)" "mirror.aarnet.edu.au" "pub/xemacs/packages") ("Australia (au.xemacs.org)" "ftp.au.xemacs.org" "pub/xemacs/packages") ("Austria (at.xemacs.org)" "ftp.at.xemacs.org" "editors/xemacs/packages") ("Belgium (be.xemacs.org)" "ftp.be.xemacs.org" "xemacs/packages") ("Brazil (br.xemacs.org)" "ftp.br.xemacs.org" "pub/xemacs/packages") ("Canada (ca.xemacs.org)" "ftp.ca.xemacs.org" "pub/Mirror/xemacs/packages") ("Canada (nrc.ca)" "ftp.nrc.ca" "pub/packages/editors/xemacs/packages") ("China (ftp.cn.xemacs.org)" "ftp.cn.xemacs.org" "pub/xemacs/packages") ("Czech Republic (cz.xemacs.org)" "ftp.cz.xemacs.org" "MIRRORS/ftp.xemacs.org/pub/xemacs/packages") ("Finland (fi.xemacs.org)" "ftp.fi.xemacs.org" "pub/mirrors/ftp.xemacs.org/pub/tux/xemacs/packages") ("France (fr.xemacs.org)" "ftp.fr.xemacs.org" "pub/xemacs/packages") ("France (mirror.cict.fr)" "mirror.cict.fr" "xemacs/packages") ("France (pasteur.fr)" "ftp.pasteur.fr" "pub/computing/xemacs/packages") ("Germany (de.xemacs.org)" "ftp.de.xemacs.org" "pub/ftp.xemacs.org/tux/xemacs/packages") ("Greece (gr.xemacs.org)" "ftp.gr.xemacs.org" "mirrors/XEmacs/ftp/packages") ("Hong Kong (hk.xemacs.org)" "ftp.hk.xemacs.org" "pub/xemacsftp/packages") ("Ireland (ie.xemacs.org)" "ftp.ie.xemacs.org" "mirrors/ftp.xemacs.org/pub/xemacs/packages") ("Ireland (heanet.ie)" "ftp.heanet.ie" "mirrors/ftp.xemacs.org/packages") ("Italy (it.xemacs.org)" "ftp.it.xemacs.org" "unix/packages/XEMACS/packages") ("Japan (dti.ad.jp)" "ftp.dti.ad.jp" "pub/unix/editor/xemacs/packages") ("Japan (jp.xemacs.org)" "ftp.jp.xemacs.org" "pub/text/xemacs/packages") ("Korea (kr.xemacs.org)" "ftp.kr.xemacs.org" "pub/tools/emacs/xemacs/packages") ("Netherlands (nl.xemacs.org)" "ftp.nl.xemacs.org" "pub/xemacs/ftp/packages") ("Norway (no.xemacs.org)" "ftp.no.xemacs.org" "pub/xemacs/packages") ("Portugal (pt.xemacs.org)" "ftp.pt.xemacs.org" "pub/MIRRORS/ftp.xemacs.org/packages") ("Russia (ru.xemacs.org)" "ftp.ru.xemacs.org" "pub/emacs/xemacs/packages") ("Saudi Arabia (sa.xemacs.org)" "ftp.sa.xemacs.org" "pub/xemacs.org/packages") ("Sweden (se.xemacs.org)" "ftp.se.xemacs.org" "pub/gnu/xemacs/packages") ("Switzerland (ch.xemacs.org)" "ftp.ch.xemacs.org" "mirror/xemacs/packages") ("Taiwan (ftp.tw.xemacs.org)" "ftp.tw.xemacs.org" "Unix/Editors/XEmacs/packages") ("UK (uk.xemacs.org)" "ftp.uk.xemacs.org" "sites/ftp.xemacs.org/pub/xemacs/packages") ("US (ibiblio.org)" "mirrors.ibiblio.org" "pub/mirrors/xemacs/packages") ("US (us.xemacs.org)" "ftp.us.xemacs.org" "pub/mirrors/xemacs/packages")) "\
*List of remote sites available for downloading packages.
List format is '(site-description site-name directory-on-site).
SITE-DESCRIPTION is a textual description of the site.  SITE-NAME
is the internet address of the download site.  DIRECTORY-ON-SITE
is the directory on the site in which packages may be found.
This variable is used to initialize `package-get-remote', the
variable actually used to specify package download sites.")

(defvar package-get-pre-release-download-sites '(("US Pre-Releases (Main XEmacs Site)" "ftp.xemacs.org" "pub/xemacs/beta/experimental/packages") ("Argentina Pre-Releases (xmundo.net)" "xemacs.xmundo.net" "pub/mirrors/xemacs/beta/experimental/packages") ("Australia Pre-Releases (aarnet.edu.au)" "mirror.aarnet.edu.au" "pub/xemacs/beta/experimental/packages") ("Australia Pre-Releases (au.xemacs.org)" "ftp.au.xemacs.org" "pub/xemacs/beta/experimental/packages") ("Austria Pre-Releases (at.xemacs.org)" "ftp.at.xemacs.org" "editors/xemacs/beta/experimental/packages") ("Belgium Pre-Releases (be.xemacs.org)" "ftp.be.xemacs.org" "xemacs/beta/experimental/packages") ("Brazil Pre-Releases (br.xemacs.org)" "ftp.br.xemacs.org" "pub/xemacs/xemacs-21.5/experimental/packages") ("Canada Pre-Releases (ca.xemacs.org)" "ftp.ca.xemacs.org" "pub/Mirror/xemacs/beta/experimental/packages") ("Canada Pre-Releases (nrc.ca)" "ftp.nrc.ca" "pub/packages/editors/xemacs/beta/experimental/packages") ("China Pre-Releases (ftp.cn.xemacs.org)" "ftp.cn.xemacs.org" "pub/xemacs/beta/experimental/packages") ("Czech Republic Pre-Releases (cz.xemacs.org)" "ftp.cz.xemacs.org" "MIRRORS/ftp.xemacs.org/pub/xemacs/xemacs-21.5/experimental/packages") ("Finland Pre-Releases (fi.xemacs.org)" "ftp.fi.xemacs.org" "pub/mirrors/ftp.xemacs.org/pub/tux/xemacs/beta/experimental/packages") ("France Pre-Releases (fr.xemacs.org)" "ftp.fr.xemacs.org" "pub/xemacs/beta/experimental/packages") ("France Pre-Releases (mirror.cict.fr)" "mirror.cict.fr" "xemacs/beta/experimental/packages") ("France Pre-Releases (pasteur.fr)" "ftp.pasteur.fr" "pub/computing/xemacs/beta/experimental/packages") ("Germany Pre-Releases (de.xemacs.org)" "ftp.de.xemacs.org" "pub/ftp.xemacs.org/tux/xemacs/beta/experimental/packages") ("Greece Pre-Releases (gr.xemacs.org)" "ftp.gr.xemacs.org" "mirrors/XEmacs/ftp/beta/experimental/packages") ("Hong Kong Pre-Releases (hk.xemacs.org)" "ftp.hk.xemacs.org" "pub/xemacsftp/beta/experimental/packages") ("Ireland Pre-Releases (ie.xemacs.org)" "ftp.ie.xemacs.org" "mirrors/ftp.xemacs.org/pub/xemacs/beta/experimental/packages") ("Ireland Pre-Releases (heanet.ie)" "ftp.heanet.ie" "mirrors/ftp.xemacs.org/beta/experimental/packages") ("Italy Pre-Releases (it.xemacs.org)" "ftp.it.xemacs.org" "unix/packages/XEMACS/beta/experimental/packages") ("Japan Pre-Releases (dti.ad.jp)" "ftp.dti.ad.jp" "pub/unix/editor/xemacs/beta/experimental/packages") ("Japan Pre-Releases (jp.xemacs.org)" "ftp.jp.xemacs.org" "pub/text/xemacs/beta/experimental/packages") ("Korea Pre-Releases (kr.xemacs.org)" "ftp.kr.xemacs.org" "pub/tools/emacs/xemacs/beta/experimental/packages") ("Netherlands Pre-Releases (nl.xemacs.org)" "ftp.nl.xemacs.org" "pub/xemacs/ftp/beta/experimental/packages") ("Norway Pre-Releases (no.xemacs.org)" "ftp.no.xemacs.org" "pub/xemacs/beta/experimental/packages") ("Portugal Pre-Releases (pt.xemacs.org)" "ftp.pt.xemacs.org" "pub/MIRRORS/ftp.xemacs.org/beta/experimental/packages") ("Russia Pre-Releases (ru.xemacs.org)" "ftp.ru.xemacs.org" "pub/emacs/xemacs/beta/experimental/packages") ("Saudi Arabia Pre-Releases (sa.xemacs.org)" "ftp.sa.xemacs.org" "pub/xemacs.org/beta/experimental/packages") ("Sweden Pre-Releases (se.xemacs.org)" "ftp.se.xemacs.org" "pub/gnu/xemacs/beta/experimental/packages") ("Switzerland Pre-Releases (ch.xemacs.org)" "ftp.ch.xemacs.org" "mirror/xemacs/beta/experimental/packages") ("Taiwan Pre-Releases (ftp.tw.xemacs.org)" "ftp.tw.xemacs.org" "Unix/Editors/XEmacs/beta/experimental/packages") ("UK Pre-Releases (uk.xemacs.org)" "ftp.uk.xemacs.org" "sites/ftp.xemacs.org/pub/xemacs/beta/experimental/packages") ("US Pre-Releases (ibiblio.org)" "mirrors.ibiblio.org" "pub/mirrors/xemacs/beta/experimental/packages") ("US Pre-Releases (us.xemacs.org)" "ftp.us.xemacs.org" "pub/mirrors/xemacs/beta/experimental/packages")) "\
*List of remote sites available for downloading \"Pre-Release\" packages.
List format is '(site-description site-name directory-on-site).
SITE-DESCRIPTION is a textual description of the site.  SITE-NAME
is the internet address of the download site.  DIRECTORY-ON-SITE
is the directory on the site in which packages may be found.
This variable is used to initialize `package-get-remote', the
variable actually used to specify package download sites.")

(defvar package-get-site-release-download-sites nil "\
*List of remote sites available for downloading \"Site Release\" packages.
List format is '(site-description site-name directory-on-site).
SITE-DESCRIPTION is a textual description of the site.  SITE-NAME
is the internet address of the download site.  DIRECTORY-ON-SITE
is the directory on the site in which packages may be found.
This variable is used to initialize `package-get-remote', the
variable actually used to specify package download sites.")

(autoload 'package-get-require-base "package-get" "\
Require that a package-get database has been loaded.
If the optional FORCE-CURRENT argument or the value of
`package-get-always-update' is Non-nil, try to update the database
from a location in `package-get-remote'. Otherwise a local copy is used
if available and remote access is never done.

Please use FORCE-CURRENT only when the user is explicitly dealing with packages
and remote access is likely in the near future.

arguments: (&optional FORCE-CURRENT)
" nil nil)

(autoload 'package-get-update-base-entry "package-get" "\
Update an entry in `package-get-base'.

arguments: (ENTRY)
" nil nil)

(autoload 'package-get-update-base "package-get" "\
Update the package-get database file with entries from DB-FILE.
Unless FORCE-CURRENT is non-nil never try to update the database.

arguments: (&optional DB-FILE FORCE-CURRENT)
" t nil)

(autoload 'package-get-update-base-from-buffer "package-get" "\
Update the package-get database with entries from BUFFER.
BUFFER defaults to the current buffer.  This command can be
used interactively, for example from a mail or news buffer.

arguments: (&optional BUF)
" t nil)

(autoload 'package-get-save-base "package-get" "\
Write the package-get database to FILE.

Note: This database will be unsigned of course.

arguments: (FILE)
" t nil)

(autoload 'package-get-delete-package "package-get" "\
Delete an installation of PACKAGE below directory PKG-TOPDIR.
PACKAGE is a symbol, not a string.
This is just an interactive wrapper for `package-admin-delete-binary-package'.

arguments: (PACKAGE &optional PKG-TOPDIR)
" t nil)

(autoload 'package-get-update-all "package-get" "\
Fetch and install the latest versions of all currently installed packages.

arguments: ()
" t nil)

(autoload 'package-get-all "package-get" "\
Fetch PACKAGE with VERSION and all other required packages.
Uses `package-get-base' to determine just what is required and what
package provides that functionality.  If VERSION is nil, retrieves
latest version.  Optional argument FETCHED-PACKAGES is used to keep
track of packages already fetched.  Optional argument INSTALL-DIR,
if non-nil, specifies the package directory where fetched packages
should be installed.

Returns nil upon error.

arguments: (PACKAGE VERSION &optional FETCHED-PACKAGES INSTALL-DIR)
" t nil)

(autoload 'package-get-dependencies "package-get" "\
Compute dependencies for PACKAGES.
Uses `package-get-base' to determine just what is required and what
package provides that functionality.  Returns the list of packages
required by PACKAGES.

arguments: (PACKAGES)
" nil nil)

(autoload 'package-get-info "package-get" "\
Get information about a package.

Quite similar to `package-get-info-prop', but can retrieve a lot more
information.

Argument PACKAGE is the name of an XEmacs package (a symbol).  It must
be a valid package, ie, a member of `package-get-base'.

Argument INFORMATION is a symbol that can be any one of:

   standards-version     Package system version (not used).
   version               Version of the XEmacs package.
   author-version        The upstream version of the package.
   date                  The date the package was last modified.
   build-date            The date the package was last built.
   maintainer            The maintainer of the package.
   distribution          Will always be \"xemacs\" (not used).
   priority              \"low\", \"medium\", or \"high\" (not used).
   category              Either \"standard\", \"mule\", or \"unsupported\"..
   dump                  Is the package dumped (not used).
   description           A description of the package.
   filename              The filename of the binary tarball of the package.
   md5sum                The md5sum of filename.
   size                  The size in bytes of filename.
   provides              A list of symbols that this package provides.
   requires              A list of packages that this package requires.
   type                  Can be either \"regular\" or \"single-file\".

Optional argument ARG is a prefix arg.  Without a value, ie, just
doing `C-u M-x package-get-info' will insert the information at point
in the current buffer using a local package list.

ARG can also be given a value of 2 or 3.  If 2, use a remote package
list, displaying the information in the minubuffer.  If 3, use a remote
package list and insert the information at point in the current buffer.

If optional argument REMOTE is non-nil use a package list from a
remote site.  

To use a remote package list, either via the prefix argument ARG or
via the REMOTE argument `package-get-remote' must be non-nil.  If
`package-get-remote' is nil, the local package list will be used.

If this function is called interactively it will display INFORMATION
in the minibuffer.

arguments: (PACKAGE INFORMATION &optional ARG REMOTE)
" t nil)

(autoload 'package-get-list-packages-where "package-get" "\
Return a list of packages that fulfill certain criteria.

Argument ITEM, a symbol, is what you want to check for.  ITEM must be a
symbol even when it doesn't make sense to be a symbol (think, searching
maintainers, descriptions, etc).  The function will convert the symbol
to a string if a string is what is needed.  The downside to this is that
ITEM can only ever be a single word.

Argument FIELD, a symbol, is the field to check in.  You can specify
any one of:

      Field            Sane or Allowable Content
    description          any single word
    category             `standard' or `mule'
    maintainer           any single word
    build-date           yyyy-mm-dd
    date                 yyyy-mm-dd
    type                 `regular' or `single'
    requires             any package name
    provides             any symbol
    priority             `low', `medium', or `high'

Optional Argument ARG, a prefix arg, insert output at point in the
current buffer.

arguments: (ITEM FIELD &optional ARG)
" t nil)

(autoload 'package-get "package-get" "\
Fetch PACKAGE from remote site.
Optional arguments VERSION indicates which version to retrieve, nil
means most recent version.  CONFLICT indicates what happens if the
package is already installed.  Valid values for CONFLICT are:
'always	always retrieve the package even if it is already installed
'never	do not retrieve the package if it is installed.
INSTALL-DIR, if non-nil, specifies the package directory where
fetched packages should be installed.

The value of `package-get-base' is used to determine what files should
be retrieved.  The value of `package-get-remote' is used to determine
where a package should be retrieved from.

Once the package is retrieved, its md5 checksum is computed.  If that
sum does not match that stored in `package-get-base' for this version
of the package, an error is signalled.

Returns `t' upon success, the symbol `error' if the package was
successfully installed but errors occurred during initialization, or
`nil' upon error.

arguments: (PACKAGE &optional VERSION CONFLICT INSTALL-DIR)
" t nil)

(autoload 'package-get-package-provider "package-get" "\
Search for a package that provides SYM and return the name and
  version.  Searches in `package-get-base' for SYM.   If SYM is a
  consp, then it must match a corresponding (provide (SYM VERSION)) from
  the package.

If FORCE-CURRENT is non-nil make sure the database is up to date. This might
lead to Emacs accessing remote sites.

arguments: (SYM &optional FORCE-CURRENT)
" t nil)

;;;***

;;;### (autoloads (package-net-update-installed-db package-net-setup-directory) "package-net" "lisp/package-net.el")

(autoload 'package-net-setup-directory "package-net" "\


arguments: ()
" nil nil)

(autoload 'package-net-update-installed-db "package-net" "\
Write out the installed package index in a net install suitable format.
If DESTDIR is non-nil then use that as the destination directory. 
DESTDIR defaults to the value of `package-net-setup-directory'.

arguments: (&optional DESTDIR)
" nil nil)

;;;***

;;;### (autoloads (pui-list-packages pui-set-local-package-get-directory package-ui-site-release-download-menu package-ui-pre-release-download-menu package-ui-download-menu package-ui-add-site) "package-ui" "lisp/package-ui.el")

(autoload 'package-ui-add-site "package-ui" "\
Add site to package-get-remote and possibly offer to update package list.

arguments: (SITE)
" nil nil)

(autoload 'package-ui-download-menu "package-ui" "\
Build the `Add Download Site' menu.

arguments: ()
" nil nil)

(autoload 'package-ui-pre-release-download-menu "package-ui" "\
Build the 'Pre-Release Download Sites' menu.

arguments: ()
" nil nil)

(autoload 'package-ui-site-release-download-menu "package-ui" "\
Build the 'Site Release Download Sites' menu.

arguments: ()
" nil nil)

(autoload 'pui-set-local-package-get-directory "package-ui" "\
Set a new package binary directory in `package-get-remote'.
Note that no provision is made for saving any changes made by this function.
It exists mainly as a convenience for one-time package installations from
disk.

arguments: ()
" t nil)

(autoload 'pui-list-packages "package-ui" "\
List all packages and package information.
The package name, version, and description are displayed.  From the displayed
buffer, the user can see which packages are installed, which are not, and
which are out-of-date (a newer version is available).  The user can then
select packages for installation via the keyboard or mouse.

arguments: ()
" t nil)

(defalias 'list-packages 'pui-list-packages)

;;;***

;;;### (autoloads (picture-mode) "picture" "lisp/picture.el")

(autoload 'picture-mode "picture" "\
Switch to Picture mode, in which a quarter-plane screen model is used.
Printing characters replace instead of inserting themselves with motion
afterwards settable by these commands:
  C-c <	  Move left after insertion.
  C-c >	  Move right after insertion.
  C-c ^	  Move up after insertion.
  C-c .	  Move down after insertion.
  C-c `	  Move northwest (nw) after insertion.
  C-c '	  Move northeast (ne) after insertion.
  C-c /	  Move southwest (sw) after insertion.
  C-c \\   Move southeast (se) after insertion.
The current direction is displayed in the modeline.  The initial
direction is right.  Whitespace is inserted and tabs are changed to
spaces when required by movement.  You can move around in the buffer
with these commands:
  \\[picture-move-down]	  Move vertically to SAME column in previous line.
  \\[picture-move-up]	  Move vertically to SAME column in next line.
  \\[picture-end-of-line]	  Move to column following last non-whitespace character.
  \\[picture-forward-column]	  Move right inserting spaces if required.
  \\[picture-backward-column]	  Move left changing tabs to spaces if required.
  C-c C-f Move in direction of current picture motion.
  C-c C-b Move in opposite direction of current picture motion.
  Return  Move to beginning of next line.
You can edit tabular text with these commands:
  M-Tab	  Move to column beneath (or at) next interesting character.
	    `Indents' relative to a previous line.
  Tab	  Move to next stop in tab stop list.
  C-c Tab Set tab stops according to context of this line.
	    With ARG resets tab stops to default (global) value.
	    See also documentation of variable	picture-tab-chars
	    which defines \"interesting character\".  You can manually
	    change the tab stop list with command \\[edit-tab-stops].
You can manipulate text with these commands:
  C-d	  Clear (replace) ARG columns after point without moving.
  C-c C-d Delete char at point - the command normally assigned to C-d.
  \\[picture-backward-clear-column]  Clear (replace) ARG columns before point, moving back over them.
  \\[picture-clear-line]	  Clear ARG lines, advancing over them.	 The cleared
	    text is saved in the kill ring.
  \\[picture-open-line]	  Open blank line(s) beneath current line.
You can manipulate rectangles with these commands:
  C-c C-k Clear (or kill) a rectangle and save it.
  C-c C-w Like C-c C-k except rectangle is saved in named register.
  C-c C-y Overlay (or insert) currently saved rectangle at point.
  C-c C-x Like C-c C-y except rectangle is taken from named register.
  \\[copy-rectangle-to-register]   Copies a rectangle to a register.
  \\[undo]   Can undo effects of rectangle overlay commands
	    if invoked soon enough.
You can return to the previous mode with:
  C-c C-c Which also strips trailing whitespace from every line.
	    Stripping is suppressed by supplying an argument.

Entry to this mode calls the value of  picture-mode-hook  if non-nil.

Note that Picture mode commands will work outside of Picture mode, but
they are not defaultly assigned to keys.

arguments: ()
" t nil)

(defalias 'edit-picture 'picture-mode)

;;;***

;;;### (autoloads (clear-rectangle replace-rectangle string-rectangle open-rectangle insert-rectangle yank-rectangle kill-rectangle extract-rectangle delete-extract-rectangle delete-rectangle) "rect" "lisp/rect.el")

(autoload 'delete-rectangle "rect" "\
Delete the text in the region-rectangle without saving it.
The same range of columns is deleted in each line starting with the line
where the region begins and ending with the line where the region ends.

When called from a program, the rectangle's corners are START and END.
With a prefix (or FILL) argument, also fill lines where nothing has to be
deleted.

arguments: (START END &optional FILL)
" t nil)

(autoload 'delete-extract-rectangle "rect" "\
Delete the contents of the rectangle with corners at START and END, and
return it as a list of strings, one for each line of the rectangle.

With an optional FILL argument, also fill lines where nothing has to be
deleted.

arguments: (START END &optional FILL)
" nil nil)

(autoload 'extract-rectangle "rect" "\
Return the contents of the rectangle with corners at START and END,
as a list of strings, one for each line of the rectangle.

arguments: (START END)
" nil nil)

(defvar killed-rectangle nil "\
Rectangle for `yank-rectangle' to insert.")

(autoload 'kill-rectangle "rect" "\
Delete the region-rectangle and save it as the last killed one.
You might prefer to use `delete-extract-rectangle' from a program.

When called from a program, the rectangle's corners are START and END.
With a prefix (or FILL) argument, also fill lines where nothing has to be
deleted.

arguments: (START END &optional FILL)
" t nil)

(autoload 'yank-rectangle "rect" "\
Yank the last killed rectangle with upper left corner at point.

arguments: ()
" t nil)

(autoload 'insert-rectangle "rect" "\
Insert text of RECTANGLE with upper left corner at point.
RECTANGLE's first line is inserted at point, its second
line is inserted at a point vertically under point, etc.
RECTANGLE should be a list of strings.
After this command, the mark is at the upper left corner
and point is at the lower right corner.

arguments: (RECTANGLE)
" nil nil)

(autoload 'open-rectangle "rect" "\
Blank out the region-rectangle, shifting text right.

When called from a program, the rectangle's corners are START and END.
With a prefix (or FILL) argument, fill with blanks even if there is no text
on the right side of the rectangle.

arguments: (START END &optional FILL)
" t nil)

(autoload 'string-rectangle "rect" "\
Insert STRING on each line of the region-rectangle, shifting text right.
The left edge of the rectangle specifies the column for insertion.

If `pending-delete-mode' is active the string replace the region.
Otherwise this command does not delete or overwrite any existing text.

When called from a program, the rectangle's corners are START and END.

arguments: (START END STRING)
" t nil)

(autoload 'replace-rectangle "rect" "\
Like `string-rectangle', but unconditionally replace the original region,
as if `pending-delete-mode' were active.

arguments: (START END STRING)
" t nil)

(autoload 'clear-rectangle "rect" "\
Blank out the region-rectangle.
The text previously in the region is overwritten with blanks.

When called from a program, the rectangle's corners are START and END.
With a prefix (or FILL) argument, also fill with blanks the parts of the
rectangle which were empty.

arguments: (START END &optional FILL)
" t nil)

;;;***

;;;### (autoloads (regexp-opt-depth regexp-opt) "regexp-opt" "lisp/regexp-opt.el")

(autoload 'regexp-opt "regexp-opt" "\
Return a regexp to match a string in STRINGS.
Each string should be unique in STRINGS and should not contain any regexps,
quoted or not.  If optional PAREN is non-nil, ensure that the returned regexp
is enclosed by at least one regexp grouping construct.
The returned regexp is typically more efficient than the equivalent regexp:

 (let ((open (if PAREN \"\\\\(\" \"\")) (close (if PAREN \"\\\\)\" \"\")))
   (concat open (mapconcat 'regexp-quote STRINGS \"\\\\|\") close))

If PAREN is `words', then the resulting regexp is additionally surrounded
by \\=\\< and \\>.

arguments: (STRINGS &optional PAREN)
" nil nil)

(autoload 'regexp-opt-depth "regexp-opt" "\
Return the depth of REGEXP.
This means the number of regexp grouping constructs (parenthesised expressions)
in REGEXP.

arguments: (REGEXP)
" nil nil)

;;;***

;;;### (autoloads (list-load-path-shadows) "shadow" "lisp/shadow.el")

(autoload 'list-load-path-shadows "shadow" "\
Display a list of Emacs Lisp files that shadow other files.

This function lists potential load-path problems.  Directories in the
`load-path' variable are searched, in order, for Emacs Lisp
files.  When a previously encountered file name is found again, a
message is displayed indicating that the later file is \"hidden\" by
the earlier.

For example, suppose `load-path' is set to

\(\"/usr/gnu/emacs/site-lisp\" \"/usr/gnu/emacs/share/emacs/19.30/lisp\")

and that each of these directories contains a file called XXX.el.  Then
XXX.el in the site-lisp directory is referred to by all of:
\(require 'XXX), (autoload .... \"XXX\"), (load-library \"XXX\") etc.

The first XXX.el file prevents emacs from seeing the second (unless
the second is loaded explicitly via load-file).

When not intended, such shadowings can be the source of subtle
problems.  For example, the above situation may have arisen because the
XXX package was not distributed with versions of emacs prior to
19.30.  An emacs maintainer downloaded XXX from elsewhere and installed
it.  Later, XXX was updated and included in the emacs distribution.
Unless the emacs maintainer checks for this, the new version of XXX
will be hidden behind the old (which may no longer work with the new
emacs version).

This function performs these checks and flags all possible
shadowings.  Because a .el file may exist without a corresponding .elc
\(or vice-versa), these suffixes are essentially ignored.  A file
XXX.elc in an early directory (that does not contain XXX.el) is
considered to shadow a later file XXX.el, and vice-versa.

When run interactively, the shadowings (if any) are displayed in a
buffer called `*Shadows*'.  Shadowings are located by calling the
\(non-interactive) companion function, `find-emacs-lisp-shadows'.

arguments: ()
" t nil)

;;;***

;;;### (autoloads (load-default-sounds load-sound-file) "sound" "lisp/sound.el")

(or sound-alist (setq sound-alist '((ready nil) (warp nil))))

(autoload 'load-sound-file "sound" "\
Read in an audio-file and add it to the sound-alist.

FILENAME can either be absolute or relative, in which case the file will
be searched in the directories given by `default-sound-directory-list'.
When looking for the file, the extensions given by `sound-extension-list' are
also tried in the given order.

You can only play sound files if you are running on display 0 of the
console of a machine with native sound support or running a NetAudio
or ESD server and XEmacs has the necessary sound support compiled in.

The sound file must be in the Sun/NeXT U-LAW format, except on Linux
and MS Windows, where .wav files are also supported by the sound card
drivers.

arguments: (FILENAME SOUND-NAME &optional VOLUME)
" t nil)

(autoload 'load-default-sounds "sound" "\
Load and install some sound files as beep-types, using
`load-sound-file'.  This only works if you're on display 0 of the
console of a machine with native sound support or running a NetAudio
server and XEmacs has the necessary sound support compiled in.

arguments: ()
" t nil)

;;;***

;;;### (autoloads (test-emacs-test-file) "test-harness" "lisp/test-harness.el")

(autoload 'test-emacs-test-file "test-harness" "\
Test a file of Lisp code named FILENAME.
The output file's name is made by appending `c' to the end of FILENAME.

arguments: (FILENAME)
" t nil)

;;;***

;;;### (autoloads (ask-user-about-supersession-threat ask-user-about-lock) "userlock" "lisp/userlock.el")

(autoload 'ask-user-about-lock "userlock" "\
Ask user wanting to edit FILENAME, locked by OTHER-USER, what to do.
This function has a choice of three things to do:
  do (signal 'file-locked (list FILENAME OTHER-USER))
    to refrain from editing the file
  return t (grab the lock on the file)
  return nil (edit the file even though it is locked).
You can rewrite it to use any criteria you like to choose which one to do.

arguments: (FILENAME OTHER-USER)
" nil nil)

(autoload 'ask-user-about-supersession-threat "userlock" "\
Ask user who is about to modify an obsolete buffer what to do.
This function has two choices: it can return, in which case the modification
of the buffer will proceed, or it can (signal 'file-supersession (FILENAME)),
in which case the proposed buffer modification will not be made.

You can rewrite this to use any criteria you like to choose which one to do.
The buffer in question is current when this function is called.

arguments: (FILENAME)
" nil nil)

;;;***

;;;### (autoloads (toggle-truncate-lines auto-view-mode view-major-mode view-mode view-minor-mode view-buffer-other-window view-file-other-window view-buffer view-file view-mode-line-string) "view-less" "lisp/view-less.el")

(defvar view-minor-mode nil "\
Non-nil when view-mode is active.  Call `view-mode' to toggle.")

(defvar view-minor-mode-map (let ((map (make-keymap))) (set-keymap-name map 'view-minor-mode-map) (suppress-keymap map) (define-key map "-" 'negative-argument) (define-key map " " 'scroll-up) (define-key map "f" 'scroll-up) (define-key map "b" 'scroll-down) (define-key map 'backspace 'scroll-down) (define-key map 'delete 'scroll-down) (define-key map "" 'view-scroll-lines-up) (define-key map "\n" 'view-scroll-lines-up) (define-key map "e" 'view-scroll-lines-up) (define-key map "j" 'view-scroll-lines-up) (define-key map "y" 'view-scroll-lines-down) (define-key map "k" 'view-scroll-lines-down) (define-key map "d" 'view-scroll-some-lines-up) (define-key map "u" 'view-scroll-some-lines-down) (define-key map "r" 'recenter) (define-key map "t" 'toggle-truncate-lines) (define-key map "N" 'view-buffer) (define-key map "E" 'view-file) (define-key map "P" 'view-buffer) (define-key map "!" 'shell-command) (define-key map "|" 'shell-command-on-region) (define-key map "=" 'what-line) (define-key map "?" 'view-search-backward) (define-key map "h" 'view-mode-describe) (define-key map "s" 'view-repeat-search) (define-key map "n" 'view-repeat-search) (define-key map "/" 'view-search-forward) (define-key map "\\" 'view-search-backward) (define-key map "g" 'view-goto-line) (define-key map "G" 'view-last-windowful) (define-key map "%" 'view-goto-percent) (define-key map "p" 'view-goto-percent) (define-key map "m" 'point-to-register) (define-key map "'" 'register-to-point) (define-key map "C" 'view-cleanup-backspaces) (define-key map "" 'view-quit) (define-key map "" 'view-quit-toggle-ro) (define-key map "q" 'view-quit) map))

(defvar view-mode-line-string " View" "\
*String to display in the modeline when View mode is active.
Set this to nil if you don't want a modeline indicator.")

(defvar view-mode-map (let ((map (copy-keymap view-minor-mode-map))) (set-keymap-name map 'view-mode-map) map))

(autoload 'view-file "view-less" "\
Find FILENAME, enter view mode.  With prefix arg OTHER-WINDOW-P, use other window.

arguments: (FILENAME &optional OTHER-WINDOW-P)
" t nil)

(autoload 'view-buffer "view-less" "\
Switch to BUFFER, enter view mode.  With prefix arg use other window.

arguments: (BUFFER &optional OTHER-WINDOW-P)
" t nil)

(autoload 'view-file-other-window "view-less" "\
Find FILENAME in other window, and enter view mode.

arguments: (FILENAME)
" t nil)

(autoload 'view-buffer-other-window "view-less" "\
Switch to BUFFER in another window, and enter view mode.

arguments: (BUFFER)
" t nil)

(autoload 'view-minor-mode "view-less" "\
Minor mode for viewing text, with bindings like `less'.
Commands are:
\\<view-minor-mode-map>
0..9	prefix args
-	prefix minus
\\[scroll-up]	page forward
\\[scroll-down]	page back
\\[view-scroll-lines-up]	scroll prefix-arg lines forward, default 1.
\\[view-scroll-lines-down]	scroll prefix-arg lines backward, default 1.
\\[view-scroll-some-lines-down]	scroll prefix-arg lines backward, default 10.
\\[view-scroll-some-lines-up]	scroll prefix-arg lines forward, default 10.
\\[what-line]	print line number
\\[view-mode-describe]	print this help message
\\[view-search-forward]	regexp search, uses previous string if you just hit RET
\\[view-search-backward]	as above but searches backward
\\[view-repeat-search]	repeat last search
\\[view-goto-line]	goto line prefix-arg, default 1
\\[view-last-windowful]	goto line prefix-arg, default last line
\\[view-goto-percent]	goto a position by percentage
\\[toggle-truncate-lines]	toggle truncate-lines
\\[view-file]	view another file
\\[view-buffer]	view another buffer
\\[view-cleanup-backspaces]	cleanup backspace constructions
\\[shell-command]	execute a shell command
\\[shell-command-on-region]	execute a shell command with the region as input
\\[view-quit]	exit view-mode, and bury the current buffer.

If invoked with the optional (prefix) arg non-nil, view-mode cleans up
backspace constructions.

More precisely:
\\{view-minor-mode-map}

arguments: (&optional PREV-BUFFER EXIT-ACTION)
" t nil)

(autoload 'view-mode "view-less" "\
View the current buffer using view-minor-mode.  This exists to be 99.9%
compatible with the implementations of `view-mode' in view.el and older
versions of view-less.el.

arguments: (&optional PREV-BUFFER EXIT-ACTION CLEAN-BS)
" t nil)

(autoload 'view-major-mode "view-less" "\
View the current buffer using view-mode, as a major mode.
This function has a nonstandard name because `view-mode' is wrongly
named but is like this for compatibility reasons.

arguments: (&optional PREV-BUFFER EXIT-ACTION CLEAN-BS)
" t nil)

(autoload 'auto-view-mode "view-less" "\
If the file of the current buffer is not writable, call view-mode.
This is meant to be added to `find-file-hooks'.

arguments: ()
" nil nil)

(autoload 'toggle-truncate-lines "view-less" "\
Toggles the values of truncate-lines.
Positive prefix arg sets, negative disables.

arguments: (&optional P)
" t nil)

;;;***

;;;### (autoloads (widget-minor-mode widget-browse-other-window widget-browse widget-browse-at) "wid-browse" "lisp/wid-browse.el")

(autoload 'widget-browse-at "wid-browse" "\
Browse the widget under point.

arguments: (POS)
" t nil)

(autoload 'widget-browse "wid-browse" "\
Create a widget browser for WIDGET.

arguments: (WIDGET)
" t nil)

(autoload 'widget-browse-other-window "wid-browse" "\
Show widget browser for WIDGET in other window.

arguments: (&optional WIDGET)
" t nil)

(autoload 'widget-minor-mode "wid-browse" "\
Togle minor mode for traversing widgets.
With arg, turn widget mode on if and only if arg is positive.

arguments: (&optional ARG)
" t nil)

;;;***

;;;### (autoloads (widget-setup widget-insert widget-convert widget-delete widget-create widget-prompt-value widgetp) "wid-edit" "lisp/wid-edit.el")

(autoload 'widgetp "wid-edit" "\
Return non-nil iff WIDGET is a widget.

arguments: (WIDGET)
" nil nil)

(autoload 'widget-prompt-value "wid-edit" "\
Prompt for a value matching WIDGET.
Prompt with PROMPT, or WIDGET's :tag otherwise.
The current value is assumed to be VALUE, unless UNBOUND is non-nil.

arguments: (WIDGET &optional PROMPT VALUE UNBOUND)
" nil nil)

(autoload 'widget-create "wid-edit" "\
Create a widget of type TYPE.

TYPE is copied, then converted to a widget using the keyword arguments ARGS.

arguments: (TYPE &rest ARGS)
" nil nil)

(autoload 'widget-delete "wid-edit" "\
Delete WIDGET.

arguments: (WIDGET)
" nil nil)

(autoload 'widget-convert "wid-edit" "\
Convert TYPE to a widget without inserting it in the buffer.
The optional ARGS are additional keyword arguments.

The widget's :args property is set from the longest tail of ARGS whose cdr
is not a keyword, or from the longest tail of TYPE's :args property whose
cdr is not a keyword.  Keyword arguments from ARGS are set, and the :value
property (if any) is converted from external to internal format.

arguments: (TYPE &rest ARGS)
" nil nil)

(autoload 'widget-insert "wid-edit" "\
Call `insert' with ARGS even if surrounding text is read only.

arguments: (&rest ARGS)
" nil nil)

(autoload 'widget-setup "wid-edit" "\
Setup current buffer so editing string widgets works.

arguments: ()
" nil nil)

;;;***

;;;### (autoloads (x-font-menu-font-data x-reset-device-font-menus) "x-font-menu" "lisp/x-font-menu.el")

(autoload 'x-reset-device-font-menus "x-font-menu" "\


arguments: (DEVICE &optional DEBUG)
" nil nil)

(autoload 'x-font-menu-font-data "x-font-menu" "\


arguments: (FACE DCACHE)
" nil nil)

;;;***

(provide 'auto-autoloads)
