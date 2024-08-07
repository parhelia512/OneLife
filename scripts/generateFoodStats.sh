cd /home/jcr15
cd checkout/OneLifeWorking/server

~/checkout/OneLifeWorking/scripts/gitPullComplete.sh


sh makePrintFoodLogStatsHTML



while read user server port
do
  echo ""
  echo "Using rsync to sync all food logs from $server"
  echo ""

  if [ ! -d ~/checkout/OneLife/server/foodLog_$server ]
  then
	  echo "Making local directory foodLog_$server"
	  mkdir ~/checkout/OneLife/server/foodLog_$server
  fi

  if [ ! -d ~/checkout/OneLife/server/foodLogDetail_$server ]
  then
	  echo "Making local directory foodLogDetail_$server"
	  mkdir ~/checkout/OneLife/server/foodLogDetail_$server
  fi

  rsync -avz -e ssh --progress $user@$server:checkout/OneLife/server/foodLog/*.txt ~/checkout/OneLife/server/foodLog_$server

  rsync -avz -e ssh --progress $user@$server:checkout/OneLife/server/foodLogDetail/*.txt ~/checkout/OneLife/server/foodLogDetail_$server

done <  <( grep "" ~/www/reflector/remoteServerList.ini )


/home/jcr15/checkout/OneLifeWorking/server/printFoodLogStatsHTML /home/jcr15/checkout/OneLife/server /home/jcr15/checkout/OneLife/server/objects /home/jcr15/public_html/foodStatsData.php
