# README

This is the campaign service project for PICA class from Javeriana University.

This is a test to use oracle db with rails and docker

Things you may want to cover:

## Ruby version

2.6.5

## System dependencies

To run this project with docker download the next packages in `vendor` folder from [Instant Client Downloads for Linux x86-64](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html#ic_x64_inst)

* instantclient-basiclite-linux.x64-12.2.0.1.0.zip
* instantclient-sdk-linux.x64-12.2.0.1.0.zip
* instantclient-sqlplus-linux.x64-12.2.0.1.0.zip

## Configuration

Please creates the `.env` file from `env.example`

## Database creation

For Oracle you can follow [Deliver Oracle Database 18c Express Edition in Containers](https://blogs.oracle.com/oraclemagazine/deliver-oracle-database-18c-express-edition-in-containers)

## How to run the test suite

To run the test you can run:

```
$ rspec
```

## To build the image in docker, please run

```
$ docker build -t campaign .
```

## Run docker

```
$ docker run --name campaign-service -p 3008:3008 --link database_container:database_container -d campaign
```

## Sources:

* [Docker oracle rails](https://github.com/belgoros/docker-oracle-rails)
* [Deliver Oracle Database 18c Express Edition in Containers](https://blogs.oracle.com/oraclemagazine/deliver-oracle-database-18c-express-edition-in-containers)
* [Ruby on Rails on Oracle: A Simple Tutorial](https://developer.oracle.com/dsl/haefel-oracle-ruby.html)
