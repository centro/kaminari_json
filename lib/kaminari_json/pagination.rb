module KaminariJSON
  class Pagination
    attr_reader :records, :options

    # records should be a ActiveModel scope (or something that behaves like a scope)
    def initialize(records, options={ })
      @records = records
      @options = options
    end

    def to_json(*args)
      records_hash.merge(pagination_hash).to_json
    end

    def records_hash
      { options[:records_root] => serialize_records }
    end

    def serialize_records
      paginated_records.active_model_serializer.new(paginated_records, options).as_json
    end

    def paginated_records
      records.page(options[:page_offset]).per(options[:page_size])
    end

    def pagination_hash
      { pagination: options.slice(:page_offset, :page_size, :total_count, :filtered_count) }
    end
  end
end
