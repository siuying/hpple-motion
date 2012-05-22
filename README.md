# Hpple motion

An XML/HTML parser for RubyMotion, with nokogiri style interface.

Based on [Hpple](https://github.com/topfunky/hpple) and some hacks.

WARNING: This is a quick hack that I'll use until we can use the real 
nokorigi (or maybe something based on NSXMLDocument). It has not been heavily tested.

## Install

Install motion-hpple:

    gem install motion-hpple

Add following to your Rakefile:

```ruby
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-cocoapods'
require 'motion-tidy'

Motion::Project::App.setup do |app|
  app.name = 'sample' 
end
```

## Usage

``` ruby
html = "<html><body><h1>Hello</h1><div><p>Foo</p><p>Bar</p></div><p><a href=\"http://google.com\">google</a></p></body></html>"
parser = Hpple.HTML(html)

# Get content via #to_s, #to_html and #inner_html
h1 = parser.xpath("//h1").first
h1.tag # => "h1"
h1.to_s # => "Hello"
h1.to_html # => "<h1>Hello</h1>"

div = parser.xpath("//div").first
div.inner_html # => "<p>Foo</p><p>Bar</p>"

# Access attributes directly
link = parser.xpath("//a").first
link["href"] # => "http://google.com"
```

For more example, check the spec.

