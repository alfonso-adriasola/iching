# I Ching - chaos meditation

This project is intended to illustrate a creative process, to challenge assumptions and provide some background for a talk , presentation or other expansive format.

The code is part of the narrative.

Usage:

from terminal, as text ui 
```ruby iching.rb "ask your question here, typing helps focus"```

or run sinatra and provide text web ui
```ruby pu.rb -o 0.0.0.0 ```

to run from docker
```docker run -it --rm --name iching -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:3.0.4-slim ruby iching.rb```

or visit at https://text-only-iching.herokuapp.com

<a rel="me" href="https://ruby.social/@aadriasola">find me in mastodonn</a>
