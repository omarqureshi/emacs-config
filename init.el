(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(set-face-attribute 'default nil :height 140)

;(let ((buffer (url-retrieve-synchronously
;	       "http://tromey.com/elpa/package-install.el")))
;  (save-excursion
;    (set-buffer buffer)
;    (goto-char (point-min))
;    (re-search-forward "^$" nil 'move)
;    (eval-region (point) (point-max))
;    (kill-buffer (current-buffer))))

(setq-default c-basic-offset 8
              tab-width 8)

(add-to-list 'load-path "~/.emacs.d/rhtml")
(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

;; visible bell
(setq visible-bell nil)
;; allow selection deletion
(delete-selection-mode t)
;; make sure delete key is delete key
(global-set-key [delete] 'delete-char)
;; turn on the menu bar
(menu-bar-mode 1)
;; have emacs scroll line-by-line
(setq scroll-step 1)

;; disable the word wrapping done by html-mode
;; we should be smart enough to do this ourselves!

(defun no-wrap-html-mode-hook ()
  (auto-fill-mode -1))

(add-hook 'html-mode-hook 'no-wrap-html-mode-hook)

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

(defun my-zoom (n)
"Increase or decrease font size based upon argument"
(set-face-attribute 'default (selected-frame) :height
(+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10))))
(global-set-key (kbd "C-=")      '(lambda nil (interactive) (my-zoom 1)))
(global-set-key [C-kp-add]       '(lambda nil (interactive) (my-zoom 1)))
(global-set-key (kbd "C--")      '(lambda nil (interactive) (my-zoom -1)))
(global-set-key [C-kp-subtract]  '(lambda nil (interactive) (my-zoom -1)))
(message "All done!")

(fset 'insertPound "#")
(global-set-key (kbd "M-3") 'insertPound)

(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'puppet-mode)
(setq auto-mode-alist  (cons '(".pp$" . puppet-mode) auto-mode-alist))

(require 'textmate)
(textmate-mode)
(require 'ido-hacks)

;(add-to-list 'load-path
;              "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet)
;(yas/global-mode 1)

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)

(add-to-list 'load-path "~/.emacs.d/vendor/mustache-mode.el")
(require 'mustache-mode)

(setq ido-ignore-directories '("\\`public/system"))
(setq ido-ignore-extensions t)

(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode")
(require 'haml-mode)

(require 'color-theme-tomorrow)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-tomorrow-night-eighties)))

(global-linum-mode)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-ignored-extensions (quote (".rbo" ".rbc" ".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".jpg" ".png" ".jpeg" ".gif" ".pdf"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
