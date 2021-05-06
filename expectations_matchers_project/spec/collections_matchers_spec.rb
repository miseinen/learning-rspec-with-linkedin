describe 'collections matchers' do
  it 'will match arrays' do
    array = [1, 2, 3]

    expect(array).to include(3)
    expect(array).to include(1, 3)

    expect(array).to start_with(1)
    expect(array).to end_with(3)

    expect(array).to match_array([3, 2, 1]) # order doesn't matter
    expect(array).not_to match_array([1, 2])

    expect(array).to contain_exactly(3, 2, 1) # similar to match_array
    expect(array).not_to contain_exactly(1, 2)
  end

  it 'will match strings' do
    string = 'some string'

    expect(string).to include('str')
    expect(string).to include('me', 'ing')

    expect(string).to start_with('som')
    expect(string).to end_with('ng')
  end

  it 'will match hashes' do
    hash = { one: 1, two: 2, three: 3 }

    expect(hash).to include(:one)
    expect(hash).to include(:two, :three)

    expect(hash).to include(one: 1)
    expect(hash).to include(one: 1, two: 2)
    expect(hash).to include({ one: 1, two: 2 })

    expect(hash).not_to include(one: 2)
  end
end

