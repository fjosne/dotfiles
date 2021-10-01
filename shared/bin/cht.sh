#!/usr/bin/env bash

languages=`echo "python bash c" | tr ' ' '\n'`
utils=`echo "sed awk find rg grep" | tr ' ' '\n'`

selected=`printf "$languages\n$utils" | fzf`

echo $selected

read -p "Query: " query

# if grep -qs "$selected" ~/.tmux-cht-languages; then
if printf "$languages" | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi

# if printf "$languages" | grep -qs $selected; then
#     tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
# else
#     tmux neww bash -c "curl cht.sh/$selected~`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
# fi
