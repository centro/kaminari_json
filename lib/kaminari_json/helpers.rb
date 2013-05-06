module KaminariJSON
  module Helpers
    def json_paginate(array, options={ })
      options[:records_root]   ||= params[:controller]
      options[:page_offset]    ||= params[:page_offset] || 1
      options[:page_size]      ||= params[:page_size] || 100
      options[:total_count]    ||= array.respond_to?(:klass) ? array.klass.count : array.length
      options[:filtered_count] ||= array.length
      KaminariJSON::Pagination.new(array, options)
    end
  end
end
