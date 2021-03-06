function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
	set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            if [ $last_status != 0 ]
                set color_cwd red
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '>'
    end

    echo -n -s (set_color $color_cwd) $last_status " " (prompt_pwd) (set_color normal) "$suffix "
end
