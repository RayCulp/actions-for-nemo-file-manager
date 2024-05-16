# Actions for Nemo file manager
## A collection of Actions and associated scripts for the Linux file manager [Nemo](https://en.wikipedia.org/wiki/Nemo_(file_manager))
### Introduction
Nemo is the official file manager of the Cinnamon desktop environment. It is used, for example, in the Linux distro [Linux Mint](https://www.linuxmint.com/). Nemo can also be [installed on Ubuntu](https://itsfoss.com/install-nemo-file-manager-ubuntu/). Nemo's functionality (which is already excellent out-of-the-box) can be extended even further using what are known as [Actions](https://www.youtube.com/watch?v=csbMSmjGmPo).

As a person who recently began switching from Windows to Ubuntu, one of the most puzzling things about Linux was how empty the context menu of the file manager remained, even after installing a multitude of programs that would have most certainly added context menu items to Windows Explorer. 

For example, [JAM Software TreeSize](https://www.jam-software.com/treesize_free/features.shtml) is a very nice Windows utility that allows you to quickly analyze disk and folder space usage. One decent Linux alternative (there are several) is [QDirStat](https://github.com/shundhammer/qdirstat). However, unlike TreeSize, QDirStat does not add any context menu items to the file manager, so in order to use it, you must start the program manually and then navigate to the drive or folder you would like to analyze from inside of the program.

This repository contains a collection of Nemo Actions and associated bash scripts that aim to increase efficiency by adding context menu items for a range of programs that can perform actions on files and folders, such as QDirStat, Bleachbit and Thunderbird.

Comments, suggestions and pull requests are always welcome.


|   |   |
|:---|:---|
| ![image](https://github.com/RayCulp/actions-for-nemo-file-manager/assets/7621330/852bed00-e05f-4190-b078-c2077e94bd73) | __NOTICE__ <br/>Possible irreparable data loss. Some of the bash scripts in this repository use Bleachbit to destroy files permanently. Although I have exercised the utmost care in preparing these Actions and scripts, and although I use them myself on a daily basis, I nevertheless cannot guarantee that nothing will ever go wrong. I take no responsibility whatsoever for any loss of data that might occur as a result of using these Actions and scripts.|

## Nemo Actions in this repository

### qdirstat.nemo_action
Analyze space usage of selected drive or folder using QDirStat.
### reduce_50.nemo_action
Reduce the size of the selected image file by 50%. Not my Action. Simple example I got somewhere.
### shred_with_bleachbit.nemo_action
Destroy selected files and folders using Bleachbit.
### thunderbird.nemo_action
Send selected files via email using Thunderbird.
