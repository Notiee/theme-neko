set -g __neko_color_orange FD971F
set -g __neko_color_blue 6EC9DD
set -g __neko_color_green A6E22E
set -g __neko_color_yellow E6DB7E
set -g __neko_color_pink F92672
set -g __neko_color_grey 554F48
set -g __neko_color_white F1F1F1
set -g __neko_color_purple 9458FF
set -g __neko_color_lilac AE81FF

function __neko_color_echo
	set_color $argv[1]
	if test (count $argv) -eq 2
		echo -n $argv[2]
	end
end

function fish_greeting
	echo

	__neko_color_echo $__neko_color_purple 	"   _._     _,-'\"\"`-._		"\n
	__neko_color_echo $__neko_color_purple 	"  (,-.`._,'(       |\`-/|		    |\__/,|   (`\ "\n
	__neko_color_echo $__neko_color_lilac 	"      `-.-' \ )-`( , o o)		  _.|o o  |_   ) )"\n
	__neko_color_echo $__neko_color_lilac 	"            `-    \`_`\"'-		-(((---(((--------"\n

	echo 
end