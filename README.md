Details
-------

bot.rb is the bot itself. I've got it in such a way that it imports the modules for scrobbling and querrying wolfram alpha.
This way it's not one big file and is easier to debug, add functionality etc.


Instructions
------------

Clone repo.
Run `bundle install` *I always delete the Gemfile.lock before running bundle install.*
  
Files you should have (similar to mine):
  
- config.ru
- Gemfile
- Procfile but replace bot.rb with whatever file your bot is in.


Instructions for deploying an already working bot to heroku. (It's running locally, right?)
Most is replicated from https://github.com/davidboy/herokubot but let me expound a little.    
  
Deployment (heroku) via heroku git:
*assuming you already have a git repo set uo wiwth git init*

   
1. If you have no heroku account create one and do evrything that partains pushing to heroku:
      gem install heroku
      Log into Heroku `heroku login` 
      create a new app (this is: nairobi-bot)
      add a new remote (this is: heroku git:remote -a nairobi-bot)
3. Then `heroku create --stack cedar`
4. If your code is ready for deployment: staged, commited etc run `git push heroku master`
5. Then `heroku scale web=0`
6. Then `heroku scale bot=1`
7. Join the channel(s) and see your bot go.
