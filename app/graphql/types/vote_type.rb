module Types
  class VoteType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    # field :user, Types::UserType, null: false, resolve: ->(vote, args, ctx) {
    #   RecordLoader.for(User).load(vote.user_id)
    # }
    field :link, Types::LinkType, null: false
    # field :link, Types::LinkType, null: false, resolve: ->(vote, args, ctx) {
    #   RecordLoader.for(Link).load(vote.link_id)
    # }
  end
end
