# frozen_string_literal: true

describe 'Message count constraints' do
  it 'allows contraints on message count' do
    class Cart
      def initialize
        @items = []
      end

      def add_item(id)
        @items << id
      end

      def restock_item(id)
        @items.delete(id)
      end

      def empty
        @items.each { |id| restock_item(id) }
      end
    end

    cart = Cart.new
    cart.add_item(1)
    cart.add_item(2)

    expect(cart).to receive(:restock_item).twice
    cart.empty
  end

  it 'allows using at_leat/at_most' do
    post = double('BlogPost')
    expect(post).to receive(:like).at_least(3).times
    post.like(user: 'John')
    post.like(user: 'Jane')
    post.like(user: 'Akira')
    post.like(user: 'Yukiko')
  end
end
