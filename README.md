# Texter

## Description

This is a simple Rails application that sends a text message to a US phone number. It was built to integrate with [Capistrano](http://capistranorb.com/), a remote server automation and deployment tool written in Ruby and [Passenger](https://www.phusionpassenger.com/), which is a web/application server to help with deployment.

This deployment script contains 3 main files. They are located at `/config/deploy/production.rb`, `/config/deploy.rb`, `Passengerfile.json` and `Capfile` on the root directory. Each of them will be explained more in the steps below.

This will also works with the CentOS 6 set up [Puppet](https://puppet.com/) module at [https://github.com/gVien/centos6-setup](https://github.com/gVien/centos6-setup), which is needed to set up an AWS EC2 server.

## Set Up

* Clone this repository in your local computer.
* Go to your clone directory and enter `bundle install` (if bundler is missing, try `gem install bundler`).
* Most of this is already set up but the only thing needs to be changed is the public IP in line 1 of the `/config/deploy/production.rb` file. Simple change that IP. Note you can change the user as well but it is not recommended, since it's preset in the Puppet module.
* If a server hasn't been set up, please see [https://github.com/gVien/centos6-setup](  https://github.com/gVien/centos6-setup) for more instructions.
* After the server is set up, configure the deployment (first time deployment only) with these commands to build out the necessary directory structure.

`bundle exec cap production deploy:check`

`bundle exec cap production puma:config`

* Once that is done, deploy the app with `bundle exec cap production deploy`. Note I did not set up `ssh` the user in the Puppet module so the server may ask for a password, which is also discussed in that repo. The first time deployment will probably take ~10-15 minutes because it needs to download all the require dependencies but it should be a lot faster afterward.

Note: there is a bug with puma server, so I also integrated with Passenger which uses Nginx engine to resolve this. After the deployment is a success, simply log into the AWS server with the `.pem` file as root. Go to `/var/www/texter/current` directory and start up the passenger server with `bundle exec passenger start` which will start the Nginx powered server. Passenger will look for and use the setting inside the `Passengerfile.json` file. Now you can browse through your AWS DNS or IP.




