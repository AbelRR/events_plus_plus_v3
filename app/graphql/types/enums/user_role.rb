module Types
  module Enums
    class UserRole < Types::BaseEnum
      description 'User Roles'

      value "admin", value: "admin"
      value "driver", value: "driver"
      value "client", value: "client"
    end
  end
end