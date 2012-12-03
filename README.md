# SpotlightModel

using [ruby-spotlight](https://github.com/youpy/ruby-spotlight) like activerecord

## Usage

    require 'spotlight_model/base'
    class Item < SpotlightModel::Base
      with_scope 'path/do/data'
    end
     
    @items = Item.find('kMDItemKind == "JPEG image"','kMDItemPixelHeight < 500')
    @items.each{|x| puts x.kMDItemFSName}

## TODO

- write more easily search query (DSL like)
