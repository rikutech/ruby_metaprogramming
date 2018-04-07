require "spec_helper"

RSpec.describe Kernel do
  before(:each) do
    class Person; end
    add_checked_attribute(Person, :age) do |age|
      age > 18
    end
    @bob = Person.new
  end
  describe 'checked_attribute' do
    example 'accepts valid values' do
      @bob.age = 20
      expect(@bob.age).to eq 20
    end

    example 'refuse invalid values' do
      expect { @bob.age = 18 }.to raise_error(RuntimeError)
    end
  end
end
