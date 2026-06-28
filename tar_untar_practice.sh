#!/bin/bash

###############################################################################
# Compression and Archiving Lab
# Author : Vardhan
# Purpose: Practice tar, gzip, bzip2, and xz commands
###############################################################################


set -x

set -euo pipefail


echo "==============================="
echo " Linux Compression Lab Started "
echo "==============================="

###############################################################################
# Step 1: Create a practice directory
###############################################################################

mkdir -p compression_lab
cd compression_lab || exit

###############################################################################
# Step 2: Create sample files
###############################################################################

echo "Linux Administration" > file1.txt
echo "DevOps Engineering" > file2.txt
echo "Shell Scripting" > file3.txt

echo "Sample files created."

###############################################################################
# Step 3: Verify files
###############################################################################

# List files with details
ls -ltr

###############################################################################
# Step 4: Create a directory and move files into it
###############################################################################

mkdir documents
mv file*.txt documents/

echo "Files moved into documents directory."

###############################################################################
# Step 5: Verify directory contents
###############################################################################

ls -ltr
ls -ltr documents

###############################################################################
# Step 6: Create a TAR archive
###############################################################################
# c = create
# v = verbose
# f = archive filename

tar -cvf documents.tar documents/

echo "Created documents.tar"

###############################################################################
# Step 7: View archive contents WITHOUT extracting
###############################################################################

tar -tvf documents.tar

###############################################################################
# Step 8: Compress archive using gzip
###############################################################################
# gzip compresses a SINGLE FILE.
# documents.tar becomes documents.tar.gz

gzip documents.tar

echo "Compressed using gzip."

###############################################################################
# Step 9: Verify compressed file
###############################################################################

ls -lh

###############################################################################
# Step 10: Decompress gzip archive
###############################################################################
# gunzip restores the original tar archive.

gunzip documents.tar.gz

echo "Gzip archive extracted."

###############################################################################
# Step 11: Compress directly using tar + gzip
###############################################################################
# z = gzip compression

tar -czvf documents_backup.tar.gz documents/

###############################################################################
# Step 12: View compressed archive contents
###############################################################################

tar -tzvf documents_backup.tar.gz

###############################################################################
# Step 13: Extract compressed archive
###############################################################################

mkdir restore

tar -xzvf documents_backup.tar.gz -C restore/

echo "Archive restored."

###############################################################################
# Step 14: Verify extracted files
###############################################################################

tree restore 2>/dev/null || ls -R restore

###############################################################################
# Step 15: Compress using bzip2
###############################################################################
# Better compression than gzip
# Slower than gzip

tar -cvf documents_bzip.tar documents/

bzip2 documents_bzip.tar

###############################################################################
# Step 16: Restore bzip2 archive
###############################################################################

bunzip2 documents_bzip.tar.bz2

###############################################################################
# Step 17: Compress using xz
###############################################################################
# Highest compression ratio
# Slowest compression

tar -cvf documents_xz.tar documents/

xz documents_xz.tar

###############################################################################
# Step 18: Restore xz archive
###############################################################################

unxz documents_xz.tar.xz

###############################################################################
# Step 19: Compare file sizes
###############################################################################

ls -lh

###############################################################################
# Step 20: Cleanup (Optional)
###############################################################################
# Uncomment the below line if you want to delete the lab after practice.

# rm -rf compression_lab

echo "==============================="
echo " Compression Lab Completed "
echo "==============================="
