# Cloud Finance Heroku Deploy Version
[![Build Status](https://travis-ci.org/HE-Arc/Finance_Cloud.svg?branch=master)](https://travis-ci.org/HE-Arc/Finance_Cloud)

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
- [Try Ruby](http://tryruby.org)
- [Issue and Pull Request templates](https://github.com/blog/2111-issue-and-pull-request-templates)
- [Ruby regular expression editor](http://rubular.com)
- [Automatically Run Migrations When Deploying to Heroku](http://gunpowderlabs.com/blog/automatically-run-migrations-when-deploying-to-heroku/)
- [example](example)

## Used particular gems

### Global
- 'pg'
- 'bootstrap-sass', '~> 3.3.6'
- 'stock_quote' # https://rubygems.org/gems/stock_quote
- 'chartkick' # https://github.com/ankane/chartkick
- 'active_median'

### Development
- 'byebug' # **debugger** and ctrl-d to release

### Staging
- 'puma'
- 'bcrypt', '~> 3.1.7'

### Production
- 'rails_12factor'

## Usage
### **Development** on local container

**Reminder**

  - Local address: http://192.168.99.100:3000/
  - School server: ssh -p 2008 username@srvz-webapp.he-arc.ch

**Do once:**

  Do the installation setup of the container with instructions ( [repository](https://github.com/HE-Arc/demo-rails-application#this-repository) & [Containers](https://github.com/HE-Arc/demo-rails-application#containers)) here: https://github.com/HE-Arc/demo-rails-application

    $ cd container_install_directory
    $ git clone https://github.com/HE-Arc/Finance_Cloud.git

**Do each time:**

    $ cd container_install_directory
    $ docker-compose up -d    # starts the VMs
    $ docker exec -it ror_web_1 /bin/bash   # go to the web VM
    # su username
    $ cd /usr/src/app/Finance_Cloud
    $ bundle install --without production # to do after gemfile modifications
    $ rails s -b 0.0.0.0  # run the server locally

**Do for "security" updates:**

Create security update:

    # su username
    $ cd /usr/src/app/Finance_Cloud
    $ git checkout -b rails-upgrade # create rails-upgrade branch
    $ sed -i "s/gem 'rails', '4.2.5'/gem 'rails', '4.2.5.1'/" Gemfile # rename rails version
    $ bundle update rails
    $ bundle exec rake
    $ git add -p . # -p is used to choose for to commit (y=yes, n=no, a=always) could use -A instead as well for adding all modifications
    $ git commit -m "Security update for rails"

Deploy security update on the staging server:

    $ git checkout master
    $ git merge rails-upgrade
    $ cap deploy

### **Production** on heroku [Finance Cloud](https://finance-cloud.herokuapp.com):
**Do each time:**

  *From the local container as username*

    $ cd /usr/src/app/Finance_Cloud
    $ git push heroku master
    $ heroku run rake db:migrate # migrate if needed
    $ heroku run rake db:seed # seed database if needed

### **Staging** on school's nginx server [Finance Cloud](http://finance.srvz-webapp.he-arc.ch):
**Do once:**

  *From the local container as root*

    # usermod -l username ruby    # remplace username by your server username [romain, matthieu, fabio]
    # vi /etc/sudoers.d/ruby    # remplace ruby by username
    # su username

  *From the local container as username*

    $ ssh-keygen # no passphrase
    $ more ~/.ssh/id_rsa.pub  # copy the public key

  *From the remote server (ssh)*

    $ vi ./ssh/authorized_keys  # add the copied public key from local container
    $ ssh-keygen # no passphrase
    $ more ~/.ssh/id_rsa.pub  # copy the public key

  *From your browser:*

Go to https://github.com/settings/ssh and add the copied remote server  public key

  *From the local container as username*

    $ cd /usr/src/app/Finance_Cloud
    $ sudo bundle install
    $ bundle exec cap install
    $ bundle exec cap staging deploy

  *From the remote server (ssh)*

    $ sudo vi /etc/service/puma/run
    cd "/var/www/Finance_Cloud/current"
    $PUMA_ENV="/var/www/config/puma.rb"

    $ vi ~/www/config/nginx.conf
    Environment “staging”
    root /var/www/Finance_Cloud/current/public
    PUMA_ENV="/var/www/config/puma.rb"
    directory “/var/www/app/current”

**Do each time:**

  *From the local container as username (NB push changes to git repo)*

    $ bundle exec cap staging deploy


## Tests

Example with User model

**Generate test files (first time only)**

    $ rails generate scaffold user username:string email:string password_digest:string --skip

### Unit Tests

**Preparing application for testing**

    $ rake db:migrate
    $ rake db:test:load

**Running unit tests**

    $ ruby -Itest test/models/user_test.rb

### General

  **Run all tests**

    $ rake test
