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

## Useful commands
    $ docker-compose up -d
    $ docker exec -it ror_web_1 /bin/bash
    $ su ruby
    $ cd /usr/src/app
    $ cd FinanceCloud
    $ rails s -b 0.0.0.0

## Setup tested on nginx server:
    $ git clone https://github.com/Rocla/Dixit.git
    $ sudo rsync -a --progress Finance_Cloud/ www/
    $ cd www
    $ bundle install
