#!/usr/bin/env bash
 
usage () { echo "You must specify an input and output file"; exit 1; }
 
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