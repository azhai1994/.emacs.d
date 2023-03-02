;;; Package --- Summary
;;  Commentary



;;; Some initialize:
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10) ;;margin

(load-theme 'wombat)
(set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 130 :weight 'normal)
(column-number-mode)
;;Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))
;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;;package initialize

;;initialize package source from mirror of ustc
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)

;;use-package initialize
(unless (or (package-installed-p 'use-package)
   (package-install 'use-package)))
(require 'use-package)
(setq use-package-always-ensure t)

;;(use-package command-log-mode)
;;M-x global-command-log-mode
;;clm/toggle-command-log-buffer

;;;ivy & counsel & ivy-rich
;;counsel
(use-package counsel
  :bind("M-x" . counsel-M-x)
  ("C-x b" . counsel-ibuffer)
  ("C-x C-f" . counsel-find-file)
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

;;ivy
(use-package ivy
 ;;  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package which-key
  :init (which-key-mode)
;;  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; helpful
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))


;;; modeline & icon & rainbowdelimters
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-themes :defer t)
(load-theme 'doom-snazzy t)


;;MorePackageToUse ;;helpful 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helpful which-key rainbow-delimiters doom-modeline doo-modeline use-package diminish counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
