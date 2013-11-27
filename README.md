Instructions
------------

Instructions for deploying an already working bot to heroku. (It's running locally, right?)
Most is replicated from https://github.com/davidboy/herokubot but let me expound a little.

1. Create a blank config.ru file.
2. Create a Gemfile similar to mine and run `bundle install`
3. Create a Procfile similar to mine but replace messanger.rb with whatever file your bot is in.
4. Now is the moment. If you have no heroku account create one and do evrything that partains pushing to heroku. Like installing the Heroku gem.
5. Log into Heroku `heroku login`
6. Then `heroku create --stack cedar`
7. Then `git push heroku master`
8. Then `heroku scale web=0`
9. Then `heroku scale bot=1`
10. Log into the channel(s) and see your bot go.
