require 'spec_helper'

describe Mula do
  it "should convert my monies" do

    class MulaTest
      include Mula::Helpers
    end
    
    test = MulaTest.new
    puts test.convert(1,'USD','GBP')
    test.convert.class.should be String
    
  end
end