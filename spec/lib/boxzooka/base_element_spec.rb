require 'spec_helper'

describe Boxzooka::BaseElement do
  FieldTypes = described_class::FieldTypes
  ScalarTypes = described_class::ScalarTypes

  class DerivedClass < described_class
    scalar :simple
    scalar :number, type: ScalarTypes::INTEGER
  end

  let(:text) { 'hello' }
  let(:number) { (rand * 100).floor }
  let(:simple_instance) { DerivedClass.new(simple: text, number: number) }
  let(:simple_xml) {
    "<DerivedClass>" \
      "<Simple>hello</Simple>" \
      "<Number>#{number}</Number>" \
    "</DerivedClass>"
  }

  describe 'inherited fields' do
    class DerivedClass2 < DerivedClass
    end

    let(:child_instance) { DerivedClass2.new(simple: text) }
    let(:child_xml) { "<DerivedClass2><Simple>#{text}</Simple></DerivedClass2>" }

    describe 'field names' do
      it 'should include fields from parent classes' do
        expect(DerivedClass2.field_names).to eq([:simple, :number])
      end
    end

    describe 'constructor' do
      subject { child_instance }
      it      { expect(subject.simple).to eq(text) }
    end

    describe 'serialization' do
      subject { Boxzooka::Xml.serialize(child_instance) }
      it      { expect(Ox.parse(subject)).to eq(Ox.parse(child_xml)) }
    end

    describe 'deserialization' do
      subject { Boxzooka::Xml.deserialize(child_xml, DerivedClass2) }
      it      { expect(subject).to eq(child_instance) }
    end
  end

  describe 'arbitrary node name' do
    let(:weird_value) { 'weird' }

    class Weird < described_class
      scalar :weird, node_name: 'NonStandard'
    end

    let(:instance) { Weird.new(weird: weird_value) }
    let(:weird_xml) { "<Weird><NonStandard>#{weird_value}</NonStandard></Weird>" }

    describe 'serialization' do
      subject { Boxzooka::Xml.serialize(instance) }
      it { expect(Ox.parse(subject)).to eq(Ox.parse(weird_xml)) }
    end

    describe 'deserialization' do
      subject { Boxzooka::Xml.serialize(instance) }
      it { expect(Ox.parse(subject)).to eq(Ox.parse(weird_xml)) }
    end
  end

  describe 'simple xml serialization' do
    subject { Boxzooka::Xml.serialize(simple_instance) }

    it 'should serialize simple elements' do
      expect(subject).to include("<Simple>hello</Simple>")
      expect(subject).to include("<Number>#{number}</Number>")
    end
  end

  describe 'simple xml deserialization' do
    subject { Boxzooka::Xml.deserialize(simple_xml, DerivedClass) }

    it 'should serialize simple elements' do
      expect(subject.simple).to eq(text)
      expect(subject.number).to eq(number)
    end
  end

  class ComplexDerivedClass < described_class
    entity :entity,
      type: DerivedClass

    collection :declared_array,
      entry_field_type: FieldTypes::SCALAR,
      entry_type:       ScalarTypes::INTEGER,
      entry_node_name: 'ArrayEntry'

    collection :float_array,
      entry_field_type: FieldTypes::SCALAR,
      entry_type:       ScalarTypes::DECIMAL,
      entry_node_name: 'Float'

    collection :undeclared_array,
      flat: true,
      entry_field_type: FieldTypes::SCALAR,
      entry_type:       ScalarTypes::STRING,
      entry_node_name: 'UndeclaredArrayEntry'

    collection :entities,
      entry_field_type: FieldTypes::ENTITY,
      entry_type: DerivedClass,
      entry_node_name: 'DerivedClass'
  end

  let(:complex_xml) {
    "<ComplexDerivedClass>" \
    "<Entity><Simple>hello</Simple><Number>#{number}</Number></Entity>" \
    "<DeclaredArray>" \
    "<ArrayEntry>10</ArrayEntry>" \
    "<ArrayEntry>15</ArrayEntry>" \
    "</DeclaredArray>" \
    "<FloatArray>" \
    "<Float>1.5</Float>" \
    "<Float>2.6</Float>" \
    "</FloatArray>" \
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
      float_array: [1.5, 2.6],
      undeclared_array: ['a', 'b'],
      entities: [
        DerivedClass.new(simple: 'hello array')
      ]
    )
  }

  describe 'complex xml serialization' do
    subject { Boxzooka::Xml.serialize(complex_instance) }

    it 'should match hand-written XML' do
      expect(Ox.dump(Ox.parse(subject))).to eq(Ox.dump(Ox.parse(complex_xml)))
    end
  end

  describe 'complex xml deserialization' do
    subject { Boxzooka::Xml.deserialize(complex_xml, ComplexDerivedClass) }

    it 'should deserialize properly' do
      expect(subject).to eq(complex_instance)
    end
  end
end
