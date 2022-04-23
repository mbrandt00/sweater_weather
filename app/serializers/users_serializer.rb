class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email
  attributes :api_key do |object| 
    object.apikey
  end
end
