describe 'complex expectations' do
  describe 'compound expectations' do
    it 'will match using: and, &, or, |' do
      expect([1, 2, 3, 4, 5]).to start_with(1).and end_with(5)

      expect([1, 2, 3, 4, 5]).to start_with(1) & include(2)

      expect(10 * 10).to be_odd.or be > 50

      array = %w[hello world].shuffle
      expect(array.first).to eq('hello') | eq('world')
    end
  end

  describe 'composing matchers' do
    it 'will match all collection elements using matchers' do
      array = [1, 2, 3]
      expect(array).to all(be > 0)
    end

    it 'will match by sending matchers as arguments to matchers' do
      string = 'lorem ipsum'
      expect { string = 'ipsum lorem' }.to change { string }
        .from(match(/l(.+)m/)).to(match(/i(.+)m/))

      hash = { one: 1, two: 2, three: 3 }
      expect(hash).to include(one: be_odd, two: be_even, three: be_odd)
      expect(hash).to include(one: be > 0, two: be_within(1).of(3))
    end

    it 'will match using non_phrase aliases for matchers' do
      fruits = %w[apple banana orange]
      expect(fruits).to start_with(start_with('a')).and include(match(/.a.a.a/)) &
      end_with(end_with('e'))

      expect(fruits).to start_with(a_string_starting_with('a')) &
      include(a_string_matching(/.a.a.a/)) &
      end_with(a_string_ending_with('e'))

      array = [1, 2, 3]
      expect(array).to start_with(be > 0) | end_with(be_within(1).of(5))
      expect(array).to start_with(a_value > 0) | end_with(a_value_within(1).of(5))
    end
  end
end
