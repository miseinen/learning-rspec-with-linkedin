# frozen_string_literal: true

describe 'Doubles' do
  it 'allow stubing method' do
    dbl = double('Cat')
    allow(dbl).to receive(:meow!)
    expect(dbl).to respond_to(:meow!)
  end

  it 'allow stubing a response with a block' do
    dbl = double('Cat')
    allow(dbl).to receive(:meow!) { 'Meow!' }
    expect(dbl.meow!).to eq('Meow!')
  end

  it 'allow stubing responses with #and_return' do
    dbl = double('Cat')
    allow(dbl).to receive(:meow!).and_return('Meow!')
    expect(dbl.meow!).to eq('Meow!')
  end

  it 'allow stubing multiple methods with hash syntax' do
    dbl = double('Human')
    allow(dbl).to receive_messages(first_name: 'John', last_name: 'Doe')
    expect(dbl.first_name).to eq('John')
    expect(dbl.last_name).to eq('Doe')
  end

  it 'allow stubing with a hash argument to #double' do
    dbl = double('Human', first_name: 'John', last_name: 'Doe')
    expect(dbl.first_name).to eq('John')
    expect(dbl.last_name).to eq('Doe')
  end

  it 'allow stubing multiple responses with #and_return' do
    dbl = double('Die')
    allow(dbl).to receive(:roll).and_return(1, 2, 4, 5)
    expect(dbl.roll).to eq(1)
    expect(dbl.roll).to eq(2)
    expect(dbl.roll).to eq(4)
    expect(dbl.roll).to eq(5)
    expect(dbl.roll).to eq(5) # continues returning last value
  end
end
