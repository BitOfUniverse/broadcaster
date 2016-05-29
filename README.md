# README
## Setup
- Clone repository
- Signup on [tokbox.com](http://tokbox.com) and grab the API keys
- Add API keys to config/application.yml:
opentok_api_key: your_api_key
opentok_api_secret: your_api_secret
- run rails server and open app in browser

## Deploy to heroku
- Setup app locally
- $ figaro heroku:set -e production
- $ heroku create
- $ git push heroku master
- $ heroku open
