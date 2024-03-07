module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, resolver: Resolvers::LinksSearch
    field :all_votes, resolver: Resolvers::VotesSearch

    # this method is invoked, when `all_link` fields is being resolved
    def all_links
      Link.all
    end
    # this method is invoked, when `all_votes` fields is being resolved
    def all_votes
      Link.all
    end
  end
end
