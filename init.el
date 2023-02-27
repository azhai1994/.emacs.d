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
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/package/") t)
