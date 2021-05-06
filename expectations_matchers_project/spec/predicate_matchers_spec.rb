describe 'predicate matchers' do
  it 'will match be_* to custom methods ending with ?' do
    # drops 'be_*', adds '?' to end, calls method on object
    # can use it when methods end in '?', require no arguments
    # return true/false

    # with built-in methods
    expect([]).to be_empty # [].empty?
    expect(1).to be_integer # 1.integer?
    expect(0).to be_zero # 0.zero?
    expect(1).to be_nonzero # 1.nonzero?
    expect(1).to be_odd # 1.odd?
    expect(2).to be_even # 2.even?
    expect(nil).to be_nil # nill.nil?

    # with custom methods
    class Product
      def visible?
        true
      end
    end

    product = Product.new
    expect(product).to be_visible # product.visible?
    expect(product.visible?).to be true # exactly the same
  end

  it 'will match have_* to custom methods like has_*' do
    # changes 'have_* to 'has_*, adds '?' to end, calls method on object
    # can use it when methods start with 'has_*' and end in '?'
    # return true/false, can have arguments but not required

    # with built-in methods
    hash = { one: 1, two: 2 }
    expect(hash).to have_key(:two) # hash.has_key?
    expect(hash).to have_value(1) # hash.has_value?

    # with custom methods
    class Customer
      def has_pending_order?
        true
      end
    end

    customer = Customer.new
    expect(customer).to have_pending_order # customer.has_pending_order?
    expect(customer.has_pending_order?).to be true # the same
  end
end
