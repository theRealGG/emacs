;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Hisham Görner"
      user-mail-address "hisham30g@gmail.com")

;; Make sure you installed the following fonts:
;; - JetBrains Mono (https://github.com/JetBrains/JetBrainsMono)
;; - DejaVuSansM Nerd Font (https://www.nerdfonts.com/font-downloads)
;; - JuliaMono (https://juliamono.netlify.app/)

(setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'light)
      doom-variable-pitch-font (font-spec :family "DejaVuSansM Nerd Font" :size 16)
      doom-symbol-font (font-spec :family "JuliaMono")
      doom-big-font (font-spec :family "JetBrains Mono" :size 36))

;;
;; macos
;; use left option key for braces

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)


(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

(use-package! tsx-mode
  :commands tsx-mode)

(after! lsp-ui
  ;; Fixes code action lightbulb icon background
  ;; It's probably a compatiblity issue with solaire mode
  (setq lsp-ui-sideline-actions-icon (doom-path doom-private-dir "assets" "lightbulb.png"))

  (custom-set-faces!
    `(lsp-ui-peek-highlight :foreground ,(doom-color 'yellow) :background ,(doom-color 'base4) :box t))

  ;; This fixes the TAB file toggle in lsp-ui peeking.
  ;; For some reason, evil's TAB keybinding takes precedence?
  ;; This rebinding is a hack to work around that.
  ;; Not sure of a better fix right now.
  (map! :map lsp-ui-peek-mode-map
        "<tab>" #'lsp-ui-peek--toggle-file))

(after! lsp-html
  ;; don't want to use lsp html formatter,
  ;; since web-mode and other emacs formatters are more flexible
  (setq lsp-html-format-enable nil))

;; must be set before package loads
(setq lsp-tailwindcss-add-on-mode t)
(use-package! lsp-tailwindcss
  :config
  (setq lsp-tailwindcss-major-modes '(rjsx-mode web-mode tsx-mode html-mode css-mode)))
