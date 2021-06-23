module Queries
  class FetchNote < Queries::BaseQuery
    type Types::NoteType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Note.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Note does not exist.')
    end
  end
end
