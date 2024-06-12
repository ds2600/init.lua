```bash
apt install xclip xsel

cd ~/.config/
git clone https://github.com/ds2600/init.lua.git
mv init.lua nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd ~/.config/nvim
nvim
Navigate to nvim/lua/ds2600/packer.lua
:so
:PackerSync
```
