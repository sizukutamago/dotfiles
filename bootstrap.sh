#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "README.md" \
		--exclude ".claude" \
		--exclude ".gitconfig.local.example" \
		-avh --no-perms . ~;

	# .gitconfig.local が存在しない場合、テンプレートからコピー
	if [ ! -f ~/.gitconfig.local ]; then
		echo "~/.gitconfig.local が見つかりません。テンプレートを作成します。"
		cp .gitconfig.local.example ~/.gitconfig.local
		echo "~/.gitconfig.local を編集して、name と email を設定してください。"
	fi

	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "ホームディレクトリ内の既存のファイルが上書きされる可能性があります。よろしいですか? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
