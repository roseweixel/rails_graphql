module Types
  module Input
    class NoteInputType < Types::BaseInputObject
      argument :title, String, required: true
      argument :body, String, required: true
      argument :id, ID, required: false
    end
  end
end
