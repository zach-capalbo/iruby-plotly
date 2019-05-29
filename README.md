# iruby-plotly

A shim to support using [Plotly](https://plot.ly/) in IRuby Jupyter notebooks.

Usage:

```ruby
require 'iruby/plotly'

IRuby.plotly([{y: [1,2,5,20]}])
```

or (convenience method)

```ruby
IRuby.plot([1,2,5,20])
```

or (convenience method)

```ruby
IRuby.plot(y: [1,2, 5, 20], x: [0,1,2,3])
```

![Example Output](example.png)
