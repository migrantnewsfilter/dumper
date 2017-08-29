hyper cron create --minute=0 --hour=23 --name dumper --env-file .env --link news-mongo-1:mongo --size s2 migrantnewsfilter/dumper
