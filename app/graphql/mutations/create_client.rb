module Mutations
  class CreateClient < BaseMutation
    argument :name, String, required: true
    argument :phone_number, String, required: true
    argument :email, String, required: false
    argument :address, String, required: true

    type Types::UserType

    def resolve(**attributes)
      User.create!(attributes.merge user_role: 'client')
    end
  end
end