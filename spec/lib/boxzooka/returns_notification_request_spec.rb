require 'spec_helper'

describe Boxzooka::ReturnsNotificationRequest do
  let(:return_notification_item) {
    Boxzooka::ReturnNotificationItem.new(
      sku: 'ABC123',
      quantity: 1,
      reason: 'Didnt fit',
      directive: 'Return to inventory'
    )
  }

  let(:return_notification) {
    Boxzooka::ReturnNotification.new(
      order_id: 'TKTEST00001',
      return_date: DateTime.new(2016, 02, 20),
      rma: 'TKTEST00001-R',
      return_tracking: 'ABZ0123456',
      return_carrier: 'Fedex',
      notes: 'Didnt fit',

      items: [return_notification_item]
    )
  }

  let(:instance) {
    described_class.new(
      customer_access: Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc'),
      returns: [return_notification]
    )
  }

  describe 'XML serialization' do
    let(:xml) { Boxzooka::Xml.serialize(instance) }
    it { puts Ox.dump(Ox.parse(xml)) }
  end
end

