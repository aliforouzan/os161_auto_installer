#!/bin/bash

curdir=$PWD

echo "start step 1... compile os/161 kernel"
echo "start step 1... compile os/161 kernel">>$curdir/log/install.log
echo "GUIDE:The Assignment number indicates that you are working on
assignment X. For Assignment X, enter Assignment number.
The bmake install command will create a directory called $HOME/fum-os161/root
( $HOME refers to your home directory), into which it will place the compiled kernel in a
file called kernel-ASST0 . It will also create a symbolic link called kernel referring to
kernel-ASST0 . Check the $HOME/fum-os161/root directory to make sure that your
kernel is in place."
export PATH=$HOME/sys161/bin:$HOME/sys161/tools/bin:$PATH
echo "inter Assignment number:" >>$curdir/log/install.log
read -p "inter Assignment number:" ass
sleep 3
	cd $HOME/fum-os161/os161-1.99
	echo "configuring..."
	echo "configuring...">>$curdir/log/install.log
	./configure --ostree=$HOME/fum-os161/root --toolprefix=fum- 2>&1>>$curdir/log/install.log
	cd kern/conf
	./config ASST`echo $ass` 2>&1>>$curdir/log/install.log
	cd ../compile/ASST`echo $ass`
	bmake depend 2>&1>>$curdir/log/install.log
	echo "compiling..."
	echo "compiling...">>$curdir/log/install.log
	bmake 2>&1>>$curdir/log/install.log
	echo "installing..."
	echo "installing...">>$curdir/log/install.log
	bmake install 2>&1>>$curdir/log/install.log
echo "step 1 complete"
echo "step 1 complete">>$curdir/log/install.log
echo "start step 2... Build the OS/161 User-level Programs"
echo "start step 2... Build the OS/161 User-level Programs">>$curdir/log/install.log
cd $HOME/fum-os161/os161-1.99
bmake 2>&1>>$curdir/log/install.log
bmake install 2>&1>>$curdir/log/install.log
echo "step 2 complete"
echo "step 2 complete">>$curdir/log/install.log
echo "start step 3... Running OS/161"
echo "start step 3... Running OS/161">>$curdir/log/install.log
cd $HOME/fum-os161/root
cp $HOME/sys161/sys161.conf .
read -p "press Enter to start os/161...

 You can rnu manually os/161 with enter $HOME/fum-os161/root directory and run 
'sys161 kernel-ASST(ASSET_NUMBER)' command (Example:sys161 kernel-ASST0)" enter1
sys161 kernel-ASST`echo $ass`
