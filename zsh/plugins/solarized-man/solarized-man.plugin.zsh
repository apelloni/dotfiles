if [ "$OSTYPE[0,7]" = "solaris" ]
then
    if [ ! -x ${HOME}/bin/nroff ]
    then
        mkdir -p ${HOME}/bin
        cat > ${HOME}/bin/nroff <<EOF
#!/bin/sh
if [ -n "\$_NROFF_U" -a "\$1,\$2,\$3" = "-u0,-Tlp,-man" ]; then
    shift
    exec /usr/bin/nroff -u\${_NROFF_U} "\$@"
fi
#-- Some other invocation of nroff
exec /usr/bin/nroff "\$@"
EOF
chmod +x ${HOME}/bin/nroff
        fi
fi

function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[7;49;94m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[4;32m") \
        PAGER="${commands[less]:-$PAGER}" \
        _NROFF_U=1 \
        GROFF_NO_SGR=1 \
        PATH=${HOME}/bin:${PATH} \
    man "$@"
}

