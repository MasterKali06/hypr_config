if status is-interactive
    # Commands to run in interactive sessions can go here
end

# --- Android SDK setup ---
set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/bin
set -x PATH $PATH $HOME/Android/Sdk/cmdline-tools/latest/bin

# --- Java setup (optional, if needed) ---
# If using OpenJDK from Arch:
set -x JAVA_HOME /usr/lib/jvm/java-17-openjdk

# Enable bracketed paste
function enable_bracketed_paste --on-event fish_prompt
    printf '\e[?2004h'
end

function disable_bracketed_paste --on-event fish_preexec
    printf '\e[?2004l'
end
nvm use 18 --silent
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

alias ssh='env TERM=xterm-256color ssh'
