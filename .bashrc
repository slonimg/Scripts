alias s="git status"
alias ss="git status -s"
alias cc="git commit"
alias add="git add"
alias branch="git checkout -b"
alias rmbranch="git branch -d"
alias merge="git merge --no-ff"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion                                                                                                                                                                
fi


function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done
