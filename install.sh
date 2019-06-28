#!/bin/bash
echo "@copyright-written by A.Forouzan (for2507@gmail.com)"

echo "NOTE:

first read readme.txt and then continue. this version of os/161 competeble with ubuntu 14.04. 
below information is your OS info. check then continue."

lsb_release -a

read -p "This simple shell script that writed by A.Forouzan.for installing os161 want to start.
for start press Enter..." input

curdir=$PWD
mkdir $curdir/log
rm $curdir/log/install.log
touch $curdir/log/install.log 


echo "start step 1... unziping os161.zip"
echo "start step 1... unziping os161.zip" >>$curdir/log/install.log
sleep 3
	unzip os161.zip 
echo "step 1 complete"
echo "step 1 complete" >>$curdir/log/install.log

echo "start step 2... unziping os161-binutils.tar.gz"
echo "start step 2... unziping os161-binutils.tar.gz" >>$curdir/log/install.log
sleep 3
	tar -xzf os161-binutils.tar.gz
echo "step 2 complete"
echo "step 2 complete" >>$curdir/log/install.log

echo "start step 3... installing os161-binutils package"
echo "start step 3... installing os161-binutils package" >>$curdir/log/install.log
sleep 3
	cd binutils-2.17+os161-2.0.1
	echo "configuring..."
	echo "configuring..." >>$curdir/log/install.log
	./configure --nfp --disable-werror --target=mips-harvard-os161 --prefix=$HOME/sys161/tools 2>&1>>$curdir/log/install.log
	echo "compiling..."
	echo "compiling..." >>$curdir/log/install.log
	find . -name '*.info' | xargs touch 2>&1>>$curdir/log/install.log
	make 2>&1>>$curdir/log/install.log
	echo "installing"
	echo "installing" >>$curdir/log/install.log
	make install 2>&1>>$curdir/log/install.log
	cd ..
echo "step 3 complete"
echo "step 3 complete">>$curdir/log/install.log
echo "start step 4...Adjust Your Shell's Command Path"
echo "start step 4...Adjust Your Shell's Command Path">>$curdir/log/install.log
sleep 3
	mkdir $HOME/sys161/bin
	if ! grep -q "sys161" ~/.bashrc; then
		echo "export PATH=$HOME/sys161/bin:$HOME/sys161/tools/bin:$PATH" >>$HOME/.bashrc
	fi
	export PATH=$HOME/sys161/bin:$HOME/sys161/tools/bin:$PATH

read -p "we add new $PATH in ~/.bashrc and now should be update this variable for all terminals.
please open another terminal (ctrl+alt+t) and run 'source ~/.bashrc' command. if you run the command press inter" inter

echo "step 4 complete"
echo "step 4 complete">>$curdir/log/install.log
echo "start step 5... unziping os161-gcc"
echo "start step 5... unziping os161-gcc">>$curdir/log/install.log
sleep 3
	tar -xzf os161-gcc.tar.gz
echo "step 5 complete"
echo "step 5 complete">>$curdir/log/install.log
echo "start step 6... installing os161-gcc"
echo "start step 6... installing os161-gcc">>$curdir/log/install.log
sleep 3
	cd gcc-4.1.2+os161-2.0
	echo "configuring..."
	echo "configuring...">>$curdir/log/install.log
	./configure -nfp --disable-shared --disable-threads --disable-libmudflap --disable-libssp --target=mips-harvard-os161 --prefix=$HOME/sys161/tools  2>&1>>$curdir/log/install.log
	echo "compiling..."
	echo "compiling...">>$curdir/log/install.log
	make  2>&1>>$curdir/log/install.log
	echo "installing..."
	echo "installing...">>$curdir/log/install.log
	make install 2>&1>>$curdir/log/install.log
	cd ..
echo "step 6 complete"
echo "step 6 complete">>$curdir/log/install.log
echo "preparing for next step..."
echo "preparing for next step...">>$curdir/log/install.log
sleep 2
echo "network test start"
echo "network test start">>$curdir/log/install.log
echo "testing network..."
echo "testing network...">>$curdir/log/install.log

while [ 1 -gt 0 ]
do 
	if ping -q -c 1 -W 1 google.com  2>&1>>$curdir/log/install.log; then

	  break

	else

	  echo "Network unavailable.check your network access..."
	  echo "Network unavailable.">>$curdir/log/install.log
	  sleep 10

	fi
done
echo "network access test complete. start step 7... installing libncurses5-dev"
echo "network access test complete. start step 7... installing libncurses5-dev">>$curdir/log/install.log
sleep 3
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
sudo apt-get update
sudo apt-get install libncurses5-dev
echo "step 7 complete"
echo "step 7 complete">>$curdir/log/install.log

echo "start step 8... unziping os161-gdb"
echo "start step 8... unziping os161-gdb">>$curdir/log/install.log
sleep 3
	tar -xzf os161-gdb.tar.gz
echo "step 8 complete"
echo "step 8 complete">>$curdir/log/install.log
echo "start step 9... installing os161-gdb"
echo "start step 9... installing os161-gdb">>$curdir/log/install.log
sleep 3
	cd gdb-6.6+os161-2.0
	echo "configuring..."
	echo "configuring...">>$curdir/log/install.log
	./configure --target=mips-harvard-os161 --prefix=$HOME/sys161/tools --disable-werror 2>&1>>$curdir/log/install.log
	echo "compiling..."
	echo "compiling...">>$curdir/log/install.log
	make MAKEINFO=missing 2>&1>>$curdir/log/install.log
	echo "installing..."
	echo "installing...">>$curdir/log/install.log
	make install 2>&1>>$curdir/log/install.log
	cd ..
echo "step 9 complete"
echo "step 9 complete">>$curdir/log/install.log
echo "start step 10... unziping os161-bmake"
echo "start step 10... unziping os161-bmake">>$curdir/log/install.log
sleep 3
	tar -xzf os161-bmake.tar.gz
echo "step 10 complete"
echo "step 10 complete">>$curdir/log/install.log
echo "start step 11... installing bmake"
echo "start step 11... installing bmake">>$curdir/log/install.log
sleep 3
	cd bmake
	echo "unzip os161-mk.tar.gz"
	echo "unzip os161-mk.tar.gz">>$curdir/log/install.log
	tar -xzf ../os161-mk.tar.gz
	echo "running bootstrap script..."
	echo "running bootstrap script...">>$curdir/log/install.log
	./boot-strap --prefix=$HOME/sys161/tools >>$curdir/log/install.log
	mkdir -p $HOME/sys161/tools/bin
	cp $curdir/bmake/Linux/bmake $HOME/sys161/tools/bin/bmake-20101215
	rm -f $HOME/sys161/tools/bin/bmake
	ln -s bmake-20101215 $HOME/sys161/tools/bin/bmake
	mkdir -p $HOME/sys161/tools/share/man/cat1
	cp $curdir/bmake/bmake.cat1 $HOME/sys161/tools/share/man/cat1/bmake.1
	sh $curdir/bmake/mk/install-mk $HOME/sys161/tools/share/mk
	cd $curdir

echo "step 11 complete"
echo "step 11 complete">>$curdir/log/install.log
echo "start step 12... Set Up Links"
echo "start step 12... Set Up Links">>$curdir/log/install.log
sleep 3
mkdir $HOME/sys161/bin
cd $HOME/sys161/tools/bin

for i in mips-*; do 
	ln -s $HOME/sys161/tools/bin/$i $HOME/sys161/bin/fum-`echo $i | cut -d- -f4-`; done
ln -s $HOME/sys161/tools/bin/bmake $HOME/sys161/bin/bmake
ls $HOME/sys161/bin
cd $curdir

echo "step 12 complete"
echo "step 12 complete">>$curdir/log/install.log
echo "start step 13... unzi sys161"
echo "start step 13... unziping sys161">>$curdir/log/install.log
sleep 3
	tar -xzf sys161.tar.gz
echo "step 13 complete"
echo "step 13 complete">>$curdir/log/install.log
echo "start step 14... installing sys161 simulator"
echo "start step 14... installing sys161 simulator">>$curdir/log/install.log
sleep 3
	cd sys161-1.99.06
	echo "configuring..."
	echo "configuring...">>$curdir/log/install.log
	./configure --prefix=$HOME/sys161 mipseb 2>&1>>$curdir/log/install.log
	echo "compiling..."
	echo "compiling...">>$curdir/log/install.log
	make 2>&1>>$curdir/log/install.log
	echo "installing..."
	echo "installing...">>$curdir/log/install.log
	make install 2>&1>>$curdir/log/install.log
	cd $curdir
	echo "reconfiguring..."
	echo "reconfiguring...">>$curdir/log/install.log
	cd $HOME/sys161
	ln -s share/examples/sys161/sys161.conf.sample sys161.conf
	cd $curdir
echo "step 14 complete"
echo "step 14 complete">>$curdir/log/install.log
echo "start step 15... installing os/161"
echo "start step 15... installing os/161">>$curdir/log/install.log
sleep 3
mkdir $HOME/fum-os161
cd $HOME/fum-os161
cp $curdir/os161.tar.gz $HOME/fum-os161/
tar -xzf os161.tar.gz
echo "step 15 complete"
echo "step 15 complete">>$curdir/log/install.log
echo "You should now be able build, install, and run an OS/161 kernel and related application and test programs. for building and installing os/161 from source code press any key" >>$curdir/log/install.log
read -p "You should now be able build, install, and run an OS/161 kernel and related application and test programs. for building and installing os/161 from source code press Enter" inputval

echo "opening compile-kern.sh"
echo "opening compile-kern.sh">>$curdir/log/install.log
sleep 3
cd $curdir
chmod 700 compile-kern.sh
./compile-kern.sh

