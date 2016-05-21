class User < ActiveRecord::Base
  has_many :posts


  def password
    @hash_word ||= BCrypt::Password.new(self.hash_word)
  end


  def password=(plain_password)
    @hash_word = BCrypt::Password.create(plain_password)
    self.hash_word = @hash_word
  end


  def authenticate(plain_password)
    self.password == plain_password
  end

end