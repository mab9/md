#!/bin/sh


echo "new core functions coming soon!"


echo "create tag"
echo "git tag 1.0.0"

echo ""
echo "push tags remote"
echo "git push origin --tags"

echo ""
echo "delete tag from local repository"
echo "git tag -d 1.0.0"
echo "Note that this does not remove the tag from any remote servers."

echo ""
echo "delete tag from any remote repositories"
echo "git push origin --delete 1.0.0"
# $ git tag -d v1.4-lw
# Deleted tag 'v1.4-lw' (was e7d5add)
#
# Note that this does not remove the tag from any remote servers. There are two common variations for deleting a tag from a remote server.
#
# The first variation is git push <remote> :refs/tags/<tagname>:
#
# $ git push origin :refs/tags/v1.4-lw
# To /git@github.com:schacon/simplegit.git
#  - [deleted]         v1.4-lw
#
# The way to interpret the above is to read it as the null value before the colon is being pushed to the remote tag name, effectively deleting it.
#
# The second (and more intuitive) way to delete a remote tag is with:
#
# $ git push origin --delete <tagname>


echo ""
echo "remove last x commits from local history in case not published ;-)"
echo "git reset --soft HEAD~2"
echo "the nuber represents the amount of commits to be removed."