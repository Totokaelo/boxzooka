require 'spec_helper'

describe Boxzooka::CustomerAccess do
  let(:customer_id) { 'abc123' }
  let(:customer_key) { 'zzzzzz' }
  let(:customer_access) {
    described_class.new(customer_id: customer_id, customer_key: customer_key)
  }

  let(:serialized_xml) {
    "<CustomerAccess>\n"                              \
    "  <CustomerID>#{customer_id}</CustomerID>\n"     \
    "  <CustomerKey>#{customer_key}</CustomerKey>\n"  \
    "</CustomerAccess>"
  }

  describe 'keyword initialization' do
    subject { customer_access }

    it 'should map' do
      expect(subject.customer_id).to be(customer_id)
      expect(subject.customer_key).to be(customer_key)
    end
  end

  describe 'xml serialization' do
    subject { Boxzooka::Xml.serialize(customer_access) }

    it 'should not raise error' do
      expect { subject }.to_not raise_error
    end

    it 'should serialize' do
      # Ox seems to wrap the XML in "\n", does this matter?
      expect(subject.strip).to eq(serialized_xml)
    end
  end

  describe 'xml deserialization' do
    subject { Boxzooka::Xml.deserialize(serialized_xml, described_class) }

    it 'should not raise error' do
      expect { subject }.to_not raise_error
    end

    it 'should deserialize correctly' do
      expect(subject.customer_id).to eq(customer_id)
      expect(subject.customer_key).to eq(customer_key)
    end
  end
end
