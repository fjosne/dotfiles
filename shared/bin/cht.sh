#!/usr/bin/env bash

languages=`echo "python bash c" | tr ' ' '\n'`
utils=`echo "sed awk find rg grep" | tr ' ' '\n'`

selected=`printf "$languages\n$utils" | fzf`

echo $selected

read -p "Query: " query
query=`echo $query | tr ' ' '+'`

# if grep -qs "$selected" ~/.tmux-cht-languages; then
if printf "$languages" | grep -qs $selected; then
    # query=`echo $query | tr ' ' '+'`
    bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query | bat & while [ : ]; do sleep 1; done"
else
    bash -c "curl -s cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi

