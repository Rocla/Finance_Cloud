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
- [Try Ruby](http://tryruby.org)
- [example](example)

## Used particular gems
### Global
- 'bootstrap-sass', '~> 3.3.6'

### Windows specific
- 'tzinfo-data'

### Staging
- 'puma'
- 'bcrypt', '~> 3.1.7'

### Production
- 'pg'
- 'rails_12factor'

## Usage
### **Development** on local container
**Do once:**

  Do the installation setup of the container with instructions here: https://github.com/HE-Arc/demo-rails-application

    $ cd container_install_directory
    $ git clone https://github.com/HE-Arc/Finance_Cloud.git

**Do each time:**

    $ cd container_install_directory/Finance_Cloud
    $ docker-compose up -d    # starts the VMs
    $ docker exec -it ror_web_1 /bin/bash   # go to the web VM
    $ su username
    $ cd /usr/src/app/Finance_Cloud
    $ bundle install --without production windows # to do after gemfile modifications
    $ rails s -b 0.0.0.0  # run the server locally

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

    $ usermod -l username ruby    # remplace username by your server username [romain, matthieu, fabio]
    $ vi /etc/sudoers.d/ruby    # remplace ruby by username
    $ su username

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
  
    $ cd /usr/src/app/Finance_Cloud
    $ sudo bundle install
    $ bundle exec cap install
    $ bundle exec cap staging deploy

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
