Mac Say Server
==========
use say and saykana via http


Dependencies
------------

* Mac OSX
* Sinatra
* /usr/bin/say
* [saykana](http://www.a-quest.com/quickware/saykana/)

http://gyazo.com/e330ddc7614dffbdf2ddd29e4917987d


Install Dependencies
--------------------

    % gem install bundler
    % bundle install


Say setting
-----------
[System Preferences]->[Speech]
<img src="http://gyazo.com/e330ddc7614dffbdf2ddd29e4917987d.png">


Setup
-----

    % cp sample.config.yaml config.yaml

edit it.


Run
---

    % ruby development.rb

for passenenger, use config.ru
