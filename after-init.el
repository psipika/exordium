;;
;; Custom configuration for my own instance
;;

;; Ask for confirmation when quitting emacs.
(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill emacs? "))
            kill-emacs-query-functions))

;; Use atomic-chrome extension
(use-package atomic-chrome)
(ignore-errors
    (atomic-chrome-server-start))

;; Use C-F12 to enable nlinum-mode and F12 for linum-mode
(global-set-key [(control f12)] 'exordium-global-display-line-numbers-mode)
(global-set-key [(f12)] 'global-linum-mode)

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

;; Disable ad-handle-definition warnings.
(setq ad-redefinition-action 'accept)

;; Disable audible bell
(setq visible-bell t)

;; Ask for confirmation before quitting the client frame
(defun save-buffers-kill-terminal--confirm-around (orig-fun &rest args)
  "Confirm killing client"
  (interactive)
  (when (and (frame-parameter nil 'client)
	     (yes-or-no-p "Really quit Emacs Client? "))
    (apply orig-fun args)))

;; Daemon - Client config
(cond ((daemonp)
       (message "Setting prefs for emacsclient")
       (setq default-frame-alist
             (append `((vertical-scroll-bars . right)
                       (internal-border-width . 0)
                       (horizontal-scroll-bars . t))
                     default-frame-alist))
       (advice-add 'save-buffers-kill-terminal :around #'save-buffers-kill-terminal--confirm-around))

       (t
        (message "Setting prefs for emacs")
        ))

;;
;; Enable company mode globally
;;
(add-hook 'after-init-hook 'global-company-mode)
