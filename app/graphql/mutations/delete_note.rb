module Mutations
  class DeleteNote < Mutations::BaseMutation
    argument :params, Types::Input::NoteInputType, required: true

    field :note, Types::NoteType, null: false

    def resolve(params:)
      note_params = Hash params

      begin
        note = Note.find(note_params[:id])
        note.destroy!

        # The resolve method in a mutation must return a hash whose symbol matches the field name.
        { note: note }
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      end
    end
  end
end
