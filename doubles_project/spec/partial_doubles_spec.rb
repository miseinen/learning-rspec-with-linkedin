# frozen_string_literal: true

describe 'Partial doubles' do
  it 'allow stubbing instance methods on Ruby classes' do
    time = Time.new(2007, 1, 1, 12, 0, 0)
    allow(time).to receive(:year).and_return(1800)

    expect(time.to_s).to eq('2007-01-01 12:00:00 +0200')
    expect(time.year).to eq(1800)
  end

  it 'allow stubbing instance methods on custom classes' do
    class Akita
      attr_accessor :name
    end

    akita = Akita.new
    akita.name = 'Hatiko'
    expect(akita.name).to eq('Hatiko')

    allow(akita).to receive(:name).and_return('Kiba')

    expect(akita.name).to eq('Kiba')
  end

  it 'allow stubbing class methods on Ruby classes' do
    fixed = Time.new(2007, 1, 1, 12, 0, 0)
    allow(Time).to receive(:now).and_return(fixed)

    expect(Time.now).to eq(fixed)
    expect(Time.now.to_s).to eq('2007-01-01 12:00:00 +0200')
    expect(Time.now.year).to eq(2007)
  end

  it 'allow stubbing database calls a mock object' do
    class Customer
      attr_accessor :name

      def self.find
        # database lookup, returns one object
      end
    end

    dbl = double('Mock Customer')
    allow(dbl).to receive(:name).and_return('John')

    allow(Customer).to receive(:find).and_return(dbl)

    customer = Customer.find
    expect(customer.name).to eq('John')
  end

  it 'allow stubbing database calls with many mock objects' do
    class Customer
      attr_accessor :name

      def self.all
        # database lookup, returns array of objects
      end
    end

    dbl1 = double('First Customer', name: 'John')
    dbl2 = double('Second Customer', name: 'Jane')

    allow(Customer).to receive(:all).and_return([dbl1, dbl2])

    customers = Customer.all
    expect(customers[1].name).to eq('Jane')
  end
end