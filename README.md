# Luhn Validate gem

# Install

use `gem install luhn_validate` to install gem to system
implement `gem luhn_validate` to Gemfile to use gem inside specific gemset

## Validate Card PAN by Luhn algorithm

All information about Luhn algorithm on [wiki](https://en.wikipedia.org/wiki/Luhn_algorithm)

`luhn_validate` gem implements full Luhn algorithm algo which can be used to protect against accidental errors

## Usage

```
require 'luhn_validate'

card_pan = '4111111111111111'
Luhn.validate(card_pan) # returns an object #<Luhn:0x0007f9e67718290 @card_size=16, @pan_array=[4...1], @valid=true>

# or you can use 14 to 19 digits, e.g:

card_pan = 4111111111111111
Luhn.validate(card_pan) # returns an object #<Luhn:0x0007f9e67718290 @card_size=16, @pan_array=[4...1], @valid=true>
```