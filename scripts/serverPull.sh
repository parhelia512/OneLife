cd ~/checkout/OneLife/server


# mv custom settings out of the way
# -om gets untracked and modified files
mkdir settingsTemp
git ls-files -om --exclude-standard settings | xargs -I '{}' mv '{}' settingsTemp/

~/checkout/OneLife/scripts/gitPullComplete.sh


# mv custom settings back in place after pull
mv settingsTemp/* settings
rmdir settingsTemp/