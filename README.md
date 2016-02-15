# Cloud Finance Readme
Ruby Project by Romain Claret, Matthieu Bandelier, \& Fabio Marques
What's not here must be on the wiki ;)

## Useful links
- [Greut's Demo Ruby on Rails application](https://github.com/HE-Arc/demo-rails-application)
- [Doc pour Ruby](http://ruby-doc.org)
- [Gems pour ruby](http://rubygems.org)
- [Rails](http://rubyonrails.org)
- [Bootstrap sass](https://github.com/twbs/bootstrap-sass)
- [Bootstrap components](http://getbootstrap.com/components/)
- [rails_best_practices](https://github.com/railsbp/rails_best_practices)
- [example](example)

## Installed additional gems
- 'bootstrap-sass', '~> 3.3.6'
- 'bcrypt', '~> 3.1.7'
- 'puma'

## Development setup (locally)
    $ docker-compose up -d    # starts the VMs
    $ docker exec -it ror_web_1 /bin/bash   # go to the web VM
    $ su ruby
    $ cd /usr/src/app
    $ cd FinanceCloud
    $ bundle install --without production # to do after gemfile modifications
    $ rails s -b 0.0.0.0  # run the server locally

## Production on heroku [Finance Cloud](https://finance-cloud.herokuapp.com):
    $ # To do in the local git repo
    $ git push heroku master

## Production on school nginx server [Finance Cloud](http://finance.srvz-webapp.he-arc.ch):
    $ # To do at the root of the server
    $ git clone https://github.com/Rocla/Dixit.git
    $ sudo rsync -a --progress Finance_Cloud/ www/
    $ cd www
    $ bundle install
