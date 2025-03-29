# Emacs Doom Configuration

Este repositorio contiene mi configuración personalizada de Emacs Doom. A continuación, se explican los pasos para instalar Emacs Doom, configurarlo y utilizar este repositorio como tu configuración personal.

## 1. Instalación de Emacs y Doom Emacs

### 1.1 Instalar Emacs

Para Debian/Ubuntu:
```bash
sudo apt update && sudo apt install emacs
```

Para Arch Linux:
```bash
sudo pacman -S emacs
```

Para Fedora:
```bash
sudo dnf install emacs
```

Para macOS (usando Homebrew):
```bash
brew install emacs
```

### 1.2 Clonar e instalar Doom Emacs

```bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

Esto instalará Doom Emacs en `~/.config/emacs` y configurará sus dependencias.

## 2. Configurar este repositorio

### 2.1 Eliminar configuración anterior (opcional)
Si ya tienes una configuración en `~/.config/doom`, puedes hacer un backup antes de reemplazarla:

```bash
mv ~/.config/doom ~/.config/doom_backup
```

### 2.2 Clonar este repositorio en la carpeta de configuración de Doom

```bash
git clone https://github.com/tu_usuario/emacs-doom-config.git ~/.config/doom
```

## 3. Sincronizar y compilar Doom Emacs

Una vez clonado el repositorio, ejecuta:

```bash
~/.config/emacs/bin/doom sync
```

Para compilar la configuración y optimizar el rendimiento:

```bash
~/.config/emacs/bin/doom build
```

## 4. Iniciar Emacs Doom

Ahora puedes abrir Emacs y disfrutar de la configuración personalizada:

```bash
emacs
```

## 5. Actualizar la configuración

Si deseas actualizar la configuración desde el repositorio:

```bash
cd ~/.config/doom
git pull
~/.config/emacs/bin/doom sync
~/.config/emacs/bin/doom build
```

## 6. Desinstalar Doom Emacs (opcional)

Si alguna vez deseas eliminar Doom Emacs por completo, ejecuta:

```bash
rm -rf ~/.config/emacs ~/.config/doom ~/.emacs.d ~/.emacs ~/.doom.d ~/.doom.emacs.d
```

---

## Autor

**Daniel Tinivella**  
Repositorio mantenido por: Daniel Tinivella software engineer.

---

Ahora tienes todo listo para usar Emacs Doom con tu configuración personalizada.
