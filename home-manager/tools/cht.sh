#!/usr/bin/env bash
# fuzzy searches cht.sh with additional query

if [ -n "$TMUX" ]; then
	fzf_params="--reverse"
else
	fzf_params=""
fi

selected=$(curl -s https://cht.sh/:list | rg "^\w*" | sort --unique | fzf-tmux -p 85% "$fzf_params")

if [[ -z "$selected" ]]; then
	exit 0
fi

read -rp "Enter Query: " query

query=$(echo "$query" | tr ' ' '+')

if [ "$query" != "\n" ]; then
	echo "if successful"
	query="/$query"
fi

if [[ -n "$TMUX" ]]; then
	tmux neww -n "$selected" bash -c "curl -s cht.sh/$selected$query | less"
else
	curl -s "cht.sh/$selected$query" | less
fi
