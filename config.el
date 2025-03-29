;; Tema de Doom Emacs
(setq doom-theme 'doom-opera)

;; Habilitar números de línea
(setq display-line-numbers-type t)

;; Configurar directorio de Org
(setq org-directory "~/org/")

;; Codeium configuration for Doom Emacs
(use-package! codeium
  :init
  (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
  :config
  (setq codeium-api-enabled t))

;; config treemacs change windows
;; (after! evil
;;   (define-key evil-normal-state-map (kbd "C-h") 'evil-window-map))

(after! evil
  ;; Desactiva las combinaciones por defecto (j/k/l)
  (map! :n "j" nil)
  (map! :n "k" nil)
  (map! :n "l" nil)
  (map! :n "s" nil)

(after! evil
  ;; Asigna las nuevas teclas Dvorak para movimiento
  (map! :n "h" #'evil-backward-char)   ; h → izquierda
  (map! :n "t" #'evil-next-line)       ; t → abajo
  (map! :n "n" #'evil-previous-line)   ; n → arriba
  (map! :n "s" #'evil-forward-char)))

;; ;; Movimiento entre ventanas con Alt + h/l
;; (map! :g "M-w h" #'windmove-left)   ; Alt + h → ventana izquierda
;; (map! :g "M-w l" #'windmove-right)  ; Alt + l → ventana derecha~]

;; Configuración para Codeium

(use-package! codeium
  :init
  (setq codeium-auth-token "eyJhbGciOiJSUzI1NiIsImtpZCI6IjMwYjIyMWFiNjU2MTdiY2Y4N2VlMGY4NDYyZjc0ZTM2NTIyY2EyZTQiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiRGFuaWVsIFRpbml2ZWxsYSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NJUWY3WGlZNU5SQ3NUVlhvZk9pdFRXRjQzcUJReVdIeHczX3daeEx0SnBYYzQ9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZXhhMi1mYjE3MCIsImF1ZCI6ImV4YTItZmIxNzAiLCJhdXRoX3RpbWUiOjE3MDAwODA0ODYsInVzZXJfaWQiOiJ3blJLOVZyWTFBU0xuQUIweWZBcWcxd2tNWk0yIiwic3ViIjoid25SSzlWclkxQVNMbkFCMHlmQXFnMXdrTVpNMiIsImlhdCI6MTc0MzE2NDEyNiwiZXhwIjoxNzQzMTY3NzI2LCJlbWFpbCI6ImR0aW5pdmVsbGFAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDA0MDcwOTUwMDYwNjY4MDM0NzQiXSwiZW1haWwiOlsiZHRpbml2ZWxsYUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJnb29nbGUuY29tIn19.PMS2INCq15ViAwY-qQqT_ORWy-oGxtbOmDQ77-gUEe8v6yHOWCBZu_ak8BHvAaM0epXfJ93SMwUF3IZMTu7vh7xDB6VCXNvATV8t3OFb5FRc2UW9miNwsDQhPOGYIpVD-Y3SjqVNEnr1287ThUX8w2ckPx5egZakZJxOOQMsuMS-vuH9YtqdamVxZh47iAjuDwkbSgZ2lTr74PXAjoas8nSOin5je0Tb-LOWCMwN1xIWJOYwZZvQQ5rlsaZ09Z5UATQwv7QwejTB-sytQXEgUSuWIofSXdG9bP1pOD3F-k7O1aCJgNn7U1z_xbvTC-b18hIuNypygWiFvHw_MjK8yw"))


(use-package! company
  :config
  (global-company-mode 1))


(use-package! flycheck
  :config
  (global-flycheck-mode 1))


;; Confirmation exit emacs
(setq confirm-kill-emacs nil)


;; Función para mover una línea o bloque seleccionado hacia arriba
(defun move-line-or-region-up ()
  "Mueve la línea actual o la región seleccionada hacia arriba."
  (interactive)
  (if (use-region-p) ;; Verifica si hay una región seleccionada
      (let ((start (region-beginning))
            (end (region-end)))
        (goto-char start)
        (transpose-regions start end (line-beginning-position -1) (line-beginning-position))
        (forward-line -1))
    ;; Si no hay región seleccionada, mueve solo la línea
    (transpose-lines 1)
    (forward-line -2)))

;; Función para mover una línea o bloque seleccionado hacia abajo
(defun move-line-or-region-down ()
  "Mueve la línea actual o la región seleccionada hacia abajo."
  (interactive)
  (if (use-region-p) ;; Verifica si hay una región seleccionada
      (let ((start (region-beginning))
            (end (region-end)))
        (goto-char start)
        (transpose-regions start end (line-beginning-position 1) (line-beginning-position 2))
        (forward-line 1))
    ;; Si no hay región seleccionada, mueve solo la línea
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)))

;; Asignar las funciones a las teclas M-k y M-j
(global-set-key (kbd "M-k") #'move-line-or-region-up)
(global-set-key (kbd "M-j") #'move-line-or-region-down)

;; Config treemacs
(use-package! treemacs
  :defer t
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))


;; Proyectile
(use-package! projectile
  :config
  (projectile-mode +1))


(use-package! fzf
  :defer t)


(map! :leader
      :desc "Switch to treemacs" "w w" #'treemacs-select-window)


(after! treemacs
;; Asigna 't' para mover hacia abajo
    (map! :map treemacs-mode-map
    :desc "Move down" "t" #'treemacs-next-line
    :desc "Move up" "n" #'treemacs-previous-line))

(setq-default mode-line-format
  '("%e"
    mode-line-front-space
    mode-line-mule-info
    mode-line-client
    mode-line-modified
    " "
    mode-line-buffer-identification
    "   "
    mode-line-position
    "  "
    (:eval (format " [%s]" (upcase (symbol-name major-mode)))) ;; Muestra el lenguaje
    "  | "
    (:eval (system-name)) ;; Muestra el nombre del sistema
    "  | Tinix "
    "  | Emacs "))
