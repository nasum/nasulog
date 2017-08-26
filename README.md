# OpenPoem

Web application that writes poem. like [pplog](https://www.pplog.net/).

## Development Environment

### necesarry

* Ruby (2.3.0)
* MySQL
* nodejs
* v8
* Google のトークン
* Docker for Mac

### provision

#### Setting Google OAuth

* Create Project in [Google Developers Console](https://console.developers.google.com/)

#### copy .env.example and edit .env

```bash
cp .env.example .env
```

#### start middleware

```bash
docker-compose -f docker-compose.yml up
```

#### Setting Rails

```bash
$ ./bin/setup
```

#### Start Project

```bash
$ ./bin/rails s
```

### test

```bash
$ ./bin/rake spec
```

### Change of environment

* Add process for `bin/setup`
* or  edit README.md

## Heroku

### setting nodejs

- heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git

### setting MySQL

- ClearDB
- JawsDB
