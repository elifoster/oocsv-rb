# oocsv
[![Gem Version](https://badge.fury.io/rb/oocsv.svg)](https://badge.fury.io/rb/oocsv)

A very dynamic object-oriented approach to CSV reading and writing.

## Installation
### RubyGems
```shell
$ gem install oocsv
```

### Bundler
Add this line to the application's Gemfile:

```ruby
gem('oocsv')
```

And then execute:

```shell
$ bundle
```

## Usage
```ruby
require 'oocsv'

str = <<EOF
Year,Make,Model,Length
1997,Ford,E350,2.34
2000,Mercury,Cougar,2.38
EOF
# => "Year,Make,Model,Length\n1997,Ford,E350,2.34\n2000,Mercury,Cougar,2.38\n"

ary = OOCSV.read(str)
# => [#<struct Struct::CSVEntry>, #<struct Struct::CSVEntry>]

print OOCSV.write(ary)
# Year,Make,Model,Length
# 1997,Ford,E350,2.34
# 2000,Mercury,Cougar,2.38

ary[0].to_s
# => "#<struct Struct::CSVEntry @Year=1997 @Make=Ford @Model=E350 @Length=2.34>"
```
