(require 'package) ;; You might already have this line
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; Add new load path
(add-to-list 'load-path "~/.emacs.d/lisp")

(setq default-frame-alist
      '((top . 200) (left . 400)
        (width . 80) (height . 40)
        (cursor-type . box)
        )
      )

(setq initial-frame-alist '((top . 10) (left . 30)))

(setq-default indent-tabs-mode nil)

(setq c-default-style "linux"
      c-basic-offset 2)

(setq ring-bell-function 'ignore)

;; Disable line wrapping
(set-default 'truncate-lines t)

;; Set mark shortcut
(global-set-key (kbd "S-SPC") 'set-mark-command)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-fill-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(eclim-eclipse-dirs (quote ("/home/etorwas/programs/eclipse")))
 '(fill-column 100)
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))

;; Make sure all emacs backup files are saved in the same directory.
(setq backup-directory-alist
      `((".*" . ,"/home/etorwas/.emacs_backup_files")))
(setq auto-save-file-name-transforms
      `((".*" ,"/home/etorwas/.emacs_backup_files" t)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; This is for cscope lookup
(require 'xcscope)

;; This is important as searches are otherwise very very slow
(setq cscope-do-not-update-database 1)

;; Toggle window dedication
(defun toggle-window-dedicated ()
"Toggle whether the current active window is dedicated or not"
(interactive)
(message
 (if (let (window (get-buffer-window (current-buffer)))
       (set-window-dedicated-p window
                               (not (window-dedicated-p window))))
    "Window '%s' is dedicated"
    "Window '%s' is normal")
 (current-buffer)))

(global-set-key "\M-[p" 'toggle-window-dedicated)

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Keybindings for changing active buffer
(global-set-key (kbd "<f5>") 'windmove-left)
(global-set-key (kbd "<f8>") 'windmove-right)
(global-set-key (kbd "<f6>") 'windmove-up)
(global-set-key (kbd "<f7>") 'windmove-down)
(setq windmove-wrap-around t)
;; Rebind C-i to indent region
(global-set-key (kbd "\C-i") 'indent-region)
;; Make sure to remove trainling white space from files
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)


(add-to-list 'load-path (expand-file-name "/home/etorwas/programs/emacs/emacs-eclim/"))
;; only add the vendor path when you want to use the libraries provided with emacs-eclim
(add-to-list 'load-path (expand-file-name "/home/etorwas/programs/emacs/emacs-eclim/vendor"))

;;for bitbake syntax highlighting.
 (require 'bb-mode)
    (setq auto-mode-alist (cons '("\\.bb$" . bb-mode) auto-mode-alist))
    (setq auto-mode-alist (cons '("\\.inc$" . bb-mode) auto-mode-alist))
    (setq auto-mode-alist (cons '("\\.bbappend$" . bb-mode) auto-mode-alist))
    (setq auto-mode-alist (cons '("\\.bbclass$" . bb-mode) auto-mode-alist))
    (setq auto-mode-alist (cons '("\\.conf$" . bb-mode) auto-mode-alist))

;; Horizontal marker for current line
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "color-233")

;; Man pages in emacs on F1
(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))

(put 'downcase-region 'disabled nil)

;; END OF FILE
