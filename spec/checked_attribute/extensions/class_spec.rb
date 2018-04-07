require 'spec_helper'

RSpec.describe Class do
  before(:each) do
    class Person
      attr_checked :age do |v|
        v > 18
      end
    end

    @bob = Person.new
  end

  describe 'attr_checked' do
    example 'accepts valid values' do
      @bob.age = 20
      expect(@bob.age).to eq 20
    end

    example 'refule invalid values' do
      expect { @bob.age = 18 }.to raise_error(RuntimeError)
    end
  end
end
