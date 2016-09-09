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

; Colorscheme
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;(set-frame-parameter nil 'background-mode 'dark)
;(set-terminal-parameter nil 'background-mode 'dark)
;(enable-theme 'solarized)
;(load-theme 'solarized t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/jbeans-emacs")
(load-theme 'jbeans t)
;(print custom-theme-load-path)
;(print load-path)
;(remove-from-list)

;(dolist (x (directory-files "~/.emacs.d/themes/"))
;  (print x))

; Elscreen
(define-key evil-normal-state-map (kbd "C-p") (lambda() (interactive) (elscreen-previous)))
(define-key evil-normal-state-map (kbd "C-n") (lambda() (interactive) (elscreen-next)))
(evil-ex-define-cmd "tabnew" 'elscreen-create)

(custom-set-faces
 '(elscreen-tab-background-face((t (:background "#d2d2d2"))))
 '(elscreen-tab-control-face ((t (:background "#1c1c1c" :foreground "#9e9e9e" :underline nil))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#eeeeee" :background "#000000", :underline t))))
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

; TODO handle package install
; * evil
; * evil-surround
; * helm
; * elscreen
; * smartparens
