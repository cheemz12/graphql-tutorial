require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
  # Define LinkFilter outside of LinksSearch for clarity and to avoid any scope issues.
  class LinkFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :description_contains, String, required: false
    argument :url_contains, String, required: false
  end

  class LinksSearch
    include SearchObject.module(:graphql)

    # scope is starting point for search
    scope { Link.includes(:user, :votes) }

    # Specify the return type of the search
    type types[Types::LinkType]

    # Define search options
    option :filter, type: LinkFilter, with: :apply_filter
    option :first, type: types.Int, with: :apply_first
    option :skip, type: types.Int, with: :apply_skip

    # Implement the methods used for searching
    def apply_first(scope, value)
      scope.limit(value)
    end

    def apply_skip(scope, value)
      scope.offset(value)
    end

    # Implement the filter application method
    def apply_filter(scope, value)
      # Implementation of filtering logic
      # For simplicity, the detailed implementation is omitted
      # You should implement the logic as per your application's requirements
    end

    # Helper method to normalize and apply filters
    def normalize_filters(value, branches = [])
      # Implement the normalization logic
      # For simplicity, the detailed implementation is omitted
    end
  end
end
