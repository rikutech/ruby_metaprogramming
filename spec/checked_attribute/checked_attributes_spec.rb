require 'spec_helper'

RSpec.describe CheckedAttributes do
  before(:each) do
    class Person
      include CheckedAttributes

      attr_checked :age do |v|
        v > 18
      end
    end

    @bob = Person.new
  end

  describe 'checked_attributes' do
    example 'accepts valid values' do
      @bob.age = 20
      expect(@bob.age).to eq 20
    end

    example 'refule invalid values' do
      expect { @bob.age = 18 }.to raise_error(RuntimeError)
    end
  end
end
