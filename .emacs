
;; Add new load path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(setq default-frame-alist
      '((top . 200) (left . 400)
        (width . 80) (height . 40)
;;        (cursor-color . "green")
        (cursor-type . box)
;;        (foreground-color . "color-250")
;;        (background-color . "black")
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

;; Enable git in emacs
;;(load "/usr/share/doc/git-1.7.1/contrib/emacs/git.el")

;; Cscope keymaps
;;(define-key global-map [(control f3)]  'cscope-set-initial-directory)
;;(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
;; (define-key global-map [(control f5)] 'cscope-find-this-symbol)
;; (define-key global-map [(control f6)] 'cscope-find-global-definition)
;; (define-key global-map [(control f7)] 'cscope-find-global-definition-no-prompting)
;; (define-key global-map [(control f8)]  'cscope-pop-mark)
;; (define-key global-map [(control f9)] 'cscope-next-symbol)
;; (define-key global-map [(control f10)] 'cscope-next-file)
;; (define-key global-map [(control f11)] 'cscope-prev-symbol)
;; (define-key global-map [(control f12)] 'cscope-prev-file)
;; (define-key global-map [(meta f9)]  'cscope-display-buffer)
;; (defin-ekey global-map [(meta f10)] 'cscope-display-buffer-toggle)

;; This is for cedet auto-completion and such
;;(load-file "~/programs/cedet-1.1/common/cedet.el")
;;(add-to-list 'load-path "~/programs/cedet-1.1/semantic")
;;(require 'semantic-ia)
;;(semantic-add-system-include "/proj/pt/home/etorwas/proj_pt/" 'c-mode)
;;(global-ede-mode 1)                      ;; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ;; Enable prototype help and smart completion
;;(global-srecode-minor-mode 1)            ;; Enable template insertion menu
;; Hooks for cedet auto-completion and such
;;(defun my-cedet-hook ()
;;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; Try to use cscope database for autocompletion and such
;;(ede-cpp-root-project "pt"
;;                :name "pt project"
;;                :file "/proj/pt/home/etorwas/proj_pt/pt_top/CMakeLists.txt"
;;                :include-path '("/proj/pt/home/etorwas/proj_pt/pt_top/")
;;                :system-include-path '("/proj/pt/home/etorwas/proj_pt/pt_top/"))

;;(setq ede-locate-setup-options
;;      '(ede-locate-cscope
;;        ede-locate-base))
;;(semanticdb-enable-cscope-databases)
;; Define some projects

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

;;(require 'eclim)
;;(setq eclim-auto-save t)
;;(global-eclim-mode)

;; Enable auto-completion
;;(require 'auto-complete-config)

;;(require 'ac-emacs-eclim-source)
;;(add-hook 'eclim-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-emacs-eclim)))

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

;; END OF FILE

(put 'downcase-region 'disabled nil)
