# -*- coding: utf-8 -*-
require 'spotlight'

module SpotlightModel
  class NoScopesError < StandardError; end

  class Base
    @@scopes = []

    class << self

      def with_scope *args
        args.each{|s| @@scopes << s}
        self
      end

      def find *args
        raise NoScopesError if @@scopes.empty?
        exec args.to_a.reduce{|x,y| x && y}
      end

      def find_with_scope *args
        scope = args.slice!(0)
        query = args
        @@scopes = [scope] unless scope.instance_of? Array
        exec query.reduce{|x,y| x && y}
      end

      private
      def exec q
        query = Spotlight::Query.new(q)
        query.scopes = @@scopes
        query.execute.map{|x| self.new x}
      end
    end

    public

    def initialize item
      @native = item
      self
    end

    def attributes
      @native.attribute_names
    end

    def method_missing method_symbol, *args
      @native.get(method_symbol) if self.attributes.include? method_symbol
    end

  end
end
