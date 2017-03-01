;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  shortkey: see end of file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  install:
;;   1. find the ".emacs" path
;;      (insert (getenv "HOME")) --> C:\Users\qxg9592\AppData\Roaming
;;   1.1 create a new .emacs file in c:/anc : (c-x c-f) --> goto the direcoty --> create the file
;;
;;   2. find the path of custumation. exmaple: d:/swiss_tools/emacs-lib
;;
;;   3.	add the following line into ".emacs" to load the custumation library
;;      (setenv "HOME" "d:/swiss_tools/emacs-lib")		;; new Home directoy for emacs
;;;	(setq hongqing-emacs-root "d:/swiss_tools/emacs-lib")	;; move it to .emacs
;;;	(add-to-list 'load-path hongqing-emacs-root)			;; move it to .emacs
;;;	(load "gnu-emacs-custom.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq debug-on-error nil) ;; enable a backtrace when a problem occurs.
(setq user-full-name "hongqing")
(setq user-mail-address "hongqing.hu@gmail.com")
(setq visible-bell t)   ;;  sound:  turn off beep
(global-hl-line-mode 1) ;; cursor highlight current line
(setq cursor-type 'bar) ;; cursor type  bar
(blink-cursor-mode 1)   ;; cursor blink  
(server-start) ;; enable a backtrace when a problem occurs.
(load-theme 'manoj-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; desktop mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;c:/GreenProgramme/swiss_tools/emacs-lib
(setq desktop-path '("c:/GreenProgramme/swiss_tools/emacs-lib/.emacs.d/"))
(setq desktop-dirname "c:/GreenProgramme/swiss_tools/emacs-lib/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(require 'desktop-menu)
(desktop-save-mode 1) ;; save session for reopen ;; disable it due to windows crash bug

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use setting through setting value of built-in variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(setq column-number-mode t) 
(setq kill-ring-max 200)
(setq default-fill-column 120)
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq frame-title-format "%f")			;; display framename
(global-font-lock-mode t)
(auto-image-file-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq bookmark-save-flag 1)			;; save bookmark if changed
(setq bookmark-sort-flag nil)
(display-time) ;;show time 
(set-default-font "-adobe-courier-medium-r-normal--24-240-75-75-m-150-iso8859-1") ;; font
(fset 'yes-or-no-p 'y-or-n-p) ;;y/n start yes or no
(auto-compression-mode t) ;; auto compress mode
(add-hook 'c-mode-common-hook  (lambda()  (local-set-key  (kbd "C-c o") 'ff-find-other-file)))  ;; jump between cpp and h files
(global-auto-revert-mode t)				;; auto refresh file if it is changed by other programm


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load emacs build-in mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'setnu)		;; show number
(require 'session)
(add-hook 'after-init-hook 'session-initialize)	

(require 'ibuffer)

(require 'browse-kill-ring) ;;kill Ring
(browse-kill-ring-default-keybindings)
(ido-mode t)
(require 'swbuff)
(setq swbuff-exclude-buffer-regexps 
      '("^ " "\\*.*\\*"))
(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    key-binding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x C-k") 'browse-kill-ring)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  macro 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; insert template document
(fset 'doc-perl  [?\C-a ?\C-u ?8 ?0 ?# return ?# return ?\C-u ?8 ?0 ?# ?\C-x ?\C-s])
(fset 'doc-c++   [?\C-a ?/ ?\C-u ?5 ?9 ?* return ?* return ?\C-u ?5 ?8 ?* ?/ ?\C-x ?\C-s])
(fset 'doc-lisp  [?\C-a ?\C-u ?8 ?0 ?\; return ?\; return ?\C-u ?8 ?0 ?\; ?\C-x ?\C-s])
(fset 'doc-elisp [?\C-a ?\C-u ?8 ?0 ?\; return ?\; return ?\C-u ?8 ?0 ?\; ?\C-x ?\C-s])
;;; read news in emacs
(fset 'news-insert  [?\M-> return ?\C-y return ?\C-u ?8 ?0 ?- return ?\C-x ?\C-s]) ;; add a news
(fset 'news-delete  [?\M-< ?\C-  ?\C-s ?- ?- ?\C-e ?\C-w ?\C-x ?\C-s])		   ;; delete a news
(fset 'code-to-skel
  [?\C-a ?\C-  ?\C-e ?\M-x ?r ?e ?p ?l ?a tab ?s tab return ?\" return ?\\ ?\" return ?\C-a ?\" ?\C-e ?\\ ?n ?\" down])
;; save search results as macro
(fset 'asim-filter-qualifier
   [?\M-x ?o ?c ?c ?u tab return ?# ?d ?e ?f ?i ?n ?e ?  ?E ?N ?V ?I ?R ?O ?N ?M ?E ?N ?T ?A ?L ?M ?O ?D ?E ?L ?_ ?C ?O ?M ?M ?O ?N ?_ ?C ?o ?m ?m ?o ?n ?. ?+ ?Q ?u ?a ?l ?i ?f ?i ?e ?r return])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undo and redo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defalias 'perl-mode 'cperl-mode) ;; cperl


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; programming langurage support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defalias 'perl-mode 'cperl-mode) ;; cperl

;;version controlle 
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;Expansion durch  M-/ 
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	      to_test
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun explorer ()
  "Launch the windows explorer in the current directory and selects current file"
  (interactive)
  (w32-shell-execute
   "open"
   "explorer"
   (concat "/e,/select," (convert-standard-filename buffer-file-name))))
(global-set-key (kbd "<f12>")  'explorer)        ; F12 - Open Explorer for the current file path

;; open console
(defun open-cmd-on-current-file-path ()
  "open cmd windows on current path"
  (interactive)
  (w32-shell-execute
   "open"
   "cmd"
   (concat " /k ""cd " (convert-standard-filename (file-name-directory buffer-file-name)) """" )))
(global-set-key (kbd "<f11>")  'open-cmd-on-current-file-path)


(defun visit-tags-table-gaps ()
  "load gap tags"
  (interactive)
  (visit-tags-table  "c:/dev/ADTF_trunk/Swcs/EmGap/Test/SwcTests/TAGS")
  )






(defun dos-eol-hide ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))



