# KaminariJson

Provides a helper method to add pagination information to JSON responses.

## Installation

Add this line to your application's Gemfile:

    gem 'kaminari_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaminari_json

## Usage

Adds pagination information based on the Array or ActiveRecord::Relation passed in and returns a JSON
object.

Example:
```
class SomeController < ApplicationController

  def index
    @things = Thing.all
    respond_to do |format|
      format.json do
        render json: json_paginate(@things)
      end
    end
  end
end
```

An ActiveModel::Serializer can be specified as well.

```
render json: json_paginate(things, each_serializer: StatementForListSerializer)
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
=======
kaminari_json
=============

Kaminari pagination info for json responses.
