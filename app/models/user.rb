class User < ActiveRecord::Base
  before_create {self.remember_token = create_encrypted_token}
  has_secure_password

    def User.create_encrypted_token
      token = SecureRandom.urlsafe_base64
      Digest::SHA1.hexdigest(token.to_s)
    end
end
