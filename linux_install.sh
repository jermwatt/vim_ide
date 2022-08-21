
apt update
apt upgrade -y
apt update 

apt-get update
apt install -y build-essential
apt update
apt install -y curl vim git wget fontconfig 
apt update
apt install -y zsh
apt update

# install oh-my-zsh
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

# copy over fonts
mkdir -p /root/.local/share/fonts
cd fonts
cp * /root/.local/share/fonts
cd ../

mkdir -p /root/.vim/pack/plugins/start
bash install_plugins.sh

cp .vimrc /root/.vimrc
cp .vimrc.plug /root/.vimrc.plug
cp .p10k.zsh /root/.p10k.zsh
cp .bashrc /root/.bashrc
cp .zshrc /root/.zshrc

chmod 755 /root/.vimrc
chmod 755 /root/.vimrc.plug
chmod 755 /root/.p10k.zsh
chmod 755 /root/.bashrc
chmod 755 /root/.zshrc


fc-cache -fv
