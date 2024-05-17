# Actions for [Nemo](https://en.wikipedia.org/wiki/Nemo_(file_manager)) file manager
## What is Nemo?
Nemo is the official file manager of the Cinnamon desktop environment for Linux. It is used, for example, in the Linux distro [Linux Mint](https://www.linuxmint.com/). Nemo can also be [installed on Ubuntu](https://itsfoss.com/install-nemo-file-manager-ubuntu/). 


## What are Nemo Actions?
Nemo [Actions](https://www.youtube.com/watch?v=csbMSmjGmPo) are scripts that extend Nemo's already excellent out-of-the-box functionality.

As someone who recently began migrating from Windows to Linux, one of the most puzzling things about Linux was how empty the context menu of the file manager remained, even after I had installed a bunch of programs that would have certainly added context menu items to Windows Explorer. 

For example, [JAM Software TreeSize](https://www.jam-software.com/treesize_free/features.shtml) is a very nice Windows utility that allows you to quickly analyze disk and folder space usage. One decent Linux alternative (there are several) is [QDirStat](https://github.com/shundhammer/qdirstat). But unlike TreeSize, QDirStat does not add any context menu items to the file manager, so in order to use it, you have to start the program manually and then navigate to the drive or folder you would like to analyze from inside of the program.

This repository contains a collection of Nemo Actions that aim to increase efficiency by adding missing context menu items for a range of programs that perform actions on files and folders, such as QDirStat, Bleachbit and Thunderbird.

## How do I install a Nemo Action?

To install an Action, download the __*.nemo_action__ file and save it in the folder __/home/<your_user_name>/.local/share/nemo/actions__. If the action has an associated bash script, download the folder containing the bash script and save it in the same folder. Your Actions folder should then look something like this:

![image](https://github.com/RayCulp/actions-for-nemo-file-manager/assets/7621330/946dd48c-2290-49b3-9e0b-3e7f7d155928)

## Suggestions for improvement

Comments, suggestions and pull requests are always welcome.

## A word of caution

|   |   |
|:---|:---|
| ![image](https://github.com/RayCulp/actions-for-nemo-file-manager/assets/7621330/852bed00-e05f-4190-b078-c2077e94bd73) | __NOTICE__ <br/>Possible irreparable data loss. Some of the bash scripts in this repository use Bleachbit to destroy files permanently. Although I have exercised the greatest care in preparing these Actions and scripts (I use them myself on a daily basis and don't want my own data to get destroyed by mistake), I nevertheless cannot guarantee that nothing will ever go wrong. I take no responsibility whatsoever for any loss of data that might occur as a result of using these Actions and scripts.|

## Nemo Actions in this repository

| Action name      | What does it do?      |
|:------------- |:------------- |
| qdirstat.nemo_action | Analyze space usage of selected drive or folder using QDirStat. |
| reduce_50.nemo_action | Reduce the size of the selected image file by 50%. Not my Action. Simple example I got somewhere. |
| securely_move.nemo_action | Securely move files and folders to a new location. Original files are destroyed using Bleachbit, so they cannot be recovered. |
| shred_with_bleachbit.nemo_action | Destroy selected files and folders using Bleachbit. |
| thunderbird.nemo_action | Send selected files via email using Thunderbird. |

