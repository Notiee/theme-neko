# Colors
set __neko_color_orange FD971F
set __neko_color_blue 6EC9DD
set __neko_color_green A6E22E
set __neko_color_yellow E6DB7E
set __neko_color_pink F92672
set __neko_color_grey 554F48
set __neko_color_white F1F1F1
set __neko_color_purple 9458FF
set __neko_color_lilac AE81FF

# Functions
function __neko_color_echo
  set_color $argv[1]
  if test (count $argv) -eq 2
    echo -n $argv[2]
  end
end

function __neko_current_date
  __neko_color_echo $__neko_color_orange ' ['
  __neko_color_echo $__neko_color_white (date "+%H:%M:%S")
  __neko_color_echo $__neko_color_orange ']'
end

function __neko_current_folder
  if test $PWD = '/'
    echo -n '/'
  else
    echo -n $PWD | grep -o -E '[^\/]+$'
  end
end

function __neko_git_status_codes
  echo (git status --porcelain 2> /dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n')
end

function __neko_git_branch_name
  echo (git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function __neko_rainbow
  if echo $argv[1] | grep -q -e $argv[3]
    __neko_color_echo $argv[2] "彡ミ"
  end
end

function __neko_git_status_icons
  set -l git_status (__neko_git_status_codes)

  __neko_rainbow $git_status $__neko_color_pink 'D'
  __neko_rainbow $git_status $__neko_color_orange 'R'
  __neko_rainbow $git_status $__neko_color_white 'C'
  __neko_rainbow $git_status $__neko_color_green 'A'
  __neko_rainbow $git_status $__neko_color_blue 'U'
  __neko_rainbow $git_status $__neko_color_lilac 'M'
  __neko_rainbow $git_status $__neko_color_grey '?'
end

function __neko_git_status
  # In git
  if test -n (__neko_git_branch_name)

    __neko_color_echo $__neko_color_blue " git"
    __neko_color_echo $__neko_color_white ":"(__neko_git_branch_name)

    if test -n (__neko_git_status_codes)
      __neko_color_echo $__neko_color_pink ' ●'
      __neko_color_echo $__neko_color_white ' [^._.^]ﾉ'
      __neko_git_status_icons
    else
      __neko_color_echo $__neko_color_green ' ●'
      __neko_color_echo $__neko_color_white ' [^._.^]b'
    end
  end
end


# Display prompt
function fish_prompt
  __neko_color_echo $__neko_color_blue "# "
  __neko_color_echo $__neko_color_purple (__neko_current_folder)
  __neko_current_date
  __neko_git_status
  echo
  __neko_color_echo $__neko_color_pink "\$ "
end
