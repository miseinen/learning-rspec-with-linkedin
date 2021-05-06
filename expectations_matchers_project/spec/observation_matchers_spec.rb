describe 'other useful matchers' do
  # all of these use 'expect {}', not 'expect()
  # it is a special block format that allows a process to take place inside of the expectation
  it 'will match when events change object attributes' do
    # calls the test before the block
    # then again after block
    array = []
    expect { array << 1 }.to change(array, :empty?).from(true).to(false)

    class WebSiteHits
      attr_accessor :count

      def initialize
        @count = 0
      end

      def increment
        @count += 1
      end
    end

    hits = WebSiteHits.new
    expect { hits.increment }.to change(hits, :count).from(0).to(1)
  end

  it 'will match when events change any values' do
    # calls the test before the block
    # then again after block
    # must have a value before the block and change value inside the block

    # '{}' can be used after 'change' on simple variables
    # '{}' after 'change' used for 'dinamic variable'
    x = 1
    expect { x += 1 }.to change { x }.from(1).to(2)
    expect { x += 1 }.to change { x }.by(1)
    expect { x += 1 }.to change { x }.by_at_least(1)
    expect { x += 1 }.to change { x }.by_at_most(1)

    # '{}' after 'change' can contain any block of code
    y = 1
    expect { y += 1 }.to change { y % 2 }.from(1).to(0)
  end

  it 'will match when errors are raised' do
    # observes any error raised by the block

    expect { raise StandardError }.to raise_error # risks false positives
    expect { raise StandardError }.to raise_exception # risks false positives

    expect { 1 / 0 }.to raise_error(ZeroDivisionError)
    expect { 1 / 0 }.to raise_error.with_message('divided by 0')
    expect { 1 / 0 }.to raise_error.with_message(/divided/)

    # negative form does not accept arguments
    expect { 1 / 2 }.not_to raise_error
  end

  it 'will match when output is generated' do
    # observes output sent to #stdout or #stderr
    expect { print 'hello' }.to output.to_stdout
    expect { print 'hello' }.to output('hello').to_stdout
    expect { print 'hello' }.to output(/h(.){4}/).to_stdout

    expect { warn 'problem' }.to output(/problem/).to_stderr
  end
end
