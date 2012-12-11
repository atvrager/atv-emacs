(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq my-el-get-packages
      (append
       '(undo-tree evil lusty-explorer full-ack git-blame google-c-style go-mode magit multi-term)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)

(load-theme 'wombat)
(require 'evil)
(evil-mode 1)
(setq evil-default-cursor t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen 1)

(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(if (not (executable-find "ack"))
  (setq ack-executable (executable-find "ack-grep")))

(setq-default indent-tabs-mode nil)
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style '(trailing space tabs tab-mark face))
(windmove-default-keybindings)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(global-linum-mode 1)
(show-paren-mode 1)

(require 'tramp)
(setq tramp-default-method "scp")

(require 'multi-term)
