require 'bundler/setup'
require 'spotlight_model'

RSpec.configure do |conf|
  
  def fixtures_path
    File.dirname(__FILE__)+'/fixtures/'
  end
  
end




