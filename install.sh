#!/usr/bin/env bash

# dotfiles installer - シンボリックリンク方式
# Usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# 管理するdotfiles一覧
declare -a DOTFILES=(
    ".zshrc"
    ".zsh_prompt"
    ".zprofile"
    ".aliases"
    ".bash_profile"
    ".bash_prompt"
    ".bashrc"
    ".gitconfig"
    ".vimrc"
    ".gvimrc"
    ".editorconfig"
    ".tmux.conf"
    ".inputrc"
    ".screenrc"
    ".curlrc"
    ".wgetrc"
    ".exports"
    ".functions"
    ".hgignore"
)

# 管理するディレクトリ一覧
declare -a DOTDIRS=(
    ".config/nvim"
)

# 色付きメッセージ
info() { echo -e "\033[34m[INFO]\033[0m $1"; }
success() { echo -e "\033[32m[OK]\033[0m $1"; }
warn() { echo -e "\033[33m[WARN]\033[0m $1"; }
error() { echo -e "\033[31m[ERROR]\033[0m $1"; }

# バックアップディレクトリ作成
create_backup_dir() {
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
        info "バックアップディレクトリを作成しました: $BACKUP_DIR"
    fi
}

# シンボリックリンク作成
create_symlink() {
    local source="$1"
    local target="$2"

    # 既存ファイル/ディレクトリの処理
    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -L "$target" ]; then
            # 既にシンボリックリンクの場合
            local current_link=$(readlink "$target")
            if [ "$current_link" = "$source" ]; then
                success "$target は既に正しくリンクされています"
                return 0
            fi
        fi
        # バックアップ
        create_backup_dir
        mv "$target" "$BACKUP_DIR/"
        warn "既存ファイルをバックアップしました: $target -> $BACKUP_DIR/"
    fi

    # 親ディレクトリがなければ作成
    local parent_dir=$(dirname "$target")
    if [ ! -d "$parent_dir" ]; then
        mkdir -p "$parent_dir"
    fi

    # シンボリックリンク作成
    ln -s "$source" "$target"
    success "$target -> $source"
}

# .gitignore_global の特別処理
setup_gitignore() {
    local source="$DOTFILES_DIR/.gitignore_global"
    local target="$HOME/.gitignore_global"

    if [ -f "$source" ]; then
        create_symlink "$source" "$target"
    fi
}

# .gitconfig.local のセットアップ
setup_gitconfig_local() {
    local local_config="$HOME/.gitconfig.local"

    if [ ! -f "$local_config" ]; then
        info ".gitconfig.local を作成しています..."
        cat > "$local_config" << 'EOF'
# マシン固有のGit設定
# このファイルは .gitconfig から include されます

[user]
    name = sizukutamago
    email = sizukutamago@gmail.com

# 必要に応じて追加設定を記載
# [core]
#     sshCommand = ssh -i ~/.ssh/id_ed25519
EOF
        success ".gitconfig.local を作成しました"
        info "必要に応じて ~/.gitconfig.local を編集してください"
    else
        success ".gitconfig.local は既に存在します"
    fi
}

# メイン処理
main() {
    echo ""
    echo "=========================================="
    echo "  dotfiles インストーラー"
    echo "=========================================="
    echo ""
    info "dotfiles ディレクトリ: $DOTFILES_DIR"
    info "ホームディレクトリ: $HOME"
    echo ""

    # 各dotfileのシンボリックリンクを作成
    for file in "${DOTFILES[@]}"; do
        local source="$DOTFILES_DIR/$file"
        local target="$HOME/$file"

        if [ -f "$source" ]; then
            create_symlink "$source" "$target"
        else
            warn "$source が見つかりません。スキップします。"
        fi
    done

    # 各ディレクトリのシンボリックリンクを作成
    for dir in "${DOTDIRS[@]}"; do
        local source="$DOTFILES_DIR/$dir"
        local target="$HOME/$dir"

        if [ -d "$source" ]; then
            create_symlink "$source" "$target"
        else
            warn "$source が見つかりません。スキップします。"
        fi
    done

    # .gitignore_global の処理
    setup_gitignore

    # .gitconfig.local のセットアップ
    setup_gitconfig_local

    echo ""
    echo "=========================================="
    success "インストール完了！"
    echo "=========================================="
    echo ""
    info "シェルを再起動するか、以下を実行してください:"
    echo "  source ~/.zshrc"
    echo ""

    if [ -d "$BACKUP_DIR" ]; then
        info "バックアップは以下にあります:"
        echo "  $BACKUP_DIR"
    fi
}

main "$@"
