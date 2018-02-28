;;; DO NOT MODIFY THIS FILE -*- coding: raw-text-unix -*-
;;;###coding system: raw-text-unix
(if (featurep 'mule-autoloads) (error "Feature mule-autoloads already loaded"))

;;;### (autoloads (check-ccl-program define-ccl-program declare-ccl-program ccl-dump ccl-compile) "ccl" "mule/ccl.el")

(autoload 'ccl-compile "ccl" "\
Return a compiled code of CCL-PROGRAM as a vector of integer.

arguments: (CCL-PROGRAM)
" nil nil)

(autoload 'ccl-dump "ccl" "\
Disassemble compiled CCL-CODE.

arguments: (CCL-CODE)
" nil nil)

(autoload 'declare-ccl-program "ccl" "\
Declare NAME as a name of CCL program.

This macro exists for backward compatibility.  In the old version of
Emacs, to compile a CCL program which calls another CCL program not
yet defined, it must be declared as a CCL program in advance.  But,
now CCL program names are resolved not at compile time but before
execution.

Optional arg VECTOR is a compiled CCL code of the CCL program.

arguments: (NAME &optional VECTOR)
" nil 'macro)

(autoload 'define-ccl-program "ccl" "\
Set NAME to be the compiled CCL code of CCL-PROGRAM.

CCL-PROGRAM has this form:
	(BUFFER_MAGNIFICATION
	 CCL_MAIN_CODE
	 [ CCL_EOF_CODE ])

BUFFER_MAGNIFICATION is an integer value specifying the approximate
output buffer magnification size compared with the bytes of input data
text.  If the value is zero, the CCL program can't execute `read' and
`write' commands.

CCL_MAIN_CODE and CCL_EOF_CODE are CCL program codes.  CCL_MAIN_CODE is
executed first.  If there are no more input data when a `read' command is
executed in CCL_MAIN_CODE, CCL_EOF_CODE is executed.  If CCL_MAIN_CODE is
terminated, CCL_EOF_CODE is not executed.

Here's the syntax of CCL program code in BNF notation.  The lines starting
with two semicolons (and optional leading spaces) describe the semantics.

CCL_MAIN_CODE := CCL_BLOCK

CCL_EOF_CODE := CCL_BLOCK

CCL_BLOCK := STATEMENT | (STATEMENT [STATEMENT ...])

STATEMENT :=
	SET | IF | BRANCH | LOOP | REPEAT | BREAK | READ | WRITE | CALL
	| TRANSLATE | MAP | LOOKUP | END

SET :=	(REG = EXPRESSION)
	| (REG ASSIGNMENT_OPERATOR EXPRESSION)
	;; The following form is the same as (r0 = INT-OR-CHAR).
	| INT-OR-CHAR

EXPRESSION := ARG | (EXPRESSION OPERATOR ARG)

;; Evaluate EXPRESSION.  If the result is nonzero, execute
;; CCL_BLOCK_0.  Otherwise, execute CCL_BLOCK_1.
IF :=	(if EXPRESSION CCL_BLOCK_0 [CCL_BLOCK_1])

;; Evaluate EXPRESSION.  Provided that the result is N, execute
;; CCL_BLOCK_N.
BRANCH := (branch EXPRESSION CCL_BLOCK_0 [CCL_BLOCK_1 ...])

;; Execute STATEMENTs until (break) or (end) is executed.
LOOP := (loop STATEMENT [STATEMENT ...])

;; Terminate the innermost loop.
BREAK := (break)

REPEAT :=
	;; Jump to the head of the innermost loop.
	(repeat)
	;; Same as: ((write [REG | INT-OR-CHAR | string])
	;;	     (repeat))
	| (write-repeat [REG | INT-OR-CHAR | string])
	;; Same as: ((write REG [ARRAY])
	;;	     (read REG)
	;;	     (repeat))
	| (write-read-repeat REG [ARRAY])
	;; Same as: ((write INT-OR-CHAR)
	;;	     (read REG)
	;;	     (repeat))
	| (write-read-repeat REG INT-OR-CHAR)

READ := ;; Set REG_0 to a byte read from the input text, set REG_1
	;; to the next byte read, and so on. Note that \"byte\" here means
	;; \"some octet from XEmacs' internal representation\", which may
	;; not be that useful to you when non-ASCII characters are involved.
        ;;
        ;; Yes, this is exactly the opposite of what (write ...) does.
	(read REG_0 [REG_1 ...])
	;; Same as: ((read REG)
	;;	     (if (REG OPERATOR ARG) CCL_BLOCK_0 CCL_BLOCK_1))
	| (read-if (REG OPERATOR ARG) CCL_BLOCK_0 [CCL_BLOCK_1])
	;; Same as: ((read REG)
	;;	     (branch REG CCL_BLOCK_0 [CCL_BLOCK_1 ...]))
	| (read-branch REG CCL_BLOCK_0 [CCL_BLOCK_1 ...])
	;; Read a character from the input text, splitting it into its
	;; multibyte representation. Set REG_0 to the charset ID of the
	;; character, and set REG_1 to the code point of the character.  If
	;; the dimension of charset is two, set REG_1 to ((CODE0 << 7) |
	;; CODE1), where CODE0 is the first code point and CODE1 is the
	;; second code point.
	| (read-multibyte-character REG_0 REG_1)

WRITE :=
	;; Write REG_0, REG_1, ... to the output buffer.  If REG_N is
	;; a multibyte character, write the corresponding multibyte
	;; representation.
	(write REG_0 [REG_1 ...])
	;; Same as: ((r7 = EXPRESSION)
	;;	     (write r7))
	| (write EXPRESSION)
	;; Write the value of `INT-OR-CHAR' to the output buffer.  If it
	;; is a multibyte character, write the corresponding multibyte
	;; representation.
	| (write INT-OR-CHAR)
	;; Write the byte sequence of `string' as is to the output
	;; buffer.  It is encoded by binary coding system, thus,
        ;; by this operation, you cannot write multibyte string
        ;; as it is.
	| (write string)
	;; Same as: (write string)
	| string
	;; Provided that the value of REG is N, write Nth element of
	;; ARRAY to the output buffer.  If it is a multibyte
	;; character, write the corresponding multibyte
	;; representation.
	| (write REG ARRAY)
	;; Write a multibyte representation of a character whose
	;; charset ID is REG_0 and code point is REG_1.  If the
	;; dimension of the charset is two, REG_1 should be ((CODE0 <<
	;; 7) | CODE1), where CODE0 is the first code point and CODE1
	;; is the second code point of the character.
	| (write-multibyte-character REG_0 REG_1)

;; Call CCL program whose name is ccl-program-name.
CALL := (call ccl-program-name)

TRANSLATE := ;; Not implemented under XEmacs, except mule-to-unicode and
	     ;; unicode-to-mule.
	     (translate-character REG(table) REG(charset) REG(codepoint)) 
	     | (translate-character SYMBOL REG(charset) REG(codepoint)) 
	     | (mule-to-unicode REG(charset) REG(codepoint))
	     | (unicode-to-mule REG(unicode,code) REG(CHARSET))

LOOKUP :=
	(lookup-character SYMBOL REG(charset) REG(codepoint))
	| (lookup-integer SYMBOL REG(integer))
        ;; SYMBOL refers to a table defined by `define-hash-translation-table'.

MAP :=
     (iterate-multiple-map REG REG MAP-IDs)
     | (map-multiple REG REG (MAP-SET))
     | (map-single REG REG MAP-ID)
MAP-IDs := MAP-ID ...
MAP-SET := MAP-IDs | (MAP-IDs) MAP-SET
MAP-ID := INT-OR-CHAR

;; Terminate the CCL program.
END := (end)

;; CCL registers. These can contain any integer value.  As r7 is used by the
;; CCL interpreter itself, its value can change unexpectedly.
REG := r0 | r1 | r2 | r3 | r4 | r5 | r6 | r7

ARG := REG | INT-OR-CHAR

OPERATOR :=
	;; Normal arithmetical operators (same meaning as C code).
	+ | - | * | / | %

	;; Bitwise operators (same meaning as C code)
	| & | `|' | ^

	;; Shifting operators (same meaning as C code)
	| << | >>

	;; (REG = ARG_0 <8 ARG_1) means:
	;;	(REG = ((ARG_0 << 8) | ARG_1))
	| <8

	;; (REG = ARG_0 >8 ARG_1) means:
	;;	((REG = (ARG_0 >> 8))
	;;	 (r7 = (ARG_0 & 255)))
	| >8

	;; (REG = ARG_0 // ARG_1) means:
	;;	((REG = (ARG_0 / ARG_1))
	;;	 (r7 = (ARG_0 % ARG_1)))
	| //

	;; Normal comparing operators (same meaning as C code)
	| < | > | == | <= | >= | !=

	;; If ARG_0 and ARG_1 are higher and lower byte of Shift-JIS
	;; code, and CHAR is the corresponding JISX0208 character,
	;; (REG = ARG_0 de-sjis ARG_1) means:
	;;	((REG = CODE0)
	;;	 (r7 = CODE1))
	;; where CODE0 is the first code point of CHAR, CODE1 is the
	;; second code point of CHAR.
	| de-sjis

	;; If ARG_0 and ARG_1 are the first and second code point of
	;; JISX0208 character CHAR, and SJIS is the corresponding
	;; Shift-JIS code,
	;; (REG = ARG_0 en-sjis ARG_1) means:
	;;	((REG = HIGH)
	;;	 (r7 = LOW))
	;; where HIGH is the higher byte of SJIS, LOW is the lower
	;; byte of SJIS.
	| en-sjis

ASSIGNMENT_OPERATOR :=
	;; Same meaning as C code
	+= | -= | *= | /= | %= | &= | `|=' | ^= | <<= | >>=

	;; (REG <8= ARG) is the same as:
	;;	((REG <<= 8)
	;;	 (REG |= ARG))
	| <8= 

	;; (REG >8= ARG) is the same as:
	;;	((r7 = (REG & 255))
	;;	 (REG >>= 8))

	;; (REG //= ARG) is the same as:
	;;	((r7 = (REG % ARG))
	;;	 (REG /= ARG))
	| //=

ARRAY := `[' INT-OR-CHAR ... `]'

INT-OR-CHAR := integer | character


arguments: (NAME CCL-PROGRAM &optional DOC)
" nil 'macro)

(autoload 'check-ccl-program "ccl" "\
Check validity of CCL-PROGRAM.
If CCL-PROGRAM is a symbol denoting a CCL program, return
CCL-PROGRAM, else return nil.
If CCL-PROGRAM is a vector and optional arg NAME (symbol) is supplied,
register CCL-PROGRAM by name NAME, and return NAME.

arguments: (CCL-PROGRAM &optional NAME)
" nil 'macro)

;;;***

;;;### (autoloads (encode-hz-buffer encode-hz-region decode-hz-buffer decode-hz-region) "china-util" "mule/china-util.el")

(autoload 'decode-hz-region "china-util" "\
Decode HZ/ZW encoded text in the current region.
Return the length of resulting text.

arguments: (BEG END)
" t nil)

(autoload 'decode-hz-buffer "china-util" "\
Decode HZ/ZW encoded text in the current buffer.

arguments: ()
" t nil)

(autoload 'encode-hz-region "china-util" "\
Encode the text in the current region to HZ.
Return the length of resulting text.

arguments: (BEG END)
" t nil)

(autoload 'encode-hz-buffer "china-util" "\
Encode the text in the current buffer to HZ.

arguments: ()
" t nil)

;;;***

;;;### (autoloads (devanagari-decode-itrans-region devanagari-encode-itrans-region in-is13194-devanagari-pre-write-conversion devanagari-decompose-to-is13194-region in-is13194-devanagari-post-read-conversion devanagari-compose-from-is13194-region devanagari-compose-region devanagari-compose-string devanagari-decompose-region devanagari-decompose-string char-to-glyph-devanagari indian-to-devanagari-string devanagari-to-indian-region indian-to-devanagari-region devanagari-to-indian indian-to-devanagari) "devan-util" "mule/devan-util.el")

(autoload 'indian-to-devanagari "devan-util" "\
Convert IS 13194 character CHAR to Devanagari basic characters.
If CHAR is not IS 13194, return CHAR as is.

arguments: (CHAR)
" nil nil)

(autoload 'devanagari-to-indian "devan-util" "\
Convert Devanagari basic character CHAR to IS 13194 characters.
If CHAR is not Devanagari basic character, return CHAR as is.

arguments: (CHAR)
" nil nil)

(autoload 'indian-to-devanagari-region "devan-util" "\
Convert IS 13194 characters in region to Devanagari basic characters.
When called from a program, expects two arguments,
positions (integers or markers) specifying the region.

arguments: (FROM TO)
" t nil)

(autoload 'devanagari-to-indian-region "devan-util" "\
Convert Devanagari basic characters in region to Indian characters.
When called from a program, expects two arguments,
positions (integers or markers) specifying the region.

arguments: (FROM TO)
" t nil)

(autoload 'indian-to-devanagari-string "devan-util" "\
Convert Indian characters in STRING to Devanagari Basic characters.

arguments: (STRING)
" nil nil)

(autoload 'char-to-glyph-devanagari "devan-util" "\
Convert Devanagari characters in STRING to Devanagari glyphs.  
Ligatures and special rules are processed.

arguments: (STRING &rest LANGS)
" nil nil)

(autoload 'devanagari-decompose-string "devan-util" "\
Decompose Devanagari string STR

arguments: (STR)
" nil nil)

(autoload 'devanagari-decompose-region "devan-util" "\


arguments: (FROM TO)
" t nil)

(autoload 'devanagari-compose-string "devan-util" "\


arguments: (STR &rest LANGS)
" nil nil)

(autoload 'devanagari-compose-region "devan-util" "\


arguments: (FROM TO &rest LANGS)
" t nil)

(autoload 'devanagari-compose-from-is13194-region "devan-util" "\
Compose IS 13194 characters in the region to Devanagari characters.

arguments: (FROM TO)
" t nil)

(autoload 'in-is13194-devanagari-post-read-conversion "devan-util" "\


arguments: (LEN)
" nil nil)

(autoload 'devanagari-decompose-to-is13194-region "devan-util" "\
Decompose Devanagari characters in the region to IS 13194 characters.

arguments: (FROM TO)
" t nil)

(autoload 'in-is13194-devanagari-pre-write-conversion "devan-util" "\


arguments: (FROM TO)
" nil nil)

(autoload 'devanagari-encode-itrans-region "devan-util" "\


arguments: (FROM TO)
" t nil)

(autoload 'devanagari-decode-itrans-region "devan-util" "\


arguments: (FROM TO)
" t nil)

;;;***

;;;### (autoloads (ethio-write-file ethio-find-file ethio-java-to-fidel-buffer ethio-fidel-to-java-buffer ethio-tex-to-fidel-buffer ethio-fidel-to-tex-buffer ethio-input-special-character ethio-replace-space ethio-modify-vowel ethio-fidel-to-sera-marker ethio-fidel-to-sera-mail ethio-fidel-to-sera-mail-or-marker ethio-fidel-to-sera-buffer ethio-fidel-to-sera-region ethio-sera-to-fidel-marker ethio-sera-to-fidel-mail ethio-sera-to-fidel-mail-or-marker ethio-sera-to-fidel-buffer ethio-sera-to-fidel-region setup-ethiopic-environment-internal) "ethio-util" "mule/ethio-util.el")

(autoload 'setup-ethiopic-environment-internal "ethio-util" "\


arguments: ()
" nil nil)

(autoload 'ethio-sera-to-fidel-region "ethio-util" "\
Convert the characters in region from SERA to FIDEL.
The variable `ethio-primary-language' specifies the primary language
and `ethio-secondary-language' specifies the secondary.

If the 3rd parameter SECONDARY is given and non-nil, assume the region
begins with the secondary language; otherwise with the primary
language.

If the 4th parameter FORCE is given and non-nil, perform conversion
even if the buffer is read-only.

See also the descriptions of the variables
`ethio-use-colon-for-colon' and
`ethio-use-three-dot-question'.

arguments: (BEG END &optional SECONDARY FORCE)
" t nil)

(autoload 'ethio-sera-to-fidel-buffer "ethio-util" "\
Convert the current buffer from SERA to FIDEL.

The variable `ethio-primary-language' specifies the primary
language and `ethio-secondary-language' specifies the secondary.

If the 1st optional parameter SECONDARY is non-nil, assume the buffer
begins with the secondary language; otherwise with the primary
language.

If the 2nd optional parametr FORCE is non-nil, perform conversion even if the
buffer is read-only.

See also the descriptions of the variables
`ethio-use-colon-for-colon' and
`ethio-use-three-dot-question'.

arguments: (&optional SECONDARY FORCE)
" t nil)

(autoload 'ethio-sera-to-fidel-mail-or-marker "ethio-util" "\
Execute ethio-sera-to-fidel-mail or ethio-sera-to-fidel-marker depending on the current major mode.
If in rmail-mode or in mail-mode, execute the former; otherwise latter.

arguments: (&optional ARG)
" t nil)

(autoload 'ethio-sera-to-fidel-mail "ethio-util" "\
Convert SERA to FIDEL to read/write mail and news.

If the buffer contains the markers \"<sera>\" and \"</sera>\",
convert the segments between them into FIDEL.

If invoked interactively and there is no marker, convert the subject field
and the body into FIDEL using `ethio-sera-to-fidel-region'.

arguments: (&optional ARG)
" t nil)

(autoload 'ethio-sera-to-fidel-marker "ethio-util" "\
Convert the regions surrounded by \"<sera>\" and \"</sera>\" from SERA to FIDEL.
Assume that each region begins with `ethio-primary-language'.
The markers \"<sera>\" and \"</sera>\" themselves are not deleted.

arguments: (&optional FORCE)
" t nil)

(autoload 'ethio-fidel-to-sera-region "ethio-util" "\
Replace all the FIDEL characters in the region to the SERA format.
The variable `ethio-primary-language' specifies the primary
language and `ethio-secondary-language' specifies the secondary.

If the 3dr parameter SECONDARY is given and non-nil, try to convert
the region so that it begins in the secondary language; otherwise with
the primary language.

If the 4th parameter FORCE is given and non-nil, convert even if the
buffer is read-only.

See also the descriptions of the variables
`ethio-use-colon-for-colon', `ethio-use-three-dot-question',
`ethio-quote-vowel-always' and `ethio-numeric-reduction'.

arguments: (BEGIN END &optional SECONDARY FORCE)
" t nil)

(autoload 'ethio-fidel-to-sera-buffer "ethio-util" "\
Replace all the FIDEL characters in the current buffer to the SERA format.
The variable `ethio-primary-language' specifies the primary
language and `ethio-secondary-language' specifies the secondary.

If the 1st optional parameter SECONDARY is non-nil, try to convert the
region so that it begins in the secondary language; otherwise with the
primary language.

If the 2nd optional parameter FORCE is non-nil, convert even if the
buffer is read-only.

See also the descriptions of the variables
`ethio-use-colon-for-colon', `ethio-use-three-dot-question',
`ethio-quote-vowel-always' and `ethio-numeric-reduction'.

arguments: (&optional SECONDARY FORCE)
" t nil)

(autoload 'ethio-fidel-to-sera-mail-or-marker "ethio-util" "\
Execute ethio-fidel-to-sera-mail or ethio-fidel-to-sera-marker depending on the current major mode.
If in rmail-mode or in mail-mode, execute the former; otherwise latter.

arguments: (&optional ARG)
" t nil)

(autoload 'ethio-fidel-to-sera-mail "ethio-util" "\
Convert FIDEL to SERA to read/write mail and news.

If the body contains at least one Ethiopic character,
 1) insert the string \"<sera>\" at the beginning of the body,
 2) insert \"</sera>\" at the end of the body, and
 3) convert the body into SERA.

The very same procedure applies to the subject field, too.

arguments: ()
" t nil)

(autoload 'ethio-fidel-to-sera-marker "ethio-util" "\
Convert the regions surrounded by \"<sera>\" and \"</sera>\" from FIDEL to SERA.
The markers \"<sera>\" and \"</sera>\" themselves are not deleted.

arguments: (&optional FORCE)
" t nil)

(autoload 'ethio-modify-vowel "ethio-util" "\
Modify the vowel of the FIDEL that is under the cursor.

arguments: ()
" t nil)

(autoload 'ethio-replace-space "ethio-util" "\
Replace ASCII spaces with Ethiopic word separators in the region.

In the specified region, replace word separators surrounded by two
Ethiopic characters, depending on the first parameter CH, which should
be 1, 2, or 3.

If CH = 1, word separator will be replaced with an ASCII space.
If CH = 2, with two ASCII spaces.
If CH = 3, with the Ethiopic colon-like word separator.

The second and third parameters BEGIN and END specify the region.

arguments: (CH BEGIN END)
" t nil)

(autoload 'ethio-input-special-character "ethio-util" "\
Allow the user to input special characters.

arguments: (ARG)
" t nil)

(autoload 'ethio-fidel-to-tex-buffer "ethio-util" "\
Convert each fidel characters in the current buffer into a fidel-tex command.
Each command is always surrounded by braces.

arguments: ()
" t nil)

(autoload 'ethio-tex-to-fidel-buffer "ethio-util" "\
Convert fidel-tex commands in the current buffer into fidel chars.

arguments: ()
" t nil)

(autoload 'ethio-fidel-to-java-buffer "ethio-util" "\
Convert Ethiopic characters into the Java escape sequences.

Each escape sequence is of the form \\uXXXX, where XXXX is the
character's codepoint (in hex) in Unicode.

If `ethio-java-save-lowercase' is non-nil, use [0-9a-f].
Otherwise, [0-9A-F].

arguments: ()
" nil nil)

(autoload 'ethio-java-to-fidel-buffer "ethio-util" "\
Convert the Java escape sequences into corresponding Ethiopic characters.

arguments: ()
" nil nil)

(autoload 'ethio-find-file "ethio-util" "\
Transcribe file content into Ethiopic dependig on filename suffix.

arguments: ()
" nil nil)

(autoload 'ethio-write-file "ethio-util" "\
Transcribe Ethiopic characters in ASCII depending on the file extension.

arguments: ()
" nil nil)

;;;***

;;;### (autoloads ('arabic-iso-8bit-with-esc 'greek-iso-8bit-with-esc 'hebrew-iso-8bit-with-esc 'cyrillic-iso-8bit-with-esc 'iso-latin-5-with-esc 'iso-latin-9-with-esc 'iso-latin-4-with-esc 'iso-latin-3-with-esc 'iso-latin-2-with-esc) "iso-with-esc" "mule/iso-with-esc.el")

(define-coding-system-alias 'iso-latin-1-with-esc 'iso-2022-8)

(autoload-coding-system 'iso-latin-2-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'iso-latin-3-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'iso-latin-4-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'iso-latin-9-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'iso-latin-5-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'cyrillic-iso-8bit-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'hebrew-iso-8bit-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'greek-iso-8bit-with-esc '(load "iso-with-esc"))

(autoload-coding-system 'arabic-iso-8bit-with-esc '(load "iso-with-esc"))

;;;***

;;;### (autoloads (read-hiragana-string japanese-zenkaku-region japanese-hankaku-region japanese-hiragana-region japanese-katakana-region japanese-zenkaku japanese-hankaku japanese-hiragana japanese-katakana setup-japanese-environment-internal) "japan-util" "mule/japan-util.el")

(autoload 'setup-japanese-environment-internal "japan-util" "\


arguments: ()
" nil nil)

(autoload 'japanese-katakana "japan-util" "\
Convert argument to Katakana and return that.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.
Optional argument HANKAKU t means to convert to `hankaku' Katakana
 (`japanese-jisx0201-kana'), in which case return value
 may be a string even if OBJ is a character if two Katakanas are
 necessary to represent OBJ.

arguments: (OBJ &optional HANKAKU)
" nil nil)

(autoload 'japanese-hiragana "japan-util" "\
Convert argument to Hiragana and return that.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.

arguments: (OBJ)
" nil nil)

(autoload 'japanese-hankaku "japan-util" "\
Convert argument to `hankaku' and return that.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.
Optional argument ASCII-ONLY non-nil means to return only ASCII character.

arguments: (OBJ &optional ASCII-ONLY)
" nil nil)

(autoload 'japanese-zenkaku "japan-util" "\
Convert argument to `zenkaku' and return that.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.

arguments: (OBJ)
" nil nil)

(autoload 'japanese-katakana-region "japan-util" "\
Convert Japanese `hiragana' chars in the region to `katakana' chars.
Optional argument HANKAKU t means to convert to `hankaku katakana' character
of which charset is `japanese-jisx0201-kana'.

arguments: (FROM TO &optional HANKAKU)
" t nil)

(autoload 'japanese-hiragana-region "japan-util" "\
Convert Japanese `katakana' chars in the region to `hiragana' chars.

arguments: (FROM TO)
" t nil)

(autoload 'japanese-hankaku-region "japan-util" "\
Convert Japanese `zenkaku' chars in the region to `hankaku' chars.
`Zenkaku' chars belong to `japanese-jisx0208'
`Hankaku' chars belong to `ascii' or `japanese-jisx0201-kana'.
Optional argument ASCII-ONLY non-nil means to convert only to ASCII char.

arguments: (FROM TO &optional ASCII-ONLY)
" t nil)

(autoload 'japanese-zenkaku-region "japan-util" "\
Convert hankaku' chars in the region to Japanese `zenkaku' chars.
`Zenkaku' chars belong to `japanese-jisx0208'
`Hankaku' chars belong to `ascii' or `japanese-jisx0201-kana'.
Optional argument KATAKANA-ONLY non-nil means to convert only KATAKANA char.

arguments: (FROM TO &optional KATAKANA-ONLY)
" t nil)

(autoload 'read-hiragana-string "japan-util" "\
Read a Hiragana string from the minibuffer, prompting with string PROMPT.
If non-nil, second arg INITIAL-INPUT is a string to insert before reading.

arguments: (PROMPT &optional INITIAL-INPUT)
" nil nil)

;;;***

;;;### (autoloads (setup-korean-environment-internal) "korea-util" "mule/korea-util.el")

(defvar default-korean-keyboard (if (string-match "3" (or (getenv "HANGUL_KEYBOARD_TYPE") "")) "3" "") "\
*The kind of Korean keyboard for Korean input method.
\"\" for 2, \"3\" for 3.")

(autoload 'setup-korean-environment-internal "korea-util" "\


arguments: ()
" nil nil)

;;;***

;;;### (autoloads (lao-compose-region lao-composition-function lao-transcribe-roman-to-lao-string lao-transcribe-single-roman-syllable-to-lao lao-compose-string) "lao-util" "mule/lao-util.el")

(autoload 'lao-compose-string "lao-util" "\


arguments: (STR)
" nil nil)

(autoload 'lao-transcribe-single-roman-syllable-to-lao "lao-util" "\
Transcribe a Romanized Lao syllable in the region FROM and TO to Lao string.
Only the first syllable is transcribed.
The value has the form: (START END LAO-STRING), where
START and END are the beginning and end positions of the Roman Lao syllable,
LAO-STRING is the Lao character transcription of it.

Optional 3rd arg STR, if non-nil, is a string to search for Roman Lao
syllable.  In that case, FROM and TO are indexes to STR.

arguments: (FROM TO &optional STR)
" nil nil)

(autoload 'lao-transcribe-roman-to-lao-string "lao-util" "\
Transcribe Romanized Lao string STR to Lao character string.

arguments: (STR)
" nil nil)

(autoload 'lao-composition-function "lao-util" "\
Compose Lao text in the region FROM and TO.
The text matches the regular expression PATTERN.
Optional 4th argument STRING, if non-nil, is a string containing text
to compose.

The return value is number of composed characters.

arguments: (FROM TO PATTERN &optional STRING)
" nil nil)

(autoload 'lao-compose-region "lao-util" "\


arguments: (FROM TO)
" t nil)

;;;***

;;;### (autoloads (make-coding-system) "make-coding-system" "mule/make-coding-system.el")

(autoload 'make-coding-system "make-coding-system" "\
Register symbol NAME as a coding system.

TYPE describes the conversion method used and should be one of

nil or `undecided'
     Automatic conversion.  XEmacs attempts to detect the coding system
     used in the file.
`chain'
     Chain two or more coding systems together to make a combination coding
     system.
`no-conversion'
     No conversion.  Use this for binary files and such.  On output,
     graphic characters that are not in ASCII or Latin-1 will be
     replaced by a ?. (For a no-conversion-encoded buffer, these
     characters will only be present if you explicitly insert them.)
`convert-eol'
     Convert CRLF sequences or CR to LF.
`shift-jis'
     Shift-JIS (a Japanese encoding commonly used in PC operating systems).
`unicode'
     Any Unicode encoding (UCS-4, UTF-8, UTF-16, etc.).
`mswindows-unicode-to-multibyte'
     (MS Windows only) Converts from Windows Unicode to Windows Multibyte
     (any code page encoding) upon encoding, and the other way upon decoding.
`mswindows-multibyte'
     Converts to or from Windows Multibyte (any code page encoding).
     This is resolved into a chain of `mswindows-unicode' and
     `mswindows-unicode-to-multibyte'.
`iso2022'
     Any ISO2022-compliant encoding.  Among other things, this includes
     JIS (the Japanese encoding commonly used for e-mail), EUC (the
     standard Unix encoding for Japanese and other languages), and
     Compound Text (the encoding used in X11).  You can specify more
     specific information about the conversion with the PROPS argument.
`fixed-width'
     A fixed-width eight bit encoding that is not necessarily compliant with
     ISO 2022.  This coding system assumes Unicode equivalency, that is, if
     two given XEmacs characters have the same Unicode mapping, they will
     always map to the same octet on disk.
`big5'
     Big5 (the encoding commonly used for Mandarin Chinese in Taiwan).
`ccl'
     The conversion is performed using a user-written pseudo-code
     program.  CCL (Code Conversion Language) is the name of this
     pseudo-code.
`gzip'
     GZIP compression format.
`internal'
     Write out or read in the raw contents of the memory representing
     the buffer's text.  This is primarily useful for debugging
     purposes, and is only enabled when XEmacs has been compiled with
     DEBUG_XEMACS defined (via the --debug configure option).
     WARNING: Reading in a file using `internal' conversion can result
     in an internal inconsistency in the memory representing a
     buffer's text, which will produce unpredictable results and may
     cause XEmacs to crash.  Under normal circumstances you should
     never use `internal' conversion.

DESCRIPTION is a short English phrase describing the coding system,
suitable for use as a menu item. (See also the `documentation' property
below.)

PROPS is a property list, describing the specific nature of the
character set.  Recognized properties are:

`mnemonic'
     String to be displayed in the modeline when this coding system is
     active.

`documentation'
     Detailed documentation on the coding system.

`aliases'
     A list of aliases for the coding system.  See
     `define-coding-system-alias'.

`eol-type'
     End-of-line conversion to be used.  It should be one of

	nil
		Automatically detect the end-of-line type (LF, CRLF,
		or CR).  Also generate subsidiary coding systems named
		`NAME-unix', `NAME-dos', and `NAME-mac', that are
		identical to this coding system but have an EOL-TYPE
		value of `lf', `crlf', and `cr', respectively.
	`lf'
		The end of a line is marked externally using ASCII LF.
		Since this is also the way that XEmacs represents an
		end-of-line internally, specifying this option results
		in no end-of-line conversion.  This is the standard
		format for Unix text files.
	`crlf'
		The end of a line is marked externally using ASCII
		CRLF.  This is the standard format for MS-DOS text
		files.
	`cr'
		The end of a line is marked externally using ASCII CR.
		This is the standard format for Macintosh text files.
	t
		Automatically detect the end-of-line type but do not
		generate subsidiary coding systems.  (This value is
		converted to nil when stored internally, and
		`coding-system-property' will return nil.)

`post-read-conversion'
     The value is a function to call after some text is inserted and
     decoded by the coding system itself and before any functions in
     `after-change-functions' are called. (#### Not actually true in
     XEmacs. `after-change-functions' will be called twice if
     `post-read-conversion' changes something.) The argument of this
     function is the same as for a function in
     `after-insert-file-functions', i.e. LENGTH of the text inserted,
     with point at the head of the text to be decoded.

`pre-write-conversion'
     The value is a function to call after all functions in
     `write-region-annotate-functions' and `buffer-file-format' are
     called, and before the text is encoded by the coding system itself.
     The arguments to this function are the same as those of a function
     in `write-region-annotate-functions', i.e. FROM and TO, specifying
     a region of text.

The following properties are used by `default-query-coding-region',
the default implementation of `query-coding-region'. This
implementation and these properties are not used by the Unicode coding
systems, nor by fixed-width coding systems. 

`safe-chars'
     The value is a char table.  If a character has non-nil value in it,
     the character is safely supported by the coding system.  
     This overrides the `safe-charsets' property.
   
`safe-charsets'
     The value is a list of charsets safely supported by the coding
     system.  For coding systems based on ISO 2022, XEmacs may try to
     encode characters outside these character sets, but outside of
     East Asia and East Asian coding systems, it is unlikely that
     consumers of the data will understand XEmacs' encoding.
     The value t means that all XEmacs character sets handles are supported.  

The following properties are allowed for FSF compatibility but currently
ignored:

`translation-table-for-decode'
     The value is a translation table to be applied on decoding.  See
     the function `make-translation-table' for the format of translation
     table.  This is not applicable to CCL-based coding systems.
    
`translation-table-for-encode'
     The value is a translation table to be applied on encoding.  This is
     not applicable to CCL-based coding systems.
     
`mime-charset'
     The value is a symbol of which name is `MIME-charset' parameter of
     the coding system.
    
`valid-codes' (meaningful only for a coding system based on CCL)
     The value is a list to indicate valid byte ranges of the encoded
     file.  Each element of the list is an integer or a cons of integer.
     In the former case, the integer value is a valid byte code.  In the
     latter case, the integers specifies the range of valid byte codes.

The following additional property is recognized if TYPE is `convert-eol':

`subtype'
     One of `lf', `crlf', `cr' or nil (for autodetection).  When decoding,
     the corresponding sequence will be converted to LF.  When encoding,
     the opposite happens.  This coding system converts characters to
     characters.



The following additional properties are recognized if TYPE is `iso2022':

`charset-g0'
`charset-g1'
`charset-g2'
`charset-g3'
     The character set initially designated to the G0 - G3 registers.
     The value should be one of

          -- A charset object (designate that character set)
	  -- nil (do not ever use this register)
	  -- t (no character set is initially designated to
		the register, but may be later on; this automatically
		sets the corresponding `force-g*-on-output' property)

`force-g0-on-output'
`force-g1-on-output'
`force-g2-on-output'
`force-g2-on-output'
     If non-nil, send an explicit designation sequence on output before
     using the specified register.

`short'
     If non-nil, use the short forms \"ESC $ @\", \"ESC $ A\", and
     \"ESC $ B\" on output in place of the full designation sequences
     \"ESC $ ( @\", \"ESC $ ( A\", and \"ESC $ ( B\".

`no-ascii-eol'
     If non-nil, don't designate ASCII to G0 at each end of line on output.
     Setting this to non-nil also suppresses other state-resetting that
     normally happens at the end of a line.

`no-ascii-cntl'
     If non-nil, don't designate ASCII to G0 before control chars on output.

`seven'
     If non-nil, use 7-bit environment on output.  Otherwise, use 8-bit
     environment.

`lock-shift'
     If non-nil, use locking-shift (SO/SI) instead of single-shift
     or designation by escape sequence.

`no-iso6429'
     If non-nil, don't use ISO6429's direction specification.

`escape-quoted'
     If non-nil, literal control characters that are the same as
     the beginning of a recognized ISO2022 or ISO6429 escape sequence
     (in particular, ESC (0x1B), SO (0x0E), SI (0x0F), SS2 (0x8E),
     SS3 (0x8F), and CSI (0x9B)) are \"quoted\" with an escape character
     so that they can be properly distinguished from an escape sequence.
     (Note that doing this results in a non-portable encoding.) This
     encoding flag is used for byte-compiled files.  Note that ESC
     is a good choice for a quoting character because there are no
     escape sequences whose second byte is a character from the Control-0
     or Control-1 character sets; this is explicitly disallowed by the
     ISO2022 standard.

`input-charset-conversion'
     A list of conversion specifications, specifying conversion of
     characters in one charset to another when decoding is performed.
     Each specification is a list of two elements: the source charset,
     and the destination charset.

`output-charset-conversion'
     A list of conversion specifications, specifying conversion of
     characters in one charset to another when encoding is performed.
     The form of each specification is the same as for
     `input-charset-conversion'.

The following additional properties are recognized if TYPE is
`fixed-width':

`unicode-map'
     Required.  A plist describing a map from octets in the coding system
     NAME (as integers) to XEmacs characters.  Those XEmacs characters will
     be used explicitly on decoding, but for encoding (most relevantly, on
     writing to disk) XEmacs characters that map to the same Unicode code
     point will be unified.  This means that the ISO-8859-? characters that
     map to the same Unicode code point will not be distinct when written to
     disk, which is normally what is intended; it also means that East Asian
     Han characters from different XEmacs character sets will not be
     distinct when written to disk, which is less often what is intended.

     Any octets not mapped, and with values above #x7f, will be decoded into
     XEmacs characters that reflect that their values are undefined.  These
     characters will be displayed in a language-environment-specific
     way. See `unicode-error-default-translation-table' and the
     `invalid-sequence-coding-system' argument to `set-language-info'.

     These characters will normally be treated as invalid when checking
     whether text can be encoded with `query-coding-region'--see the
     IGNORE-INVALID-SEQUENCESP argument to that function to avoid this.  It
     is possible to specify that octets with values less than #x80 (or
     indeed greater than it) be treated in this way, by specifying
     explicitly that they correspond to the character mapping to that octet
     in `unicode-error-default-translation-table'.  Far fewer coding systems
     override the ASCII mapping, though, so this is not the default.

`encode-failure-octet'
     An integer between 0 and 255 to write in place of XEmacs characters
     that cannot be encoded, defaulting to the code for tilde `~'.

The following additional properties are recognized (and required)
if TYPE is `ccl':

`decode'
     CCL program used for decoding (converting to internal format).

`encode'
     CCL program used for encoding (converting to external format).


The following additional properties are recognized if TYPE is `chain':

`chain'
     List of coding systems to be chained together, in decoding order.

`canonicalize-after-coding'
     Coding system to be returned by the detector routines in place of
     this coding system.



The following additional properties are recognized if TYPE is `unicode':

`unicode-type'
     One of `utf-16', `utf-8', `ucs-4', or `utf-7' (the latter is not
     yet implemented).  `utf-16' is the basic two-byte encoding;
     `ucs-4' is the four-byte encoding; `utf-8' is an ASCII-compatible
     variable-width 8-bit encoding; `utf-7' is a 7-bit encoding using
     only characters that will safely pass through all mail gateways.
     [[ This should be \"transformation format\".  There should also be
     `ucs-2' (or `bmp' -- no surrogates) and `utf-32' (range checked). ]]

`little-endian'
     If non-nil, `utf-16' and `ucs-4' will write out the groups of two
     or four bytes little-endian instead of big-endian.  This is required,
     for example, under Windows.

`need-bom'
     If non-nil, a byte order mark (BOM, or Unicode FFFE) should be
     written out at the beginning of the data.  This serves both to
     identify the endianness of the following data and to mark the
     data as Unicode (at least, this is how Windows uses it).
     [[ The correct term is \"signature\", since this technique may also
     be used with UTF-8.  That is the term used in the standard. ]]


The following additional properties are recognized if TYPE is
`mswindows-multibyte':

`code-page'
     Either a number (specifying a particular code page) or one of the
     symbols `ansi', `oem', `mac', or `ebcdic', specifying the ANSI,
     OEM, Macintosh, or EBCDIC code page associated with a particular
     locale (given by the `locale' property).  NOTE: EBCDIC code pages
     only exist in Windows 2000 and later.

`locale'
     If `code-page' is a symbol, this specifies the locale whose code
     page of the corresponding type should be used.  This should be
     one of the following: A cons of two strings, (LANGUAGE
     . SUBLANGUAGE) (see `mswindows-set-current-locale'); a string (a
     language; SUBLANG_DEFAULT, i.e. the default sublanguage, is
     used); or one of the symbols `current', `user-default', or
     `system-default', corresponding to the values of
     `mswindows-current-locale', `mswindows-user-default-locale', or
     `mswindows-system-default-locale', respectively.


The following additional properties are recognized if TYPE is `undecided':
[[ Doesn't GNU use \"detect-*\" for the following two? ]]

`do-eol'
     Do EOL detection.

`do-coding'
     Do encoding detection.

`coding-system'
     If encoding detection is not done, use the specified coding system
     to do decoding.  This is used internally when implementing coding
     systems with an EOL type that specifies autodetection (the default),
     so that the detector routines return the proper subsidiary.



The following additional property is recognized if TYPE is `gzip':

`level'
     Compression level: 0 through 9, or `default' (currently 6).

arguments: (NAME TYPE &optional DESCRIPTION PROPS)
" nil nil)

;;;***

;;;### (autoloads (tibetan-pre-write-conversion tibetan-post-read-conversion tibetan-compose-buffer tibetan-decompose-buffer tibetan-composition-function tibetan-decompose-string tibetan-decompose-region tibetan-compose-region tibetan-compose-string tibetan-transcription-to-tibetan tibetan-tibetan-to-transcription tibetan-char-p) "tibet-util" "mule/tibet-util.el")

(autoload 'tibetan-char-p "tibet-util" "\
Check if char CH is Tibetan character.
Returns non-nil if CH is Tibetan. Otherwise, returns nil.

arguments: (CH)
" nil nil)

(autoload 'tibetan-tibetan-to-transcription "tibet-util" "\
Transcribe Tibetan string STR and return the corresponding Roman string.

arguments: (STR)
" nil nil)

(autoload 'tibetan-transcription-to-tibetan "tibet-util" "\
Convert Tibetan Roman string STR to Tibetan character string.
The returned string has no composition information.

arguments: (STR)
" nil nil)

(autoload 'tibetan-compose-string "tibet-util" "\
Compose Tibetan string STR.

arguments: (STR)
" nil nil)

(autoload 'tibetan-compose-region "tibet-util" "\
Compose Tibetan text the region BEG and END.

arguments: (BEG END)
" t nil)

(autoload 'tibetan-decompose-region "tibet-util" "\
Decompose Tibetan text in the region FROM and TO.
This is different from decompose-region because precomposed Tibetan characters
are decomposed into normal Tiebtan character sequences.

arguments: (FROM TO)
" t nil)

(autoload 'tibetan-decompose-string "tibet-util" "\
Decompose Tibetan string STR.
This is different from decompose-string because precomposed Tibetan characters
are decomposed into normal Tiebtan character sequences.

arguments: (STR)
" nil nil)

(autoload 'tibetan-composition-function "tibet-util" "\


arguments: (FROM TO PATTERN &optional STRING)
" nil nil)

(autoload 'tibetan-decompose-buffer "tibet-util" "\
Decomposes Tibetan characters in the buffer into their components.
See also the documentation of the function `tibetan-decompose-region'.

arguments: ()
" t nil)

(autoload 'tibetan-compose-buffer "tibet-util" "\
Composes Tibetan character components in the buffer.
See also docstring of the function tibetan-compose-region.

arguments: ()
" t nil)

(autoload 'tibetan-post-read-conversion "tibet-util" "\


arguments: (LEN)
" nil nil)

(autoload 'tibetan-pre-write-conversion "tibet-util" "\


arguments: (FROM TO)
" nil nil)

;;;***

;;;### (autoloads (viqr-pre-write-conversion viqr-post-read-conversion viet-encode-viqr-buffer viet-encode-viqr-region viet-decode-viqr-buffer viet-decode-viqr-region viet-encode-viscii-char) "viet-util" "mule/viet-util.el")

(autoload 'viet-encode-viscii-char "viet-util" "\
Return VISCII character code of CHAR if appropriate.

arguments: (CHAR)
" nil nil)

(autoload 'viet-decode-viqr-region "viet-util" "\
Convert `VIQR' mnemonics of the current region to Vietnamese characters.
When called from a program, expects two arguments,
positions (integers or markers) specifying the stretch of the region.

arguments: (FROM TO)
" t nil)

(autoload 'viet-decode-viqr-buffer "viet-util" "\
Convert `VIQR' mnemonics of the current buffer to Vietnamese characters.

arguments: ()
" t nil)

(autoload 'viet-encode-viqr-region "viet-util" "\
Convert Vietnamese characters of the current region to `VIQR' mnemonics.
When called from a program, expects two arguments,
positions (integers or markers) specifying the stretch of the region.

arguments: (FROM TO)
" t nil)

(autoload 'viet-encode-viqr-buffer "viet-util" "\
Convert Vietnamese characters of the current buffer to `VIQR' mnemonics.

arguments: ()
" t nil)

(autoload 'viqr-post-read-conversion "viet-util" "\


arguments: (LEN)
" nil nil)

(autoload 'viqr-pre-write-conversion "viet-util" "\


arguments: (FROM TO)
" nil nil)

;;;***

(provide 'mule-autoloads)
