;; Tema de Doom Emacs
(setq doom-theme 'doom-zenburn);; doom-vibranr

;; Habilitar números de línea
;; (setq display-line-numbers-type t)i ;; habitar con t
(setq display-line-numbers-type nil)

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
  ;; Desactiva las combinaciones por defecto (j/k/l/s)
  (map! :n "j" nil
        :n "k" nil
        :n "l" nil
        :n "s" nil)
  
  ;; Asigna las nuevas teclas Dvorak para movimiento
  (map! :n "h" #'evil-backward-char    ; h → izquierda
        :n "t" #'evil-next-line        ; t → abajo
        :n "n" #'evil-previous-line    ; n → arriba
        :n "s" #'evil-forward-char))   ; s → derecha

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



;; (setq-default mode-line-format
;;    '("%e"
;;      mode-line-front-space
;;      mode-line-mule-info
;;      mode-line-client
;;      mode-line-modified
;;      " "
;;      mode-line-buffer-identification
;;      "   "
;;      mode-line-position
;;      "  "
;;      (:eval (format " [%s]" (upcase (symbol-name major-mode))))
;;      "  | "
;;      (:eval (system-name))
;;      "  | Tinix "
;;      "  | Emacs "))
;;
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
    (:eval (format " [%s]" (upcase (symbol-name major-mode))))
    "  | "
    (:eval (system-name))
    "  | Tinix "

    ;; Git Branch (súper simple)
    (:eval
     (when (and vc-mode (buffer-file-name))
       (if-let ((branch (car (vc-git-branches))))
           (format "  | %s" branch)
         "")))))


;; Copy and Past
(use-package! xclip
  :config
  (xclip-mode 1))

;;Activar soporte para el mouse en Emacs
(xterm-mouse-mode 1)  ;; Habilita el soporte del mouse en terminales
(mouse-avoidance-mode 'animate)  ;; Hace que el cursor se mueva cuando el mouse lo toca

;; Activar el soporte del mouse en GUI (si usas Emacs con interfaz gráfica)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . 1)))  ;; Configura el desplazamiento del ratón
(setq mouse-wheel-progressive-speed nil)  ;; Desactiva la aceleración del ratón
(setq mouse-visual-mode t)  ;; Permite ver las selecciones con el mouse

;; Mejorar Treemacs activando el mouse
(after! treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; Abrir treemacs en el dir actual
(setq treemacs-display-in-side-window t)  ;; Muestra Treemacs en una ventana lateral
(setq treemacs-show-hidden-files t)  ;; Muestra archivos ocultos
(setq treemacs-follow-mode 1)  ;; Sigue el directorio actual del archivo
