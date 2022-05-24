(setq +latex-viewers '(pdf-tools))
;; (add-to-list 'warning-suppress-types '(undo discard-info))
(setq doom-theme 'doom-gruvbox)
(setq display-line-numbers-type 'relative)

(map! :after python
      :map python-mode-map
      :localleader
      "p" #'poetry)
