## インストール

```bash
git clone https://github.com/sizukutamago/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

### 初回セットアップ

bootstrap.sh 実行後、`~/.gitconfig.local` を編集して Git のユーザー情報を設定してください：

```bash
# 自動生成されたテンプレートを編集
vim ~/.gitconfig.local
```

必要な設定：
- `user.name`: Git コミットに使用する名前
- `user.email`: Git コミットに使用するメールアドレス

更新するには、ローカルの `dotfiles` リポジトリに `cd` してから：

```bash
./bootstrap.sh
```

**注意**: `~/.gitconfig.local` は bootstrap.sh で上書きされません。マシン固有の設定を安全に保持できます。

## iTerm2 color
https://github.com/catppuccin/iterm?tab=readme-ov-file

colors/catppuccin-macchiato.itermcolors
