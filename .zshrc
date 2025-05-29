# Functions
if [ -f ~/.shell/functions.sh ]; then
    source ~/.shell/functions.sh
fi

# Settings
if [ -f ~/.zsh/settings.zsh ]; then
    source ~/.zsh/settings.zsh
fi

# External plugins (initialized before)
if [ -f ~/.zsh/plugins_before.zsh ]; then
    source ~/.zsh/plugins_before.zsh
fi

# Custom prompt
if [ -f ~/.zsh/prompt.zsh ]; then
    source ~/.zsh/prompt.zsh
fi

# External plugins (initialized after)
if [ -f ~/.zsh/plugins_after.zsh ]; then
    source ~/.zsh/plugins_after.zsh
fi

# Aliases
if [ -f ~/.shell/aliases.sh ]; then
    source ~/.shell/aliases.sh
fi

# Allow private customization (not checked in to version control)
if [ -f ~/.shell_private ]; then
    source ~/.shell_private
fi

