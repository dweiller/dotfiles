function fish_mode_prompt
    if test "$fish_key_bindings" != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol
        set --local background_color --background=brblack
        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color yellow --bold $background_color)
                set vi_mode_symbol N
            case insert
                set vi_mode_color (set_color white --bold $background_color)
                set vi_mode_symbol I
            case replace replace_one
                set vi_mode_color (set_color magenta --bold $background_color)
                set vi_mode_symbol R
            case visual
                set vi_mode_color (set_color magenta --bold $background_color)
                set vi_mode_symbol V
        end
        echo -e "$vi_mode_color $vi_mode_symbol" (set_color $fish_color_normal)" "
    end
end
