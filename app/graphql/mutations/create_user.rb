module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :phone_number, String, required: true
    argument :email, String, required: false
    argument :address, String, required: false

    type Types::UserType

    def resolve(**attributes)
      User.create!(attributes)
    end
  end
end