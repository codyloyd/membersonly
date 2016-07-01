class User < ActiveRecord::Base
  before_create {self.remember_token = self.create_encrypted_token}
  has_secure_password
  has_many :posts

    def create_encrypted_token
      token = SecureRandom.urlsafe_base64
      Digest::SHA1.hexdigest(token.to_s)
    end
end
