;;; init.el -*- lexical-binding: t; -*-

(doom!
 :benj-evil
 core
        :input
       layout

       :completion
       company
       (ivy +fuzzy +prescient)

       :ui
       ;;deft
       doom
       doom-dashboard
       doom-quit
       ;;fill-column
       hl-todo
       hydra
       ;; indent-guides
       ;; ligatures
       ;;minimap
       modeline
       nav-flash
       ;;neotree
       ophints
       (popup +defaults)
       ;;tabs
       treemacs
       ;;unicode
       vc-gutter
       vi-tilde-fringe
       ;;window-select
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       ;;(format +onsave)
       ;;god
       ;;lispy
       ;;multiple-cursors
       ;;objed
       ;;parinfer
       ;;rotate-text
       snippets
       ;;word-wrap

       :emacs
       dired
       electric
       ibuffer
       undo
       vc

       :term
       eshell
       shell
       ;;term
       ;;vterm

       :checkers
       syntax
       ;;spell
       ;;grammar

       :tools
       ;;ansible
       debugger
       ;;direnv
       ;;docker
       ;;editorconfig
       ;;ein
       (eval +overlay)
       ;;gist
       lookup
       lsp
       magit
       ;;make
       ;;pass
       ;;pdf
       ;;prodigy
       ;;rgb
       ;;taskrunner
       ;;terraform
       ;;tmux
       ;;upload

       :os
       ;;tty

       :lang
       ;;clojure
       common-lisp
       csharp
       emacs-lisp
       markdown
       org
       sh

       :config
       ;;literate
       (default +evil +bindings +smartparens))

(require 'temp-hacks "/home/benj/repos/lisp/doom-home/.doom.d/temp-hacks.el")
