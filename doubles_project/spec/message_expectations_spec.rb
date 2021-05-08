# frozen_string_literal: true

describe 'Message expectations' do
  it 'expects a call and allows a response' do
    dbl = double('Cat')
    # omit 'allow' block
    expect(dbl).to receive(:meow!).and_return('Meow')
    dbl.meow!
  end

  it 'does not matter which order' do
    dbl = double('Multi-step Process')

    expect(dbl).to receive(:step1)
    expect(dbl).to receive(:step2)

    dbl.step2
    dbl.step1
  end

  it 'works with #ordered when order matters' do
    dbl = double('Multi-step Process')

    expect(dbl).to receive(:step1).ordered
    expect(dbl).to receive(:step2).ordered

    dbl.step1
    dbl.step2
    end
end
