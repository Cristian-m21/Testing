# Based on evan's prompt
# Shows the exit status of the last command if non-zero
# Uses "#" instead of "»" when running with elevated privileges
IPL="$(ip addr show ens33 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
#IPVPN='$(ip route get 10.10.10.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')'

function get_tun0_ip() {
    if ifconfig tun0 &> /dev/null; then
        echo "$(ip addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
    else
        echo "~"
    fi
}
IPVPN='$(get_tun0_ip)'



#IPVPN="$(ip addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
PROMPT="%m %{${fg_bold[red]}%}:[$IPL]::[$IPVPN]: %{${fg[green]}%}%3~ %{${fg[white]}%}x%(0?. . %{${fg[red]}%}%?)%{${fg[blue]}%}»%{${reset_color}%} "
