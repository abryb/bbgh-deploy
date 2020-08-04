### Installation procedure for ovh debian 10

```shell
git clone this repository

# works for ovh debian 10, for other providers change host variable or do all this step by step
sudo ./prepare-server.sh

# we use://github.com/adnanh/webhook for deploy from master branch
sudo apt-get install webhook
cp -a webhook.json /etc/webhook.conf
# change webhook secret
sudo sed -i 's/notSoSecretSecret/<your secret>/g' /etc/webhook.conf
sudo service webhook restart

# create user
./add-user.sh <you username>
```
