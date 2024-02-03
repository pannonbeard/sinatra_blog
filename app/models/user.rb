class User < Sequel::Model
  plugin :validation_helpers
  include BCrypt

  one_to_many :posts

  def validate
    super
    validates_unique(:email)
  end

  def authenticate(password_string)
    password == password_string
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end