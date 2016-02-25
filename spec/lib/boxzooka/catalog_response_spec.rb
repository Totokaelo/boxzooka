require 'spec_helper'

describe Boxzooka::CatalogResponse do
  let(:xml_file_path)             { File.join(File.dirname(__FILE__), '../../files/catalog_response.xml') }
  let(:catalog_response_xml)      { File.read(xml_file_path) }
  let(:catalog_response_fragment) { catalog_response_xml.split("\n")[1..-1].join("\n") }

  describe 'deserialization' do
    subject { Boxzooka::Xml.deserialize(catalog_response_fragment, described_class) }

    it 'should map items' do
      expect(subject.results.length).to eq(2)

      expect(subject.results[0].status).to eq('Success')
      expect(subject.results[1].error_message).to eq('Missing ItemName field.')
    end
  end
end
