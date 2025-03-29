;;; dashboard.el -*- lexical-binding: t; -*-

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)))
  (setq dashboard-footer-messages '("Emacs - The Editor for Life"))
  (setq dashboard-banner-logo-title (format "Welcome to Emacs | %s" (system-name)))
