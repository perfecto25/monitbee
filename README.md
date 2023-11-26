# MonitBee (crystal)

## init project

  marten new project monitbee

## DB and schema

  ./bin/marten genmigrations
  ./bin/marten migrate
  ./bin/marten serve

## compile release
  
  crystal build src/server.cr -o bin/server --release
  crystal build src/manage.cr -o bin/manage --release
  bin/manage collectassets --no-input
  bin/manage migrate 

  # run the server
  bin/server

