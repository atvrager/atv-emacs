(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (require 'ack-menu nil 'noerror)
  (package-install 'ack-menu))

(unless (require 'git-gutter-fringe nil 'noerror)
  (package-install 'git-gutter-fringe))

(unless (require 'color-theme-solarized nil 'noerror)
  (package-install 'color-theme-solarized))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq my-el-get-packages
      (append
       '(undo-tree evil lusty-explorer git-blame google-c-style go-mode magit multi-term lua-mode)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)

(require 'color-theme)
(load-theme 'solarized-dark)

(require 'evil)
(push 'mag-menu-mode evil-emacs-state-modes)
(evil-mode 1)

(setq evil-default-cursor t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen 1)

(setq-default indent-tabs-mode nil)
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style '(trailing space tabs tab-mark face))
(windmove-default-keybindings)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'java-mode-hook (lambda ()
                                (setq c-basic-offset 4
                                      tab-width 4
                                      indent-tabs-mode nil)))

(setq auto-mode-alist (cons '("\.cl$" . c-mode) auto-mode-alist))
(global-linum-mode 1)
(show-paren-mode 1)

(require 'tramp)
(setq tramp-default-method "scp")

(require 'multi-term)

(require 'git-gutter)
(setq git-gutter-fr:side 'right-fringe)
(global-git-gutter-mode 1)
(setq git-gutter:always-show-gutter 1)
