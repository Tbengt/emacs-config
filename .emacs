(require 'package) ;; You might already have this line
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(require 'helm-eshell)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

(helm-mode 1)

;; (semantic-mode 1)

;; Company
;;(require 'company)

;;(setq company-clang-executable "/app/vbuild/RHEL6-x86_64/clang/4.0.0/bin/clang")

;;(setq company-backends (delete 'company-semantic company-backends))

;;(global-company-mode 1)

;;(company-begin-backend 'company-clang)

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
 '(package-selected-packages (quote (haskell-mode company helm)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/x86_64-montavista-linux-gnu/include/c++/4.7.0/" "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/x86_64-montavista-linux-gnu/include/c++/4.7.0/x86_64-montavista-linux-gnu/" "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/x86_64-montavista-linux-gnu/include/c++/4.7.0/backward/" "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/lib/gcc/x86_64-montavista-linux-gnu/4.7.0/include/" "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/lib/gcc/x86_64-montavista-linux-gnu/4.7.0/include-fixed/" "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/x86_64-montavista-linux-gnu/include/" "-I/proj/pt/ptr3/installs/mvip-x86-generic-3.10-1.4_local_170120191659/montavista/tools/x86_64-gnu/x86_64-montavista-linux-gnu/sys-root/usr/include/" "-I/workspace/git/etorwas/lime/pt_esw/build/internal/pt6040_dev/pt/includes/" "-I/workspace/git/etorwas/lime/pt_esw/build/internal/pt6040_dev/include/" "-I/workspace/git/etorwas/lime/pt_esw/build/internal/pt6040_dev/include/gsntrace/"))))
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

;; Man pages in emacs on F1
(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))

(put 'downcase-region 'disabled nil)

;; Clang formatting
(load "/app/vbuild/RHEL6-x86_64/clang/4.0.0/share/clang/clang-format.el")
(global-set-key (kbd "<backtab>") 'clang-format-region)

;; END OF FILE
