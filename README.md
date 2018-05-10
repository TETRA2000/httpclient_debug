# httpclient_debug

## About

This repo is a reproduction code for the issue of httpclient [#225](https://github.com/nahi/httpclient/issues/225) and [#373](https://github.com/nahi/httpclient/issues/373).
These scripts are trying to let response timeout error occuor with setting timeout to 5 seconds and slowing down machine's network interface.

I used `tc` commmand to achive emulating unstable network. So BE CAREFUL to use this code.

## Usage

```sh
bundle install
sudo ./exec.sh > result.txt 2>&1
```

## Example result

```
! CONNECT TO www.example.com:443
! CONNECTION CLOSED
"ERROR. ExecTime:5.001403123s"
#<HTTPClient::ReceiveTimeoutError: execution expired>
/usr/share/ruby/2.0/openssl/buffering.rb:54:in `sysread'
/usr/share/ruby/2.0/openssl/buffering.rb:54:in `fill_rbuff'
/usr/share/ruby/2.0/openssl/buffering.rb:201:in `gets'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient/ssl_socket.rb:62:in `gets'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient/session.rb:805:in `block in parse_header'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient/session.rb:801:in `parse_header'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient/session.rb:784:in `read_header'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient/session.rb:561:in `get_header'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:1299:in `do_get_header'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:1245:in `do_get_block'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:1019:in `block in do_request'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:1133:in `protect_keep_alive_disconnected'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:1014:in `do_request'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:856:in `request'
/PATH/TO/httpclient_debug/vendor/bundle/ruby/2.0/gems/httpclient-2.8.3/lib/httpclient.rb:743:in `get'
test.rb:17:in `block (2 levels) in <main>'
= Request
```
