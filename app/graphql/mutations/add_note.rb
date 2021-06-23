module Mutations
  class AddNote < Mutations::BaseMutation
    argument :params, Types::Input::NoteInputType, required: true

    field :note, Types::NoteType, null: false

    def resolve(params:)
      note_params = Hash params

      begin
        note = Note.create!(note_params)

        # The resolve method in a mutation must return a hash whose symbol matches the field name.
        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
