#!/bin/sh


echo "new core functions coming soon!"

echo ""
echo "find command"
echo "----------------------------------------"
echo "find . -type f -name 'pom.xml'"

echo ""
echo "----------------------------------------"
echo "find file and replace string"
echo "find . -type f -name 'pom.xml' -print0 | xargs -0 sed -i 's,<version>support/mfh-SNAPSHOT</version>,<version>xxx-SNAPSHOT</version>,g'"

echo ""
echo "sed command"
echo "----------------------------------------"


echo ""
echo "variables and (back) ticks"
echo "----------------------------------------"
echo ""
echo "default variable"
echo "$""{LOGGING_LEVEL:='INFO'}"
echo ""
echo "escaping scripting tricks with ticks"
echo '"$""{LOGGING_LEVEL:='"'"'INFO'"'"'}'
echo "concatenate commands"


