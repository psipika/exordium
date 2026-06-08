;;
;; Append to the extra package list packages I will use
;;

(setq exordium-extra-packages (append
                               '(atomic-chrome
                                 company
                                 dockerfile-mode
                                 forge
                                 graphql-mode
                                 graphviz-dot-mode
                                 groovy-mode
                                 hcl-mode
                                 jedi
                                 jinja2-mode
                                 markdown-toc
                                 tide
                                 yaml-mode)
                               exordium-extra-packages))
