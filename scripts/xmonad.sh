sudo apt install libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev haskell-stack -y
mkdir -p ~/.config/xmonad && cd ~/.config/xmonad
echo "import XMonad

main :: IO ()
main = xmonad def" >> xmonad.hs

git clone https://github.com/xmonad/xmonad
git clone https://github.com/xmonad/xmonad-contrib

curl -sSL https://get.haskellstack.org/ | sh

stack init
stack install

echo ".local/bin" > ~/.homepath

echo "exec xmonad" > ~/.xsession

echo "[Desktop Entry]
Name=Default X session
Type=Application
Exec=default
" | sudo tee /usr/share/xsessions/default.desktop