
_filedir()
{
    local i IFS=$'\n' xspec

    _tilde "$cur" || return 0

    local -a toks
    local quoted x tmp

    _quote_readline_by_ref "$cur" quoted
    x=$( compgen -d -- "$quoted" ) &&
        while read -r tmp; do
            toks+=( "$tmp" )
        done <<< "$x"

    if [[ "$1" != -d ]]; then
        # Munge xspec to contain uppercase version too
        [[ ${BASH_VERSINFO[0]} -ge 4 ]] && \
            xspec=${1:+"!*.@($1|${1^^})"} || \
            xspec=${1:+"!*.@($1|$(printf %s $1 | tr '[:lower:]' '[:upper:]'))"}
        toks=( ${toks[@]-} $( compgen -f -X "$xspec" -- $quoted) )
    fi
    # [ ${#toks[@]} -ne 0 ] && _compopt_o_filenames
    # [ ${#toks[@]} -ne 0 ] && compopt -o filenames
    compopt -o filenames

    chs=($(chsdir "x$1" "$cur"))
    COMPREPLY=( "${COMPREPLY[@]}" "${toks[@]}" "${chs[@]}" )
}

_filedir_xspec()
{
    local IFS cur xspec

    IFS=$'\n'
    COMPREPLY=()
    _get_comp_words_by_ref cur

    _expand || return 0

    # get first exclusion compspec that matches this command
    # xspec=$( awk "/^complete[ \t]+.*[ \t]${1##*/}([ \t]|\$)/ { print \$0; exit }" \
    xspec=$( awk "/${1##*/}([ \t]|\$)/ { print \$2; exit }" \
        "$BASH_COMPLETION" )
    # prune to leave nothing but the -X spec
    xspec=${xspec#*-X }
    xspec=${xspec%% *}

    local -a toks
    local tmp

    toks=( ${toks[@]-} $(
        compgen -d -- "$(quote_readline "$cur")" | {
        while read -r tmp; do
            # see long TODO comment in _filedir() --David
            printf '%s\n' $tmp
        done
    }
        ))


    # Munge xspec to contain uppercase version too
    eval xspec="${xspec}"
    local matchop=!
    if [[ $xspec == !* ]]; then
        xspec=${xspec#!}
        matchop=@
    fi
    [[ ${BASH_VERSINFO[0]} -ge 4 ]] && \
        xspec="$matchop($xspec|${xspec^^})" || \
        xspec="$matchop($xspec|$(printf %s $xspec | tr '[:lower:]' '[:upper:]'))"

    toks=( ${toks[@]-} $(
        eval compgen -f -X "!$xspec" -- "\$(quote_readline "\$cur")" | {
        while read -r tmp; do
            [ -n $tmp ] && printf '%s\n' $tmp
        done
    }
        ))

    # [ ${#toks[@]} -ne 0 ] && _compopt_o_filenames
    # [ ${#toks[@]} -ne 0 ] && compopt -o filenames
    compopt -o filenames

    chs=($(chsdir "x$1" "$cur"))
    COMPREPLY=( "${toks[@]}" "${chs[@]}" )
}

PATH=$PATH:$HOME/rcfiles/bash_pinyin_completion
complete -o filenames -F _filedir_xspec file

