(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/init-packages")


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



(require 'evil)
(require 'evil-numbers)
(evil-mode 1)
;; (evil-commentary-mode)
(require 'evil-matchit)



(require 'evil-exchange)
(evil-exchange-install)


(global-evil-matchit-mode 1)
(global-evil-leader-mode)
(global-linum-mode 1)



