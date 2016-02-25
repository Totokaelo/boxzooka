require 'spec_helper'

describe Boxzooka::Item do
  let(:item) { described_class.new(ucc: ucc) }
  let(:ucc) { 12345678 }

  describe 'serialization' do
    subject { Boxzooka::Xml.serialize(item) }

    it 'should capitalize UCC' do
      expect(subject).to include("<UCC>#{ucc}</UCC>")
    end
  end
end
