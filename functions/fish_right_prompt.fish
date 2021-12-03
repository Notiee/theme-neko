# Last command status
function __check_status
  if test $exit_code != 0
    __neko_color_echo $__neko_color_pink '['
    __neko_color_echo $__neko_color_pink $exit_code
    __neko_color_echo $__neko_color_pink ']'
  else
    __neko_color_echo $__neko_color_green '['
    __neko_color_echo $__neko_color_green $exit_code
    __neko_color_echo $__neko_color_green ']'
  end
end

function __get_duration
  set -l temp 1000000
  set -l seconds (math -s2 "$CMD_DURATION / 1000")
  set -l minutes (math -s2 "$seconds / 60")
  set -l hours (math -s2 "$minutes / 60")

  __neko_color_echo $__neko_color_orange ' ['

  if test $hours -gt 1
    if test $hours -lt 2
      echo $hours "hour"
    else
      echo $hours "hours"
    end
  else if test $minutes -gt 1
    echo $minutes "min"
  else if test $seconds -gt 1
    echo $seconds "s"
  else
    echo $CMD_DURATION "ms"
  end

  __neko_color_echo $__neko_color_orange ']'
end


function __get_path
  __neko_color_echo $__neko_color_grey (prompt_pwd)
end


function fish_right_prompt
  set -g exit_code $status

  __get_path
  __get_duration
  __check_status
end
