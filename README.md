# Actions for [Nemo](https://en.wikipedia.org/wiki/Nemo_(file_manager)) file manager
## What is Nemo?
Nemo is the official file manager of the [Cinnamon](https://fosspost.org/cinnamon-desktop) desktop environment for Linux. It is used, for example, in the Linux distro [Linux Mint](https://www.linuxmint.com/). Nemo can also be [installed on Ubuntu](https://itsfoss.com/install-nemo-file-manager-ubuntu/). 


## What are Nemo Actions?
Nemo [Actions](https://www.youtube.com/watch?v=csbMSmjGmPo) are scripts that extend Nemo's already excellent out-of-the-box functionality.

As someone who recently began migrating from Windows to Linux, one of the most puzzling things about Linux was how empty the context menu of the file manager remained, even after I had installed a bunch of programs that would have certainly added context menu items to Windows Explorer. 

For example, [JAM Software TreeSize](https://www.jam-software.com/treesize_free/features.shtml) is a very useful Windows utility that allows you to quickly analyze disk and folder space usage. One good Linux alternative (there are several) is [QDirStat](https://github.com/shundhammer/qdirstat). But unlike TreeSize, QDirStat does not add any context menu items to the file manager, so in order to use it, you have to start the program manually and then navigate to the drive or folder you would like to analyze from inside of the program.

This repository contains a collection of Nemo Actions that aim to increase efficiency by adding missing context menu items for a range of programs that perform actions on files and folders, such as QDirStat, Bleachbit and Thunderbird.

## How do I install a Nemo Action?

To install an Action, download the __*.nemo_action__ file and save it in the folder __/home/<your_user_name>/.local/share/nemo/actions__. If the action has an associated bash script, download the folder containing the bash script and save it in the same folder. Your Actions folder should then look something like this:

![image](https://github.com/RayCulp/actions-for-nemo-file-manager/assets/7621330/946dd48c-2290-49b3-9e0b-3e7f7d155928)

## Suggestions for improvement

Comments, suggestions and pull requests are always welcome.

## A word of caution

|   |   |
|:---|:---|
| ![image](https://github.com/RayCulp/actions-for-nemo-file-manager/assets/7621330/852bed00-e05f-4190-b078-c2077e94bd73) | __NOTICE__ <br/>Some of the Nemo Actions in this repository use Bleachbit to delete files permanently. Although I have taken the greatest care in preparing these Actions, I cannot guarantee that nothing will ever go wrong. I take no responsibility for any loss of data that might occur as a result of using these Actions.|

## Nemo Actions in this repository

| Action name | File name | Description | Dependencies |
|:------------- |:------------- |:------------- |:------------- |
| Combine PDFs or images using PDF-Arranger | pdfarranger.nemo_action | Combine one or more PDFs or images (PNG, JPEG) using PDF-Arranger | PDF-Arranger (follow directions here: [https://github.com/pdfarranger/pdfarranger](https://github.com/pdfarranger/pdfarranger)) |
| Compare PDFs using DiffPDF | diffpdf.nemo_action | Compare two PDFs using DiffPDF | DiffPDF (`sudo apt install diffpdf`) |
| Convert Markdown to OpenDocument using Pandoc | pandoc_md_to_odt.nemo_action | Convert one or more Markdown files to OpenDocument Text format using Pandoc | Pandoc https://github.com/jgm/pandoc/releases |
| Extract to separate folders using 7Zip | 7zip_extract_to_folders | Extract one or more compressed archives (zip or 7zip) to separate folders using 7Zip. | 7Zip (`sudo apt install p7zip-full`)<br>Zenity (`sudo apt install zenity`) |
| Extract to separate folders using tar | tar_extract_to_folders.nemo_action | Extract one or more compressed `*.tar.gz` or `*.tar.bz2` archives to individual folders using 7Zip. | tar (installed by default on all Linux systems)</br>Zenity (`sudo apt install zenity`) |
| OCR images using Tesseract| ocr_image.nemo_action | OCR one or more image files using Tesseract | Tesseract (https://lindevs.com/install-tesseract-ocr-on-ubuntu/) |
| OCR PDFs using OCRmyPDF| ocr_pdf.nemo_action | OCR one or more PDFs using OCRmyPDF | Tesseract (https://lindevs.com/install-tesseract-ocr-on-ubuntu/), OCRmyPDF (https://ocrmypdf.readthedocs.io/en/latest/installation.html) |
| Print PDFs using default printer | pdf_print.nemo_action | Print one or more PDF files directly using the default system printer | lpr command, CUPS print server (installed by default on all Linux systems)|
| QDirStat here | qdirstat_backgroundclick.nemo_action</br>qdirstat_onefolder.nemo_action | Analyze disk space usage for the selected folder or drive using QDirStat. Note: Due to limitations in the Action syntax, two separate Action files are necessary, one for a background click (no selection) and one for a single folder. | QDirStat (`sudo apt install qdirstat`) |
| Rename files usingg KRename | krename.nemo_action | Opens KRename with the selected files ready to be renamed. | BleachBit (install via app store (may be outdated), or download latest version here [https://www.bleachbit.org/download/linux](https://www.bleachbit.org/download/linux))</br>Zenity (`sudo apt install zenity`) |
| Resize PDFs using GhostScript | pdf_resize.nemo_action | Resize one or more PDF files using GhostScript | GhostScript |
| Securely move files and folders | securely_move.nemo_action | Copy files and folders to a new location, then shred original files and folders using Bleachbit. If files or folders with the same names already exist in new location, script prompts user for what to do. | BleachBit (install via app store (may be outdated), or download latest version here [https://www.bleachbit.org/download/linux](https://www.bleachbit.org/download/linux))</br>Zenity (`sudo apt install zenity`) |
| Send using Thunderbird | thunderbird.nemo_action | Send selected files via email using Thunderbird. | Thunderbird (`sudo apt install thunderbird`) |
| Shred using Bleachbit | shred_with_bleachbit.nemo_action | Shred selected files and folders using Bleachbit. | BleachBit (install via app store (may be outdated), or download latest version here [https://www.bleachbit.org/download/linux](https://www.bleachbit.org/download/linux))</br>Zenity (`sudo apt install zenity`) |
| Start Python HTTP server here | python_http_server_backgroundclick.nemo_action</br>python_http_server_onefolder.nemo_action | Start a Python HTTP development server in the selected directory. Note: Due to limitations in the Action syntax, two separate Action files are necessary, one for a background click (no selection) and one for a single folder. | Python3 (`sudo apt install python3`) |