# frozen_string_literal: true

describe 'Spying abilities' do
  it 'can expect a call after it received' do
    dbl = spy('Cat')
    allow(dbl).to receive(:meow!).and_return('Meow')
    dbl.meow!
    expect(dbl).to have_received(:meow!)
  end

  it 'can use message constraints' do
    dbl = spy('Cat')
    allow(dbl).to receive(:meow!).and_return('Meow')
    dbl.meow!
    dbl.meow!
    dbl.meow!
    expect(dbl).to have_received(:meow!).with(no_args).exactly(3).times
  end

  it 'can expect any message already sent to a declared spy' do
    customer = spy('Customer')
    # don't need to stub :send_invoice
    # allow(customer).to receive(:send_invoice)cu
    customer.send_invoice
    expect(customer).to have_received(:send_invoice)
  end

  it 'can expect only allowed messages on partial doubles' do
    class Customer
      attr_accessor :name

      def send_invoice
        true
      end
    end

    customer = Customer.new
    # must stub :send_invoice to start spying
    allow(customer).to receive(:send_invoice)
    customer.send_invoice
    expect(customer).to have_received(:send_invoice)
  end

  context 'using let and a before hook' do
    let(:order) do
      spy('Order', process_line_items: nil,
                   charge_credit_card: true,
                   send_confirmation_email: true)
    end

    before(:example) do
      order.process_line_items
      order.charge_credit_card
      order.send_confirmation_email
    end

    it 'calls #process_line_items on the order' do
      expect(order).to have_received(:process_line_items)
    end

    it 'calls #charge_credit_card on the order' do
      expect(order).to have_received(:charge_credit_card)
    end

    it 'calls #send_confirmation_email on the order' do
      expect(order).to have_received(:send_confirmation_email)
    end
  end
end
