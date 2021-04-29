docker-compose exec mongodb bash -c "keys=`mongo -u user -p pass mongo --authenticationDatabase admin --eval "rs.slaveOk();var keys = []; for(var key in db.${COLLECTION}.findOne()) { keys.push(key); }; keys;" --quiet` && mongoexport --db mongo --username user --password pass --authenticationDatabase admin --collection=${COLLECTION} --fields="${keys}" --type=csv --out=/tmp/export.csv"