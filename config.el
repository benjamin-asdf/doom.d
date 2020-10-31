;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Benjamin Schwerdtner"
      user-mail-address "Benjamin.Schwerdtner@gmail.com")

(setq doom-theme 'doom-one)
(setq org-directory "~/org/")
(setq display-line-numbers-type 'relative)

;;(setq doom-font
      ;;(font-spec :family "Source Code Pro" :weight 'normal :height 15))

(setq doom-font (font-spec :family "monospace" :size 16))


(setq doom-theme 'doom-monokai-pro)

;; (custom-theme-set-faces!
;;   'doom-monokai-pro
;;   '(line-number
;;     :foreground
;;     "slateBlue"))


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


;; (dolist (map '(emacs-lisp-mode-map lisp-interaction-mode-map))
;;   (map! :map map
;;         ", e l"
;;         #'benj/eval-sexp-on-line
;;         :leader
;;         "m e f"
;;         #'eval-defun))

;; (bind-map
;;    flycheck-mode-map
;;    :evil-keys ("SPC e")
;;    :minor-modes (flycheck-mode)
;;    :evil-states (normal))
;;
;;


;; (use-package! flycheck
;;   :defer t
;;   :init (setq flycheck-command-map-prefix "SPC e")
;;   :config
;;   (progn
;;     (map!
;;      :leader "e" flycheck-command-map)
;;     (bind-map
;;       flycheck-command-map
;;       :evil-keys ("SPC e")
;;       :evil-states (normal)
;;       :minor-modes (flycheck)))
;;   )




;; evil-lisp-state

(use-package! evil-lisp-state
  :init
  (setq evil-lisp-state-global t)
  :config
  (progn
    (benj/set-evil-cursor
     "lisp" '("HotPink1" box))
    (evil-lisp-state-leader "SPC k")))


(add-hook!
  '(emacs-lisp-mode-hook lisp-interaction-mode-hook)
  (map!
        :map emacs-lisp-mode-map
        :localleader
        (:prefix ("e" . "eval")
        "l" #'lisp-state-eval-sexp-end-of-line)
        "L" #'load-library))


;; page-break-lines

(use-package! page-break-lines
  :init
  (progn
    (setq-default page-break-lines-max-width 30)
    (global-page-break-lines-mode 1)))



(use-package! lispyville
              :hook (lispy-mode . lispyville-mode)
              :init
              (setq lispyville-key-theme
                    '((operators normal)
                      c-w
                      (prettify insert)
                      (atom-movement t)
                      slurp/barf-lispy
                      additional
                      additional-motions
                      additional-wrap
                      additional-insert
                      escape
                      text-objects))
              :config
              (progn
                (lispyville-set-key-theme)
                (require 'targets)
                (setq targets-text-objects nil)
                (targets-setup)
                (targets-define-to lispyville-comment 'lispyville-comment nil object
                                   :last-key nil
                                   :bind t :keys ";")
                (targets-define-to lispyville-atom 'lispyville-atom nil object
                                   :last-key nil
                                   :bind t :keys "m")
                (targets-define-to lispyville-list 'lispyville-list nil object
                                   :last-key nil
                                   :bind t :keys "c")
                (targets-define-to lispyville-sexp 'lispyville-sexp nil object
                                   :last-key nil
                                   :bind t :keys "x")
                (targets-define-to lispyville-function 'lispyville-function nil object
                                   :last-key nil
                                   :bind t :keys "f")
                (targets-define-to lispyville-string 'lispyville-string nil object
                                   :last-key nil
                                   :bind t :keys "S")))






(defun benj/update-evil-mc-cursor-overlays ()
  "This is a kludge to run `evil-mc-excute-for' for the side effect of updating the
cursors only."
  (let ((evil-mc-command '(:name foo))
        (evil-mc-silence-errors t))
    (evil-mc-execute-for-all)))




(use-package! paren
  ;; highlight matching delimiters
  :hook (doom-first-buffer . show-paren-mode)
  :config
  (progn
    (set-face-foreground 'show-paren-match "White")
    (set-face-underline 'show-paren-match "White")))





(global-visual-line-mode 1)



