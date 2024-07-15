(setq inhibit-startup-message t) ; Don't show the splash screen
(setq visible-bell t)            ; Flash when the bell rings

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; visual configurations
(global-display-line-numbers-mode 1)
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(require 'vscode-dark-plus-theme "~/.config/emacs/themes/vscode-dark-plus-theme.el")
(load-theme 'vscode-dark-plus t)
(set-frame-font "Monospace 20" nil t)


;; functional configurations

(require 'company)
(company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)


(customize-set-variable 'eglot-autoshutdown t)
(customize-set-variable 'eglot-extend-to-xref t)

(with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
	'((c-mode c++-mode)
		. ("clangd"
		    "-j=8"
		    "--log=error"
		    "--malloc-trim"
		    "--background-index"
		    "--clang-tidy"
		    "--cross-file-rename"
		    "--completion-style=detailed"
		    "--pch-storage=memory"
		    "--header-insertion=never"
		    "--header-insertion-decorators=0"))))

(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
