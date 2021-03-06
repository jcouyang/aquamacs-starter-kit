;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))




;; (setq-default cursor-type 'box)
;; Load path etc.
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(add-to-list 'load-path dotfiles-dir)
;; (add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))

;; Load miscellaneous vendors modes
(setq vendor-files-dir (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path vendor-files-dir)

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))

;;;
(setq dropbox-everything-dir "~/Dropbox/Everything")

(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
		  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'psvn)
(require 'package)
;; backport some functionality to Emacs 22 if needed
(require 'dominating-file)


;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-magit)
(require 'starter-kit-anything)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
(require 'starter-kit-dired)
(require 'starter-kit-python)
(require 'starter-kit-yasnippet)
(require 'starter-kit-django)
(require 'starter-kit-org)
(require 'starter-kit-clojure)
(require 'starter-kit-evernote)
(require 'coffee-mode)
(require 'copy-without-selection)
(require 'web-mode)

(require 'powerline)
;; (require 'screencast-mode)
(require 'js2-mode)
(require 'keychord-settings)
(require 'skewer-mode)
(require 'skewer-setup)
(require 'handlebars-mode)
(key-chord-mode 1)

(add-to-list 'magic-mode-alist '("\\(?:<\\?xml\\s +[^>]*>\\)?\\s *<\\(?:!--\\(?:[^-]\\|-[^-]\\)*-->\\s *<\\)*\\(?:!DOCTYPE\\s +[^>]*>\\s *<\\s *\\(?:!--\\(?:[^-]\\|-[^-]\\)*-->\\s *\<\\)*\\)?[Hh][Tt][Mm][Ll]"
                                 . web-mode))
(add-to-list 'magic-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'magic-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'magic-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'magic-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'magic-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'magic-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'magic-mode-alist '("\\.djhtml\\'" . web-mode))
(add-hook 'web-mode-hook 'auto-complete-mode)

(require 'mustache-mode)
;; (require 'deft)
;; (setq deft-extension "org")
;; (setq deft-directory dropbox-everything-dir)
;; (setq deft-text-mode 'org-mode)
;; (global-set-key [f8] 'deft)

;;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat vendor-files-dir "/auto-complete-1.3.1/dict"))
(ac-config-default)
(require 'auto-highlight-symbol)
(require 'auto-highlight-symbol-config)
(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat "~/Library/Preferences/Aquamacs Emacs/" system-name ".el")
      user-specific-config (concat "~/Library/Preferences/Aquamacs Emacs/" user-login-name ".el")
      user-specific-dir (concat "~/Library/Preferences/Aquamacs Emacs/" user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
    (mapc #'load (directory-files user-specific-dir nil ".*el$")))
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
 
(provide 'init)
