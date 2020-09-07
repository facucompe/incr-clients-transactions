# clients-transactions

## Installation
Follow this [guide](https://gorails.com/setup) to install ruby and postgresql.

This service needs Redis to execute cron jobs. You can install Redis or dockerize it with:

```bash
docker run --name some-redis -d redis
```

### Installing Rails gems

Install Bundler.
```
gem install bundler --no-ri --no-rdoc
rbenv rehash
```
Install basic dependencies if you are using Ubuntu:
```
sudo apt-get install build-essential libpq-dev nodejs
```
Install all the gems included in the project.
```
bundle install
```
### Database Setup

Run in terminal:

```
sudo -u postgres psql
  CREATE ROLE "rails-bootstrap" LOGIN CREATEDB PASSWORD 'rails-bootstrap';
```

Log out from postgres and run:

```
bundle exec rake db:create db:migrate
```

# Run
Run server with:
```
rails server
```
Run sidekiq to execute cron jobs
```
bundle exec sidekiq
```

