;; Mac OS X doesn't do 60 for frame height, let's try 50.
(when (eq system-type 'darwin)
    (setq exordium-preferred-frame-height 50))

;; Set default width to 90
(setq exordium-preferred-frame-width 90)

;; Ask for confirmation when quitting emacs.
(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill emacs? "))
            kill-emacs-query-functions))

;; Explicitly ask for 'yes' or 'no'.
(setq exordium-enable-y-or-n nil)

;; Disable linum-mode by default.
(setq exordium-display-line-numbers nil)

;; Use C-F12 to enable linum-mode.
(global-set-key [(control f12)] 'linum-mode)

;; Man page lookup on F1
(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key [(f2)] 'speedbar-get-focus)

;; Custom settings for autotools projects
(global-set-key [(f4)] (lambda () (interactive) (compile "ant -emacs")))
(global-set-key [(f5)] (lambda (prefix) (interactive "bEnter prefix: ") (compile "./configure --prefix=" prefix " && make")))
(global-set-key [(f6)] (lambda () (interactive) (compile "make -k")))
(global-set-key [(f7)] (lambda () (interactive) (compile "make clean")))

;; Automagically load file at point (or corresponding component file)
(global-set-key [(f10)] 'ff-find-other-file)

;; Display 24-hour time
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; For dot-mode, use 'C-c x' as preview.
(global-set-key [(control c)(x)] 'graphviz-dot-preview)

;; Set the default theme.
(setq exordium-theme 'material)

;; Disable ad-handle-definition warnings.
(setq ad-redefinition-action 'accept)

;; Ask for confirmation before quitting the client frame
(defun save-buffers-kill-terminal--confirm-around (orig-fun &rest args)
  "Confirm killing client"
  (interactive)
  (when (and (frame-parameter nil 'client)
             (yes-or-no-p "Really quit Emacs Client?"))
    (apply orig-fun args)))
(advice-add 'save-buffers-kill-terminal :around #'save-buffers-kill-terminal--confirm-around)
