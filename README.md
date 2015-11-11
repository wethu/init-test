
##Bug or My misconfig?

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

2, Visit `/` and Notice: <h1> bar </h1>

3, modify `app/controllers/foos_controller.rb` 

that won't break it (keeping the call to Foo.configuration.bar). I chose to put a `#comment` on its own line
for example:
```
class FoosController < ApplicationController
  def index
    @foo = Foo.configuration.bar
    # keep the call to Foo.configuration.bar, but modify this file like this line does
  end
end
```

4, visit `/` 

Exception.

Not sure what i'm doing wrong here. To fix, i simply restart WEBrick.

###Resolution:

```
<bricker> wethu: autoload (i.e. Rails automatic class reloading in development) is messing you up
<bricker> wethu: you configure in an initialize, which populates Foo.configuration. Then you make a change and Rails automatically reloads your classes, reinitializing Foo and resetting Foo.configuration
```

Thanks Bricker!

