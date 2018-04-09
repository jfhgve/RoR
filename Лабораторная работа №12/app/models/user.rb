class User < ApplicationRecord
  before_create :create_remember_token
  before_save { self.login = login.downcase }
  validates :login, presence: true
  validates :password, presence: true, length: { minimum: 6 },
                       uniqueness: { case_sensitive: true }
  has_secure_password

  before_create :create_remember_token
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
