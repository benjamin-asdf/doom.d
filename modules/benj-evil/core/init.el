


(defun benj/set-evil-cursor (state shape)
  (set (intern (format "evil-%s-state-cursor" state)) shape))


(defun benj/eval-sexp-on-line ()
  (save-excursion
    (goto-char (line-end-position))
    (eval-last-sexp nil)))
