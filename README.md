curl-ftp-script
===============

A bash script for uploading local files via curl and ftp-ssl

## Usage:

Download the file and edit the following variables at the top:

    USERNAME
    PASSWORD
    SERVER
    DEFAULTDIR (optional)

After editing and saving the file, run it like so:

    $ ./ftp.sh fileToUpload.txt secondFile.html

As of 0.0.1, you must list all the files you want to upload manually - * is not parsed.

If you want to upload some files to a specific subdirectory, list that subdirectory as the first argument, and make sure it begins with a forward slash (/). If you do not include the forward slash, the directory name will be interpreted as a file.

    $ ./ftp.sh /sub/directory all.txt these.html files.css
