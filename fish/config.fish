if status is-interactive
    bind -M insert \cO accept-autosuggestion
    bind -M insert \e, history-token-search-forward
    bind -M insert \cN history-search-backward
    bind -M insert \cP history-search-forward
    bind -M insert \cR history-pager
    bind -M insert \cS pager-toggle-search
    bind -M insert \cE edit_command_buffer

    abbr -a bat batcat
    abbr -a fd fdfind
    abbr -a gs git status
    abbr -a ga git add
    abbr -a gd git diff
    abbr -a gf git fetch
    abbr -a gap git add --patch
    abbr -a gsw git switch
    abbr -a glg git ga

end
