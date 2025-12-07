if ! contains "$HOME/.local/bin" $PATH
    set --export --prepend PATH "$HOME/.local/bin"
end

if ! contains "$HOME/bin" $PATH
    set --export --prepend PATH "$HOME/bin"
end

if ! set --query ZETTELKASTEN_ROOT && test -d "$HOME/Documents/zettelkasten"
    set --export --global ZETTELKASTEN_ROOT "$HOME/Documents/zettelkasten"
end

if command --query nvim
    set --export --global EDITOR (command -v nvim)
end
