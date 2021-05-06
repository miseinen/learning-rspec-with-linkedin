## Equivalence matchers

**Examples:**
<pre>
x = 1

x == 1     <i>#true</i>
x == 1.0   <i>#true</i>
x == '1'   <i>#false</i>


x.eql?(1)     <i>#true</i>
x.eql?(1.0)   <i>#false</i>
x.eql?('1')   <i>#false</i>


x == 'Lynda'          <i>#true</i>

x.eql?('Lynda')       <i>#true</i>
x.equal?('Lynda')     <i>#false</i>    <= object_id comparison 

expect(x).to eq(1)      <i>#x == 1</i>
expect(x).to be == 1    <i>#x == 1</i>

expect(x).to eql(1)    <i>#x.eql?(1)</i>

expect(x).to equal(1)  <i>#x.equal?(1)</i>
expect(x).to be(1)     <i>#x.equal?(1)</i> 
</pre>
