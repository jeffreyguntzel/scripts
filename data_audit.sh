#!/usr/bin/env bash

help() {
    echo -e "\nThis script generates an audit of whatever csv file you feed it.\n"
    echo -e "It requires csvkit to work. For csvkit installation instructions, please visit https://github.com/wireservice/csvkit\n"
    echo -e "Usage: $0 [input file] [output file]"
}

usage () { echo "Usage: $0 [input file] [output file]."; exit 1; }

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    help
    exit 0
fi

(($#==2)) || usage
 
INPUTFILE="$1"
OUTPUTFILE="$2"
 
cat <<EOF >$OUTPUTFILE
$(date "+Generated on %m/%d/%y at %H:%M:%S")
 
DATA AUDIT: $1
 
------------
COLUMN NAMES
------------
 
$(csvcut -n $INPUTFILE)
 
---------------------------------------
FIRST TEN ROWS OF FIRST FIVE COLUMNS
---------------------------------------
 
$(csvcut -c 1,2,3,4,5 $INPUTFILE | head -n 10)
 
------------
COLUMN STATS
------------
 
$(csvcut $INPUTFILE | csvstat )
 
---END AUDIT

EOF
 
echo "Audited!"
