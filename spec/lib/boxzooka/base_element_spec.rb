require 'spec_helper'

describe Boxzooka::BaseElement do
  class DerivedClass < described_class
    field :simple
  end

  let(:text) { 'hello' }
  let(:simple_instance) { DerivedClass.new(simple: text) }
  let(:simple_xml) {
    "<DerivedClass>" \
      "<Simple>hello</Simple>" \
    "</DerivedClass>"
  }

  describe 'simple xml serialization' do
    subject { Boxzooka::Xml.serialize(simple_instance) }

    it 'should serialize simple elements' do
      expect(subject).to include("<Simple>hello</Simple>")
    end
  end

  describe 'simple xml deserialization' do
    subject { Boxzooka::Xml.deserialize(simple_xml, DerivedClass) }

    it 'should serialize simple elements' do
      expect(subject.simple).to eq(text)
    end
  end

  class ComplexDerivedClass < described_class
    entity :entity,
      type: DerivedClass

    collection :declared_array,
      entry_type: :simple,
      entry_node_name: 'ArrayEntry'

    collection :undeclared_array,
      flat: true,
      entry_type: :simple,
      entry_node_name: 'UndeclaredArrayEntry'

    collection :entities,
      entry_type: DerivedClass,
      entry_node_name: 'DerivedClass'
  end

  let(:complex_xml) {
    "<ComplexDerivedClass>" \
    "<DerivedClass><Simple>hello</Simple></DerivedClass>" \
    "<DeclaredArray>" \
    "<ArrayEntry>10</ArrayEntry>" \
    "<ArrayEntry>15</ArrayEntry>" \
    "</DeclaredArray>" \
    "<UndeclaredArrayEntry>a</UndeclaredArrayEntry>" \
    "<UndeclaredArrayEntry>b</UndeclaredArrayEntry>" \
    "<Entities>" \
    "<DerivedClass><Simple>hello array</Simple></DerivedClass>" \
    "</Entities>" \
    "</ComplexDerivedClass>"
  }

  let(:complex_instance) {
    ComplexDerivedClass.new(
      entity: simple_instance,
      declared_array: [10, 15],
      undeclared_array: ['a', 'b'],
      entities: [
        DerivedClass.new(simple: 'hello array')
      ]
    )
  }

  describe 'complex xml serialization' do
    subject { Boxzooka::Xml.serialize(complex_instance) }

    it 'should match hand-written XML' do
      puts subject

      expect(Ox.parse(subject)).to eq(Ox.parse(complex_xml))
    end
  end

  describe 'complex xml deserialization' do
    subject { Boxzooka::Xml.deserialize(complex_xml, ComplexDerivedClass) }

    it 'should deserialize correctly' do
      expect(subject).to eq(complex_instance)
    end
  end
end
