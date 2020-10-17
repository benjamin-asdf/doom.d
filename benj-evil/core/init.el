


(defun benj/set-evil-cursor (state shape)
  (set (intern (format "evil-%s-state-cursor" state)) shape))
