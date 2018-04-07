require "spec_helper"

RSpec.describe Kernel do
  before(:each) do
    class Person; end
    add_checked_attribute(Person, :age)
    let(:bob) { Person.new }
  end
  describe 'checked_attribute' do
    example 'accepts valid values' do
      @bob.age = 20
      expect(@bob.age).to eq 20
    end

    example 'refuse nil values' do
      expect { @bob.age = nil }.to raise_error(RuntimeError)
    end

    example 'refuse false values' do
      expect { @bob.age = false }.to raise_error(RuntimeError)
    end
  end
end
