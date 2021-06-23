module Mutations
  class UpdateNote < Mutations::BaseMutation
    argument :params, Types::Input::NoteInputType, required: true

    field :note, Types::NoteType, null: false

    def resolve(params:)
      note_params = Hash params

      begin
        note = Note.find(note_params[:id])
        note.title = note_params[:title]
        note.body = note_params[:body]
        note.save!

        # The resolve method in a mutation must return a hash whose symbol matches the field name.
        { note: note }
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
