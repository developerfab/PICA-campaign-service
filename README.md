# README

This is the campaign service project for PICA class from Javeriana University. This project is running with sqlserver.

##  Ruby version

2.6.5

## System dependencies

1. SQLServer

For run this in development environment you can run the sqlserver with docker, for more information you can visit [Quickstart: Run SQL Server container images with Docker](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash)

2. [Tiny_tds](https://github.com/rails-sqlserver/tiny_tds)

## Configure in localhost

If you want run this project in localhost you should copy the `env.example` file and override the variables and run:

* Configure the database

```
$ rails db:create db:migrate
```

* How to run the test suite

```
$ bundle exec rspec
```

## Configure with docker

If you want this project with docker, you can run

```
$ sh start.sh
```
