
cd $HOME

apt-get -y kde-plasma-desktop
apt-get -y feh

# copy kde configuration to home directory
cp -r -f $HOME/nymph/assets/.kde4 $HOME

# change wallpaper
feh -bg --scale $HOME/nymph/assets/wallpapers/saints-name.png