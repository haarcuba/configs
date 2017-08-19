
(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-list
      '(evil evil-numbers evil-matchit evil-exchange ace-jump-mode))


(package-initialize) ;; You might already have this line

(unless package-archive-contents
    (package-refresh-contents))


(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

