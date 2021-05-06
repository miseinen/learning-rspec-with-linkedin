describe 'truthiness matchers' do
  it 'will match true/false' do
    expect(1 < 2).to be(true)
    expect(1 > 2).to be(false)

    expect('foo').not_to be(true) # the string is not exactly true
    expect(nil).not_to be(false) # nil is not exactly true
    expect(0).not_to be(false) # 0 is not exactly true
  end

  it 'will match truthy/falsey' do
    expect(1 < 2).to be_truthy
    expect(1 > 2).to be_falsey

    expect('foo').to be_truthy # any value counts as true
    expect(nil).to be_falsey # nil counts as false
    expect(0).not_to be_falsey # 0 is still not falsey enough
  end

  it 'will match nil' do
    expect(nil).to be_nil
    expect(nil).to be(nil)

    expect(false).not_to be(nil)
    expect(0).not_to be(nil)
  end
end