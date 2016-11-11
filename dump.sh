#!/bin/sh

FILE=$(date +%Y-%m-%dT%H:%M:%SZ).json
BUCKET=migrantnews-app-db-dev-dumps

mongoexport -h $MONGO_HOST --db newsfilter --collection alerts | aws s3 cp --no-sign-request - s3://$BUCKET/alerts/$FILE --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers

mongoexport -h $MONGO_HOST --db newsfilter --collection feeds | aws s3 cp --no-sign-request - s3://$BUCKET/feeds/$FILE --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
