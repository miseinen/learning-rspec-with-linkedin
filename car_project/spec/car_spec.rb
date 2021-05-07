# frozen_string_literal: true

require 'car'
require 'shared_examples/a_standard_vehicle'

# example group:
# using class name allows to declare 'subject' variable implicitly
describe Car do
  it_behaves_like('a standard vehicle')
  # nested example groups:

  # test attributes
  # describe 'attributes' do
    # what 'let' do automatically:
    # before(:example) do # before 'it' blocks
    #   def car
    #     @car ||= Car.new
    #   end
    # end

    # 'let' is better than 'before' for setting up instance variables
    # 'subject' is the same as let(:subject)
    # use 'subject' instead of 'let' if variable is a subject of example
    # using class name as 'describe' name allows to omit following declaration
    # subject { Car.new } # lazy execution; 'subject!' (or 'let!') is eager execution

    # skip example by xit
    # xit 'allows reading and writing for :make' do
    #   subject.make = 'Test'
    #   expect(subject.make).to eq('Test')
    # end

    # pending
    # it 'allows writing for :doors'
  # end

  # test class method
  # skip group by xdescribe
  xdescribe '.colors' do
    let(:colors) { %w[blue black red yellow] }

    it 'returns an array of color names' do
      expect(Car.colors).to match_array(colors)
    end
  end

  # test instance method
  describe '#full_name' do
    let(:honda) { Car.new(make: 'Honda', year: 2004, color: 'blue') }
    let(:new_car) { Car.new }

    it 'returns a string in the expected format' do
      # skip inside example
      skip('Skip example')
      expect(honda.full_name).to eq('2004 Honda (blue)')
    end

    context 'when initialized with no arguments' do
      # pending inside example
      pending('Append description by pending')
      it 'return a string using default values' do
        expect(new_car.full_name).to eq('2007 Volvo (unknown)')
      end
    end
  end
end
