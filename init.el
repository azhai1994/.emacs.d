Add to the value of HOOK the function FUNCTION.
FUNCTION is not added if already present.

The place where the function is added depends on the DEPTH
parameter.  DEPTH defaults to 0.  By convention, it should be
a number between -100 and 100 where 100 means that the function
should be at the very end of the list, whereas -100 means that
the function should always come first.
Since nothing is "always" true, don’t use 100 nor -100.
When two functions have the same depth, the new one gets added after the
old one if depth is strictly positive and before otherwise.

For backward compatibility reasons, a symbol other than nil is
interpreted as a DEPTH of 90.

The optional fourth argument, LOCAL, if non-nil, says to modify
the hook’s buffer-local value rather than its global value.
This makes the hook buffer-local, and it makes t a member of the
buffer-local value.  That acts as a flag to run the hook
functions of the global value as well as in the local value.

HOOK should be a symbol.  If HOOK is void, it is first set to
nil.  If HOOK’s value is a single function, it is changed to a
list of functions.

FUNCTION may be any valid function, but it’s recommended to use a
function symbol and not a lambda form.  Using a symbol will
ensure that the function is not re-added if the function is
edited, and using lambda forms may also have a negative
performance impact when running ‘add-hook’ and ‘remove-hook’.

  Probably introduced at or before Emacs version 19.20.
;;;init.el --- load the full configuration -*- lexical-binding: t  -*-


;;open window
(setq inhibit-splash-screen t)
(tool-bar-mode 1);-1 to unable
(scroll-bar-mode -1)
(global-linum-mode 1)

;;init.el
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

;;company
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult embark marginalia orderless vertico keycast company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;melpa
(require 'package)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
;; refresh
(when (not package-archive-contents)
  (package-refresh-contents))



;;;minibuffer

;keycast 
(package-install 'keycast)
;(keycast-mode t)

;;code completion
;vertico to verticle
(package-install 'vertico)
(vertico-mode t)

;orderless to orderless
(package-install 'orderless)
(setq completion-styles '(orderless))

;Marginalia colorful
(package-install 'marginalia)
(marginalia-mode t)

;Embark !!
(package-install 'embarks)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

;consult
(package-install 'consult)
(global-set-key (kbd "C-s") 'consult-line)


;;;init.el ends here
