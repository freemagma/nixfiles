(setq +latex-viewers '(pdf-tools))
;; (add-to-list 'warning-suppress-types '(undo discard-info))
(setq doom-theme 'doom-gruvbox)

(map! :after python
      :map python-mode-map
      :localleader
      "p" #'poetry)
