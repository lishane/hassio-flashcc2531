#!/bin/bash
echo "Started"

cd /flash_cc2531

./cc_chipid

echo "Downloading firmware"
if ! wget https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/CC2531_DEFAULT_20201127.zip; then echo "firmware not found" && exit 1; fi

echo "unziping"
if ! unzip CC2531_DEFAULT_20201127.zip; then echo "unzip failed" && exit 1; fi

echo "erase"
./cc_erase

echo "flash firmware"
./cc_write CC2531ZNP-Prod.hex

echo "Finished"
