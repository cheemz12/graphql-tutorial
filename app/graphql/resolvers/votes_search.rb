require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
  class VotesSearch
    include SearchObject.module(:graphql)

    # # scope is starting point for search
    scope { Vote.all }

    # Specify the return type of the search
    type types[Types::VoteType]

  end
end
