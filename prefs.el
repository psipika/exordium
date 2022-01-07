;; Mac OS X doesn't do 60 for frame height, let's try 50.
(when (eq system-type 'darwin)
    (setq exordium-preferred-frame-height 50))

; Explicitly ask for 'yes' or 'no'.
(setq exordium-enable-y-or-n nil)

;; Disable linum-mode by default.
(setq exordium-global-display-line-numbers nil)

;; Disable cleaning up whitespace by default
(setq exordium-delete-trailing-whitespace nil)

;; Enable final endline at end of file
(setq require-final-newline t)

;; Disable C-z as undo.
(setq exordium-keyboard-ctrl-z-undo nil)

;; Enable exordium's cmake support for rtags.
(setq exordium-rtags-cmake t)

;; Set the default theme, only if graphical.
;; used to be 'material
;; 'tomorrow-day, tsdh-light is cool, too
(if (display-graphic-p)
    (setq exordium-theme 'tomorrow-day)
  (setq exordium-theme 'tsdh-dark))
;;(setq exordium-theme 'tsdh-dark)

;; Default configuration for daemon and client
(setq exordium-preferred-frame-width 90
      exordium-preferred-frame-height 70)
(setq exordium-preferred-fonts '(("Droid Sans Mono"  . 140)
                                 ("DejaVu Sans Mono" . 140)
                                 ("Monospace"        . 140)
                                 ("Inconsolata"      . 140)
                                 ("Mono"             . 140)))

;;
;; Append to the extra package list packages I will use
;;
(append '((graphviz-dot-mode       . "melpa-pinned")
          (atomic-chrome           . "melpa-pinned")
          (groovy-mode             . "melpa-pinned")
          (forge                   . "melpa-pinned")
          (tide                    . "melpa-pinned")
          (jinja2-mode             . "melpa-pinned")
          (dockerfile-mode         . "melpa-pinned"))
        exordium-extra-packages)
