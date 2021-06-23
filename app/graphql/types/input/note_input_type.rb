module Types
  module Input
    class NoteInputType < Types::BaseInputObject
      argument :title, String, required: false
      argument :body, String, required: false
      argument :id, ID, required: false
    end
  end
end
