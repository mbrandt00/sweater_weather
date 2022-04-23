class User< ApplicationRecord
    has_secure_password

    after_create :api_key 
    def api_key 
        self.apikey = SecureRandom.hex(27)
        self.save 
    end
end