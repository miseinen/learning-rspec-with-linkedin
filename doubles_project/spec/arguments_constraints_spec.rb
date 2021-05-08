# frozen_string_literal: true

describe 'Arguments constraints' do
  it 'expects arguments will match' do
    dbl = double('Customer List')
    expect(dbl).to receive(:sort).with('name')
    dbl.sort('name')
  end

  it 'passes when any arguments are allowed' do
    dbl = double('Customer List')
    # the default if you don't use #with
    expect(dbl).to receive(:sort).with(any_args)
    dbl.sort('name')
  end

  it 'works the same with multiple arguments' do
    dbl = double('Customer List')
    expect(dbl).to receive(:sort).with('name', 'asc', true)
    dbl.sort('name', 'asc', true)
  end

  it 'allows constraining only some arguments' do
    dbl = double('Customer List')
    expect(dbl).to receive(:sort).with('name', anything, anything)
    dbl.sort('name', 'asc', true)
  end

  it 'allows using other matchers' do
    dbl = double('Customer List')
    expect(dbl).to receive(:sort).with(
      a_string_starting_with('n'),
      an_object_equal_to('asc') | an_object_equal_to('desc'),
      boolean
    )
    dbl.sort('name', 'asc', true)
  end
end
