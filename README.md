
== Bug or My misconfig?

`undefined method 'bar' for nil:NilClass`

Steps to reproduce:

1, Start the server

```
$ rails s
=> Booting WEBrick
=> Rails 4.2.4 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2015-11-11 08:02:32] INFO  WEBrick 1.3.1
[2015-11-11 08:02:32] INFO  ruby 2.1.0 (2013-12-25) [x86_64-darwin14.0]
[2015-11-11 08:02:32] INFO  WEBrick::HTTPServer#start: pid=30051 port=3000
```
2, Visit /
Notice bar

3, edit app/controllers/foos_controller.rb in any way, i chose to put a # on its own line for example

4, visit /
