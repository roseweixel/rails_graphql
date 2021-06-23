module Types
  class MutationType < Types::BaseObject
    field :add_note, mutation: Mutations::AddNote
    field :update_note, mutation: Mutations::UpdateNote
    field :delete_note, mutation: Mutations::DeleteNote
  end
end
