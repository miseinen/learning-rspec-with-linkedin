# frozen_string_literal: true

require 'car'

# example group
describe 'Car' do
  # nested example groups

  # test attributes
  describe 'attributes' do
    # create hook
    before(:example) do # before 'it' blocks
      @car = Car.new
    end

    # skip example by xit
    xit 'allows reading and writing for :make' do
      @car.make = 'Test'
      expect(car.make).to eq('Test')
    end

    it 'allows reading and writing for :year' do
      @car.year = 9999
      expect(@car.year).to eq(9999)
    end

    it 'allows reading and writing for :color' do
      @car.color = 'foo'
      expect(@car.color).to eq('foo')
    end

    it 'allows reading for :wheels' do
      expect(@car.wheels).to eq(4)
    end

    # pending
    it 'allows writing for :doors'
  end

  # test class method
  # skip group by xdescribe
  xdescribe '.colors' do
    it 'returns an array of color names' do
      c = %w[blue black red yellow]
      expect(Car.colors).to match_array(c)
    end
  end

  # test instance method
  describe '#full_name' do
    it 'returns a string in the expected format' do
      # skip inside example
      skip('Skip example')
      @honda = Car.new(make: 'Honda', year: 2004, color: 'blue')
      expect(@honda.full_name).to eq('2004 Honda (blue)')
    end

    context 'when initialized with no arguments' do
      # pending inside example
      pending('Append description by pending')
      it 'return a string using default values' do
        car = Car.new
        expect(car.full_name).to eq('2007 Volvo (unknown)')
      end
    end
  end
end
