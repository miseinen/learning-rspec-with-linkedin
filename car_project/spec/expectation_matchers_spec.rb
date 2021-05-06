describe 'Expectation Matchers' do
  describe 'equivalence matchers' do
    it 'will match loose equality with #eq' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to eq(b)
      expect(a).to be == b # synonym for #eq

      c = 17
      d = 17.0
      expect(c).to eq(d) # different type, but 'close enough'
    end

    it 'will match value equality with #eql' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to eql(b) # just a little stricter

      c = 17
      d = 17.0
      expect(c).not_to eql(d) # not the same, close doesn't count
    end

    it 'will match identity equality with #equal' do
      a = '2 cats'
      b = '2 cats'
      expect(a).not_to equal(b) # same value, but different objects

      c = b
      expect(c).to equal(b) # same objects
      expect(c).to be(b) # synonym for #equal
    end
  end
end