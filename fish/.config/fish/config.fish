if status is-interactive
    bind -M insert \cO accept-autosuggestion
    bind -M insert \e, history-token-search-forward
    bind -M insert \cN history-search-backward
    bind -M insert \cP history-search-forward
    bind -M insert \cR history-pager
    bind -M insert \cS pager-toggle-search
    bind -M insert \cE edit_command_buffer
    bind -M insert \cl forward-bigword

    abbr -a bat batcat
    abbr -a fd fdfind
    abbr -a zb zig build

    abbr -a gs git status
    abbr -a ga git add
    abbr -a gd git diff
    abbr -a gf git fetch
    abbr -a gap git add --patch
    abbr -a gsw git switch
    abbr -a glg git ga
    abbr -a gds git diff --staged
    abbr -a gco git checkout
    abbr -a gca git commit --amend
    abbr -a gcm git commit -m

    abbr -a ntd nvim TODO

    if command -q zoxide
        zoxide init fish --cmd cd | source
    end
end
