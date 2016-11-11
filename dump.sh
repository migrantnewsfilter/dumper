#!/bin/sh

FILE=$(date +%Y-%m-%dT%H:%M:%SZ).json
BUCKET=migrantnews-app-db-dev-dumps

mongoexport -h $MONGO_HOST --db newsfilter --collection news | aws s3 cp --no-sign-request - s3://$BUCKET/news/$FILE --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers

#mongoexport -h $MONGO_HOST --db newsfilter --collection terms | aws s3 cp --no-sign-request - s3://$BUCKET/terms/$FILE --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
