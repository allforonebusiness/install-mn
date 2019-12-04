![Logo](https://allforonebusiness.org/wp-content/uploads/2018/12/Logo_allforone.png)
# All For One Business Masternode Setup Guide
This guide will assist you in setting up a All For One Business Masternode on a Linux Server running Ubuntu 16.04. (this may also work on Ubuntu 18.04, but 16.04 is the suggested version)

This guide will show you the safest setup for running a masternode.  This type of setup is known as a Hot/Cold wallet setup.  In this type setup you will have 2 wallets (one with the coins, and one without the coins).  It is the safest setup because your coins will reside in a "cold" wallet ("cold" means that it does not need to constantly be connected to the internet). In this setup, there is very little risk of someone hacking onto your wallet and taking your coins.

If you require further assistance contact the support team @ [Discord](https://discord.gg/F7WEQNy)
***
## Requirements
1) **1,001 AFO coins. (1000.01 coins will work, but it is simpler to say 1001 is required)**
2) **A Vultr VPS running Linux Ubuntu 16.04. (Ubuntu 18.04 may work, but it is suggested to use 16.04)**
3) **A Windows, Mac, or Linux QT wallet running on a local machine (like your home computer).**
4) **An SSH client such as [Bitvise](https://dl.bitvise.com/BvSshClient-Inst.exe)**
***
## Contents
* **Section A**: Preparing the local (cold) wallet
* **Section B**: Obtaining the coins to run a masternode
* **Section C**: Creating the collateral transaction
* **Section D**: Creating the VPS within Vultr
* **Section E**: Downloading and installing Bitvise.
* **Section F**: Connecting to the VPS and installing the MN script via Bitvise.
* **Section G**: Connecting and starting the masternode.
***

## Section A: Preparing the local (cold) wallet 
***Step 1***
* Download the latest "QT" wallet for your operating system
  * Windows 32bit (https://github.com/allforonebusiness/binaries-windows32bit/raw/master/allforonebusiness-3.4.0-win32-setup.exe)
  * Windows 64bit (https://github.com/allforonebusiness/binaries-windows/raw/master/allforonebusiness-qt.exe)
  * Macintosh (https://github.com/allforonebusiness/binaries-macOS/raw/master/allforonebusiness-qt.dmg)
  * Linux (https://github.com/allforonebusiness/binaries-linux/raw/master/allforonebusiness-qt)
***

***Step 2***
* Install the wallet and allow it to synchronize fully. If there are no connections or it is synchronizing slowly, go to the discord server and search for `addnode` nodes to add to your wallet to speed it up.
***

## Section B: Obtaining the coins to run a masternode. 
Now you need to get the coins to run a masternode.  Remember, you will need a little more than 1000 coins to start a masternode.  1000.01 coins would be enough, but usually i get 1001 coins to be safe.  You need this small amount of extra coins to pay the transaction fee to make the "collateral transaction" in a later step below.  If you already have enough coins to run the masternode, then just skip to next section (Creating the collateral transaction).  If you do not have enough coins yet, then follow these instructions.

***Step 1***
* Open the wallet and go to the `Receive` tab to create a new receiving address.
* Type a label for this address in the `Label` field. If you are getting coins from an exchange, use a label like `From Graviex` or if you are buying in presale use a lable like `From Presale`.
* Click the `Request Payment` button.

![Create Receiving Address Screen 1/2](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionBStep1.jpg "Create Receiving Address 1/2")
* A new window will pop up, in that window, you will see an address labelled `address`.  This is the address you will receive your coins on. Click the `Copy Address` button at the bottom of the window to copy the address to your clipboard. If you are withdrawing from the exchange, withdraw to this address.  If you are buying from presale, give this address to the person selling you the coins.

![Create Receiving Address Screen 2/2](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionBStep1-2.jpg "Create Receiving Address 2/2")

  *NOTE: Always send a small amount of coins to your address first to test it.  If the test is successful, then send the full amount.  Meaning, if you are withdrawing from an exchange, just withdraw 1 coin.  If you receive that coin in your wallet, then withdraw the rest of the coins.
* Once you have at least 1000.01 coins in your wallet, you can move on the the next section.  
***

## Section C: Creating the collateral tranaction.
In this section you will be sending yourself exactly 1000 coins in one single transaction. This is known as the `collateral transaction`. As long as you are running your masternode, these coins will be locked in your wallet and will not stake, they will only be used to keep your masternode running.

***Step 1***
* Open the wallet and go to the `Receive` tab to create a new masternode (receiving) address.
* Type `MN1` as the label for this address in the `Label` field.
* Click the `Request Payment` button.
* A new window will pop up, in that window, you will see an address labelled `address`.  This will be your masternode address and it is where you will send the 1000 coins. Click the `Copy Address` button at the bottom of the window to copy the address to your clipboard.

![Create MN Address](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionCStep1.jpg "Create MN Address")
***

***Step 2***
* Go to the `Send` tab in the wallet and paste the address from your clipboard into the `Pay To` field.  The `Label` field should automatically fill in with `MN` (or whatever you labelled your masternode address).  If it does not autofill with the masternode address label, then do not continue as you will not be sending the coins to yourself, try step 1 above again.

![Fill In Send Fields](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionCStep2.jpg "Fill In Send Fields")
***

***Step 3***
* Enter exactly 1000 in the `Amount` box. And then click the `Send` button.

![Send Collateral Coins](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionCStep3.jpg "Send Collateral Coins")
***

## Section D: Creating the VPS within [Vultr](https://www.vultr.com/?ref=8337866-4F) 
***Step 1***
* Register at [Vultr](https://www.vultr.com/?ref=8337866-4F)
  *NOTE: This is a referral link.  I will get a small commission if you use it. If you have friends that already use Vultr, you can get a referral link from them and they will get a commission.  Whichever link you use (mine or your friends) you should get a welcome bonus of $25 to $50 after you link a payment method to your account. Currently my link gives $50 but your friend's link may also give that.)
***

***Step 2***
* After you have added funds to your account go [here](https://my.vultr.com/deploy/) to create your Server
***

***Step 3*** 
* Choose "Cloud Compute" option and then choose a server location (preferably somewhere close to you)

![Create VPS Step 3](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionDStep3.jpg "Create VPS Step 3")
***

***Step 4***
* Choose a server type: Ubuntu 16.04
* Choose a server size: $5/month is sufficient

![Create VPS Step 4](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionDStep4.jpg "Create VPS Step 4")
***

***Step 5*** 
* Set a Server Hostname (use any name you want to help you remember this VPS. You can use the coins name to help you remember this server has AFO on it, but in the future you can add more coins to this VPS, so you may simply want to name it Ubuntu1601_1 if you plan to do that)
* Click "Deploy now"

![Create VPS Step 5](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionDStep5.jpg "Create VPS Step 5")
***

## Section E: Downloading and installing BitVise. 

***Step 1***
* Download Bitvise [here](https://bitvise.com/ssh-client-download)
* Click the button in the middle of screen to download latest version.
***

***Step 2***
* Select the correct installer depending upon your operating system. Then follow the install instructions. 
***


## Section F: Connecting to the VPS & Installing the MN script via Bitvise.

***Step 1***
* Log into Vultr [here] (https://my.vultr.com)
* In the middle of the screen, click the link to your VPS you jsut created
* Here you can find your VPS IP and password for use in the following steps. To copy the IP or the password to your clipboard when needed in following steps, click the `copy` button for each one (when needed).

![VPS IP and Password](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionFStep1.jpg "VPS IP and Password")
***

***Step 2***
* Open the bitvise application
***

***Step 3***
* In the bitvise application, fill in the following...
  * `Host1` - paste the IP address you copied from the Vultr screen
  * `Port` - type `22`
  * `Username` - type `root`
  * `Initial method` - choose `password` in the dropdown
  * `Store encrypted password in profile` - check this box if you don't want to have to type the password each time. This is fine, you will have no coins on this VPS, so even if someone hacked onto your VPS, they could never get to any of your coins
  * `Password` - paste the password you copied from the Vultr screen
* Click the `Save Profile` button to save this information to easily log in the next time
* Click the `Log In` button to log into the VPS

![Configure Bitvise](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionFStep3.jpg "Configure Bitvise")
***

***Step 4***
* Paste the code below into the Bitvise terminal then press enter (it will just go to a new line because it is just downloading a small script)

`wget -q https://raw.githubusercontent.com/BadFerret/MasterNode-Script/master/AFO_mn_install.sh`

***

***Step 5***
* Paste the code below into the Bitvise terminal then press enter (this will run the script from above and may take 10 to 20 minutes to complete)

`chmod +x AFO_mn_install.sh`

***


***Step 6***
* Paste the code below into the Bitvise terminal then press enter (this will run the script from above and may take 10 to 20 minutes to complete)

`bash AFO_mn_install.sh`

***

***Step 6***
* When prompted to enter your Masternode Gen key - do not type anything, just press the enter key
***

***Step 7***
* You will now see all of the relevant information for your server.
* Keep this terminal open as we will need the information displayed for the local wallet setup in the next steps.
***

# Section G: Connecting & Starting the masternode 

***Step 1***
* Open your local cold wallet (the Windows, Mac, or Linux wallet you installed in Section 1 at the beginning of this tutorial).  Go to `Tools`->`Debug Monitor` on the top menu bar.  Type `getmasternodeoutputs` into the textbox at bottom and hit the enter key on the keyboard.  Leave this window open and move it to the side.
***

***Step 2***
* Go to the `Tools`->`Open Masternode Configuration File` on the top menu bar. A text file will open.  You need to fill out this file in the next step.


***Step 3***
* Create a new line in the file with the following information

  `MNAlias VPS_IP:PORT MasternodePrivateKey MasternodeOutputsTXHash MasternodeOutputsIDX`
* The information comes from the following locations (see screenshot also)
  * `MNAlias` - use any name you like, but it must be unique in this file. Meaning, you cannot have 2 lines with MN1 at the beginning
  * `VPS_IP:PORT` - This value is in the Bitvise terminal window
  * `MasternodePrivateKey` - This value is in the Bitvise terminal window
  * `MasternodeOutputsTXHash` - This value is what you get when you typed `getmasternodeoutputs` in your local cold wallet
  * `MasternodeOutputsIDX` - This value is what you get when you typed `getmasternodeoutputs` in your local cold wallet
  
![Configure Masternode.conf file](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionGStep3.jpg "Configure Masternode.conf file")

* Save the masternode.conf file and close it.
***

***Step 4***
* Close the cold wallet and restart it
***

***Step 5***
* In the cold wallet, click on the `Transactions` tab.
* Change the `Type` dropdown box to show only the transactions `To Yourself`
* Hover over the top transaction and make sure it says it has more than 16 confirmations (any number over 15 is fine).  If it does not yet have 15 confirmations, then wait a few minutes and check it again. Once it has at least 16 confirmations, move to next step.

![Verify 15 confirmations](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionGStep4.jpg "Verify 15 confirmations")
***

***Step 6***
* In the cold wallet, go to the `Masternodes` tab
***

***Step 7***
* If your wallet is not unlocked, then unlock it now.
* Click the `Start Missing` button
* It should report that the masternode was started. You must still verify on the VPS that it actually was started by following step 8 below.
***

***Step 8***
* Go to your VPS wallet and type the following command and hit the enter key
`allforonebusiness-cli getmasternodestatus`
* It should display that the masternode was successfully started.  If you do not receive the message in the screenshot below that it was started repeat step 7 and 8 again. If after 2 or 3 attempt, it does not report as successfully started on the VPS, then ask for help in the discord server.

![Verify Masternode on VPS](https://github.com/BadFerret/MasterNode-Script/raw/master/images/SectionGStep8.jpg "Verify Masternode on VPS")
***
