## Equivalence matchers

**Examples:**

x = 1

x == 1   _#true_
x == 1.0 _#true_
x == '1' _#false_


x.eql?(1)   _#true_
x.eql?(1.0) _#false_
x.eql?('1') _#false_

x = 'Lynda'

x == 'Lynda'      _#true_
x.eql?('Lynda')   _#true_
x.equal?('Lynda') _#false_ <= object_id comparison

expect(x).to eq(1)     _#x == 1_
expect(x).to be == 1   _#x == 1_

expect(x).to eql(1)    _#x.eql?(1)_

expect(x).to equal(1)  _#x.equal?(1)_
expect(x).to be(1)     _#x.equal?(1)_

