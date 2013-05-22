require 'spec_helper'

describe KaminariJSON::Pagination do
  describe '#paginated_records' do
    it "calls pagination for options" do
      records = [1,2,3,4,5]
      paginator = KaminariJSON::Pagination.new(records, {page_offset: 2, page_size: 3})
      expect(paginator.paginated_records).to eq([4,5])
    end
  end

  describe '#pagination_hash' do
    let(:options) {
      { dont_use: 4, page_offset: 28, page_size: 92, total_count: 665, filtered_count: 20 }
    }
    let(:paginator) { KaminariJSON::Pagination.new([], options) }

    it "returns a hash" do
      expect(paginator.pagination_hash).to be_instance_of(Hash)
    end
    it "should look right" do
      expected = { page_offset: 28, page_size: 92, total_count: 665, filtered_count: 20 }
      expect(paginator.pagination_hash[:pagination]).to eq(expected)
    end
  end

  describe "#to_json" do
    let(:paginator) { KaminariJSON::Pagination.new([], {}) }
    before do
      records_hash = { records_root: "some json" }
      pagination_hash = {pagination: {page_offset: 1, page_size: 25, total_count: 100, filtered_count: 42}}
      paginator.stub(:records_hash) { records_hash }
      paginator.stub(:pagination_hash) { pagination_hash }
    end

    it "merges records hash with pagination hash" do
      expect(paginator.to_json).to match(/"records_root"/)
    end
    it "calls to_json results" do
      expect(paginator.to_json).to match(/"pagination"/)
    end
  end

  describe '#records_hash' do
    let(:paginator) { KaminariJSON::Pagination.new([], {records_root: 'foobar'}) }
    before { paginator.stub(:serialize_records) {'serialized'} }

    it "key is the records_root" do
      expect(paginator.records_hash).to have_key('foobar')
    end
    it "value is the serialized_records" do
      expect(paginator.records_hash['foobar']).to eq('serialized')
    end
  end
end
