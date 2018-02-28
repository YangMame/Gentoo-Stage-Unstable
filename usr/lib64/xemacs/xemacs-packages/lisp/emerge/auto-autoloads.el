;;; DO NOT MODIFY THIS FILE
(if (featurep 'emerge-autoloads) (error "Already loaded"))

;;;### (autoloads nil "_pkg" "emerge/_pkg.el")

(package-provide 'emerge :version 1.11 :author-version "No-Upstream-Ver" :type 'regular)

;;;***

;;;### (autoloads (emerge-merge-directories emerge-revisions-with-ancestor emerge-revisions emerge-files-with-ancestor-remote emerge-files-remote emerge-files-with-ancestor-command emerge-files-command emerge-buffers-with-ancestor emerge-buffers emerge-files-with-ancestor emerge-files) "emerge" "emerge/emerge.el")

(autoload 'emerge-files "emerge" "\
Run Emerge on two files." t nil)

(fset 'emerge 'emerge-files)

(autoload 'emerge-files-with-ancestor "emerge" "\
Run Emerge on two files, giving another file as the ancestor." t nil)

(autoload 'emerge-buffers "emerge" "\
Run Emerge on two buffers." t nil)

(autoload 'emerge-buffers-with-ancestor "emerge" "\
Run Emerge on two buffers, giving another buffer as the ancestor." t nil)

(autoload 'emerge-files-command "emerge" nil nil nil)

(autoload 'emerge-files-with-ancestor-command "emerge" nil nil nil)

(autoload 'emerge-files-remote "emerge" nil nil nil)

(autoload 'emerge-files-with-ancestor-remote "emerge" nil nil nil)

(autoload 'emerge-revisions "emerge" "\
Emerge two RCS revisions of a file." t nil)

(autoload 'emerge-revisions-with-ancestor "emerge" "\
Emerge two RCS revisions of a file, with another revision as ancestor." t nil)

(autoload 'emerge-merge-directories "emerge" nil t nil)

;;;***

(provide 'emerge-autoloads)
