;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)


;;add whatever packages you want here
(defvar MorosithII/packages '(
				 company
				 hungry-delete
				 swiper
				 counsel
				 smartparens
				 exec-path-from-shell
				 popwin
				 ivy
				 ;;theme
				 solarized-theme
				 )  "Default packages")

(setq package-selected-packages MorosithII/packages)

(defun MorosithII/packages-installed-p ()
  (loop for pkg in MorosithII/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (MorosithII/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg MorosithII/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


(global-company-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)

;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA

(load-theme 'solarized-dark 1)

(provide 'init-packages)

