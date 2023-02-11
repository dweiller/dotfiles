function __fish_zig_complete_build_steps
    set -l lines (zig build --help 2>/dev/null | grep "^  [a-zA-Z]")
    if [ $status -eq 0 ]
        for line in $lines
            set -l step (string split -n -f1 " " $line)
            set -l desc (string split -n -m3 -f2 " " $line | string replace -r "  +" " ")
            echo (string join \t -- $step $desc)
        end
    end
end

function __fish_zig_build_in_project_option
    test -D = (string sub -l 2 -- $argv[1])
end

function __fish_zig_complete_project_options
    set -l lines (zig build --help 2>/dev/null | grep -e "^  -D")
    if [ $status -eq 0 ]
        for line in $lines
            set -l option (string match -r -- "-D.*=" $line)
            set -l desc (string sub -s (math 3 + (string length -- $option)) $line)
            echo (string join \t -- $option $desc)
        end
    end
end

function __fish_zig_build_in_build_command
    __fish_seen_subcommand_from build ;and not __fish_seen_subcommand_from -- "--"
end

function __fish_zig_at_option_value
    commandline -t | string match -r -- "-D[^ ]="
end

function __fish_zig_complete_option_value
    echo true\nfalse
end

set -l all_commands build init-exe init-lib ast-check build-exe build-lib build-obj fmt run test translate-c ar cc c++ dlltool lib ranlib env help libc targets version zen

complete -f -k -c zig -c zigz -n "not __fish_seen_subcommand_from $all_commands" -a "$all_commands"

complete -f -k -c zig -c zigz -n "__fish_zig_build_in_build_command" -a "(__fish_zig_complete_build_steps)"

complete -f -c zig -c zigz -n "__fish_zig_build_in_build_command ;and __fish_zig_build_in_project_option (commandline -ct)" \
-a "(__fish_zig_complete_project_options)"

complete -f -c zig -c zigz -n "__fish_zig_at_option_value" -a "true"

complete -F -c zig -c zigz -n "__fish_seen_subcommand_from \"--\""
