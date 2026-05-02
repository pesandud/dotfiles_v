# Matugen generated syntax highlighting colors

# This line ensures Zsh treats this as a Map/Dictionary
typeset -A ZSH_HIGHLIGHT_STYLES

# Valid commands, aliases, and functions
ZSH_HIGHLIGHT_STYLES[command]='fg={{colors.primary.default.hex}}'
ZSH_HIGHLIGHT_STYLES[alias]='fg={{colors.secondary.default.hex}}'
ZSH_HIGHLIGHT_STYLES[builtin]='fg={{colors.primary.default.hex}}'
ZSH_HIGHLIGHT_STYLES[function]='fg={{colors.secondary.default.hex}}'

# Invalid/Error tokens
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg={{colors.error.default.hex}}'

# Strings and Paths
ZSH_HIGHLIGHT_STYLES[string]='fg={{colors.tertiary.default.hex}}'
ZSH_HIGHLIGHT_STYLES[path]='fg={{colors.on_surface_variant.default.hex}},underline'

# Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg={{colors.outline.default.hex}}'

# Brackets & Operators
ZSH_HIGHLIGHT_STYLES[bracket]='fg={{colors.on_surface_variant.default.hex}}'
