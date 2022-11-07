;; Mac OS X doesn't do 60 for frame height, let's try 50.
(cond ((eq system-type 'darwin)
       (progn (setq exordium-preferred-frame-height 50)
              (setq exordium-preferred-fonts '(("Droid Sans Mono"  . 140)
                                               ("DejaVu Sans Mono" . 140)
                                               ("Monospace"        . 140)
                                               ("Inconsolata"      . 140)
                                               ("Mono"             . 140)))
              (when (display-graphic-p)
		(setq exordium-theme 'tomorrow-day))))
      ((eq system-type 'windows-nt)
       (progn (setq exordium-preferred-frame-width 90
		    exordium-preferred-frame-height 30)
              (setq exordium-preferred-fonts '(("Cascadia Code"  . 120)
                                               ("Ubuntu Mono"    . 120)
                                               ("Azaret Mono"    . 120)
                                               ("Inconsolata"    . 120)
                                               ("Consola Mono"   . 120)
                                               ("Mono"           . 140)))
              (when (display-graphic-p)
		(setq exordium-theme 'tomorrow-day))))
      ((setq exordium-preferred-frame-width 90
	     exordium-preferred-frame-height 40)
       (setq exordium-preferred-fonts '(("Droid Sans Mono"  . 100)
                                        ("DejaVu Sans Mono" . 100)
                                        ("Monospace"        . 100)
                                        ("Inconsolata"      . 100)
                                        ("Mono"             . 100)))
       (when (display-graphic-p)
         (setq exordium-theme 'material))))

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

;; Set the default theme for non-graphical, graphics set above
;; 'tomorrow-day, tsdh-light is cool, too
(unless (display-graphic-p)
  (setq exordium-theme 'tsdh-dark))
