cd ~

sudo git config --global credential.helper store
sudo git config --global user.name "LoveSnowEx"
sudo git config --global user.email lsktw22@gamil.com
sudo git config --global core.editor nano

sudo pacman-mirrors --country China,Taiwan --api --protocols all --set-branch stable
sudo pacman-mirros -fc

echo '[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

sudo pacman -Syyu archlinux-keyring
sudo pacman -S zsh net-tools z cargo
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s /bin/zsh
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme
export PATH=$PATH:/root/.cargo/bin
if (( $+commands[subsystemctl] )); then
    if ! subsystemctl is-running; then
        sudo subsystemctl start
    fi
fi
export DISPLAY=192.168.100.22:0
export LIBGL_ALWAYS_INDIRECT=1
export XAUTHORITY=~/.Xauthority
export XDG_RUNTIME_DIR=/usr/lib/
export RUNLEVEL=3
export $(dbus-launch)
' >> ~/.zshrc
sudo cat ~/.dotfiles/wsl.conf > /etc/wsl.conf
sudo rm -rf /etc/resolv.conf
sudo cp ~/.dotfiles/resolv.conf /etc/resolv.conf
sudo mkdir /usr/lib/wsl/lib2
sudo ln -s /usr/lib/wsl/lib/* /usr/lib/wsl/lib2
