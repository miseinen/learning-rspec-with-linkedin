describe 'other useful matchers' do
  it 'will match strings with a regex' do
    string = 'Lorem ipsum dolor sit amet'

    expect(string).to match(/ipsum(.+)amet/)

    expect('12345').to match(/\d{5}/)
    expect(12_345).not_to match(/\d{5}/) # only works with string

    mail = 'someone@mail.com'

    expect(mail).to match(/^\w+@\w+\.\w{2,3}$/)
  end

  it 'will match object types' do
    expect('akita').to be_instance_of(String)
    expect('akita').to be_an_instance_of(String) # alias of #be_instance_of

    expect('akita').to be_kind_of(String)
    expect('akita').to be_a_kind_of(String) # alias of #be_kind_of

    expect('akita').to be_a(String) # alias of #be_kind_of
    expect([1, 2, 4]).to be_an(Array) # alias of #be_kind_of
  end

  it 'will match objects with #respond_to' do
    string = 'siba'
    expect(string).to respond_to(:length)
    expect(string).not_to respond_to(:sort)
  end

  it 'will match class instances with #have_attributes' do
    class Car
      attr_accessor :make, :year, :color
    end

    car = Car.new
    car.make = 'Honda'
    car.year = 2007
    car.color = 'Yellow'

    expect(car).to have_attributes(make: 'Honda')
    expect(car).to have_attributes(make: 'Honda', year: 2007)
  end

  it 'will match anything with #satisfy' do
    expect(1000).to satisfy do |value|
      (value > 10) && (value < 1500) && value.even?
    end
  end
end
