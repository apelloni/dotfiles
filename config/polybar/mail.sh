#!/bin/bash
THUNDERBIRD_PROFILE="${HOME}/.thunderbird/gnvyzfth.default-default"


# Email count per account
# We grab the last istance of A1=?? which contains the number of unread emails
cd ${THUNDERBIRD_PROFILE}
COUNTS=$(find . -name 'INBOX.msf' -exec sh -c "echo -n {}:; tac {} | grep -m1 -Eo '\^A1=[0-9a-f]+'"  \;)

# Strip away all unnecessary information and convert HEX to DEC and sum
UNDREAD_TOTAL=$(echo ${COUNTS[@]} | tr '[:lower:]' '[:upper:]' | grep -Eo "=[0-9A-F]+" \
    | tr -d "=" |  xargs printf "obase=A;ibase=F;%s\n" | bc \
    |  awk '{sum += $1} END {print sum}')

echo $UNDREAD_TOTAL
