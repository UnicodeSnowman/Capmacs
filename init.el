(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(require 'evil-surround)
(require 'helm-config)
(require 'smartparens-config)
(require 'rainbow-delimiters)

; Basic Setup
(elscreen-start)
(evil-mode t)
(global-evil-surround-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; fix scroll up
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

; Lang-specific configs
;(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'elisp-mode-hook 'rainbow-delimiters-mode)
(setq evil-shift-width 2)

; Line Numbers and Spacing
(global-linum-mode 1)
(setq linum-format "%d ")

; Text / Delimiters
(show-smartparens-global-mode t)

; Font
(when (member "Source Code Pro" (font-family-list))
    (set-face-attribute 'default nil
			:family "Source Code Pro"
			:weight 'normal
			:width 'normal
			:height 145))

; Elscreen
(define-key evil-normal-state-map (kbd "C-p") (lambda() (interactive) (elscreen-previous)))
(define-key evil-normal-state-map (kbd "C-n") (lambda() (interactive) (elscreen-next)))
(evil-ex-define-cmd "tabnew" 'elscreen-create)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-background-face ((t (:background "#d2d2d2"))))
 '(elscreen-tab-control-face ((t (:background "#1c1c1c" :foreground "#9e9e9e" :underline nil))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#eeeeee" :background "#000000" (\, :underline) t))))
 '(elscreen-tab-other-screen-face ((t (:foreground "#111111" :background "#d2d2d2" :underline nil)))))

;(dolist (n (number-sequence 0 9))
;  (define-key
;    evil-normal-state-map
;    (kbd (concat "C-" (number-to-string n)))
;    (lambda()
;      (interactive)
;      (elscreen-goto n))))

; Dash API Docs
(setq helm-dash-browser-func 'eww)

; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

; TODO handle package install
; * evil
; * Evil-surround
; * helm
; * elscreen
; * smartparens
; * rainbow delimiters
; * color-theme-sanityinc-tomorrow

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
