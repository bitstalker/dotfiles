#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

### Wayland environment variables ###
export QT_QPA_PLATFORM=wayland
# export QT_WAYLAND_FORCE_DPI=physical
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
# https://github.com/swaywm/sway/wiki#sway-16-shows-garbage-on-nouveau
export WLR_DRM_NO_MODIFIERS=1

### ssh-agent / gpg-agent ###
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

### hardware video acceleration ###
export VDPAU_DRIVER=va_gl

### start sway ####

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
fi
