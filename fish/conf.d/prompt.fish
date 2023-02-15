set -g __fish_git_prompt_char_dirtystate •
set -g __fish_git_prompt_char_upstream_ahead "↑ "
set -g __fish_git_prompt_char_upstream_behind "↓ "
set -g __fish_git_prompt_char_upstream_equal
set -g __fish_git_prompt_char_upstream_prefix

set -g __fish_git_prompt_showdirtystate true
set -g __fish_git_prompt_showupstream verbose

set -g __fish_git_prompt_showcolorhints true
set -g __fish_git_prompt_color_merging yellow
set -g __fish_git_prompt_color_upstream magenta

set --global _prompt_vcs_atom _prompt_vcs_atom_$fish_pid

function $_prompt_vcs_atom --on-variable $_prompt_vcs_atom
    commandline --function repaint
end

function _prompt_vcs_async --on-event fish_prompt
    command kill $_prompt_vcs_atom_last_pid 2>/dev/null
    fish --private --command "set --universal $_prompt_vcs_atom (fish_vcs_prompt)" &
    set --global _prompt_vcs_atom_last_pid (jobs --last --pid)
end

function _prompt_vcs_fish_exit --on-event fish_exit
    set --erase $_prompt_vcs_atom
end

function _prompt_pwd --argument color
    set -l git_root (command git --no-optional-locks rev-parse --show-toplevel 2>/dev/null)
    set -l git_base (string replace --all --regex -- "^.*/" "" "$git_root")
    set -l path_sep /

    set -l bold (set_color --bold)
    set -l dim (set_color --dim)
    set -l normal (set_color normal)

    string replace --ignore-case -- ~ \~ $PWD |
    string replace -- "/$git_base/" /:/ |
    string replace --regex --all -- "(\.?[^/]{1})[^/]*/" "\$1$path_sep" |
    string replace -- : "$git_base" |
    string replace --regex -- '([^/]+)$' "$bold\$1$normal" |
    string replace --regex --all '(?!^/$)/|^$' "$dim/$normal$color"
end
