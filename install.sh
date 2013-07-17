: <<'END'
read -p "Press enter to continue"
sudo apt-get update

read -p "Press enter to continue"
sudo apt-get install nautilus-open-terminal
nautilus -q

read -p "Press enter to continue"
sudo apt-get install git
read -p "Press enter to continue"
sudo apt-get install cvs
read -p "Press enter to continue"
sudo apt-get install build-essential

read -p "Press enter to continue"
sudo apt-get install libblas-dev 
sudo apt-get install liblapack-dev 
sudo apt-get install libgfortran3 
sudo apt-get install libncurses5-dev 
sudo apt-get install libreadline-dev 
sudo apt-get install libdc1394-22-dev 
sudo apt-get install libraw1394-dev 
sudo apt-get install libtiff4-dev 
sudo apt-get install libjpeg8-dev 
sudo apt-get install libpng12-dev
sudo apt-get install libfltk1.3-dev
sudo apt-get install libx11-dev
sudo apt-get install libmpfr-dev
sudo apt-get install m4

read -p "Press enter to continue"
sudo apt-get install openjdk-6-jdk
apt-cache search jdk
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export PATH=$PATH:/usr/lib/jvm/java-6-openjdk/bin

echo "now run ocv.sh and remove old dir!! and mrpt.sh"
read -p "Press enter to continue"

git clone https://github.com/xocoatzin/PtamSRC.git
END

cd PtamSRC

: <<'END'
echo
echo
echo
echo
echo  Installing libs
echo
echo
echo
echo
read -p "Press enter to continue"

cd TooN/
./configure --prefix=/usr
read -p "Press enter to continue"
sudo make install
cd ..

cd TooN-old
./configure --prefix=/usr
read -p "Press enter to continue"
sudo make install
cd ..

echo
echo
echo
echo
echo  Installing libcvd
echo
echo
echo
echo
read -p "Press enter to continue..."

cd libcvd
export CXXFLAGS="-D_REENTRANT -fomit-frame-pointer"
./configure --without-ffmpeg --prefix=/usr --without-v4l1buffer --with-linux='uname -r'
read -p "Press enter to continue"
make
read -p "Press enter to continue"
sudo make install
cd ..

echo
echo
echo
echo
echo  Installing gvars3
echo
echo
echo
echo
read -p "Press enter to continue..."

cd gvars3/
./configure --prefix=/usr
read -p "Press enter to continue"
make
read -p "Press enter to continue"
sudo make install
cd ..

END

echo
echo
echo
echo
echo  Installing PTAM
echo
echo
echo
echo
read -p "Press enter to continue..."

cd PTAM
make
cd ..

#cd ptam/PTAM
#./build_all.sh
