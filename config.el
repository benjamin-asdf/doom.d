;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Benjamin Schwerdtner"
      user-mail-address "Benjamin.Schwerdtner@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;



(setq which-key-idle-delay 0.2)

(setq doom-scratch-initial-major-mode 'lisp-interaction-mode)


;; company binds

(map! :i
      "C-j" #'+company/complete)

(map!
 :map
 company-active-map
 "C-l" #'company-complete-selection
 "M-/" #'counsel-company)


;; general binds

(map! :leader "SPC" #'counsel-M-x)

(map! :leader "j d"
      #'dired-jump)





;; evil-lisp-state

(use-package! evil-lisp-state
  :init
    (setq evil-lisp-state-global t)
  :config
  (progn
    (benj/set-evil-cursor
     "lisp" '("HotPink1" box))
    (evil-lisp-state-leader "SPC k")))



;; page-break-lines

(use-package! page-break-lines
  :init
  (progn
    (setq-default page-break-lines-max-width 30)
    (global-page-break-lines-mode 1)))
