# made it basic and reusable
class RecordLoader < GraphQL::Batch::Loader
    def initialize(model)
      @model = model
    end

    def perform(keys)
      @model.where(id: keys).each { |record| fulfill(record.id, record) }
      keys.each { |key| fulfill(key, nil) unless fulfilled?(key) }
    end
  end
