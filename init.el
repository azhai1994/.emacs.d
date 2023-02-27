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
