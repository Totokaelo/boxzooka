require 'spec_helper'

describe Boxzooka::ListRequest do
  before(:all) do
    class DerivedClass < described_class
      filter :a_simple_filter
      filter :another_filter, node_name: 'AnotherFilterTwo'
    end
  end

  describe 'filter definition and construction' do
    let(:simple_filter_value) { 'ABC' }
    let(:another_filter_value) { 'DEF' }
    let(:skip_count) { (rand * 10).floor }

    subject {
      DerivedClass.new_with_filters(
        skip_count: skip_count,

        filters: {
          a_simple_filter: simple_filter_value,
          another_filter: another_filter_value
        }
      )
    }

    it 'should pass other arguments through' do
      expect(subject.skip_count).to be(skip_count)
    end

    it 'should set simple filters' do
      simple_list_filter = Boxzooka::ListFilter.new(
        filter_type: 'ASimpleFilter',
        filter_value: simple_filter_value
      )

      expect(subject.filters).to include(simple_list_filter)
    end

    it 'should apply node name where defined' do
      another_list_filter = Boxzooka::ListFilter.new(
        filter_type: 'AnotherFilterTwo',
        filter_value: another_filter_value
      )

      expect(subject.filters).to include(another_list_filter)
    end
  end
end
