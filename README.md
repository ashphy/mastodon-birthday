# mastodon-birthday

Happy Birthday!

## Operation

```
heroku run rails db:sessions:clear
```

# Local Development

```
ngrok http 80

bundle install
bundle exec rails db:setup
```

## Test Mastodon Server Setup

Commands for creating admin account.

```
$ ngrok http 3001
```

Replace `LOCAL_DOMAIN` in `.env.mastodon.dev` with ngrok tunnel address.

```
$ docker-compose up -d 
$ docker-compose run --rm web bundle exec bin/tootctl accounts create ashphy --confirmed --role=admin
$ docker-compose run --rm web bundle exec bin/tootctl accounts modify ashphy --reset-password
```
