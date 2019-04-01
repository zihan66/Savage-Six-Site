class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :FirstName, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :classyear, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format:      { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true, length: {minimum: 6}
  has_secure_password

  def self.search(search)
    users = User.none
    if search
      terms = search.gsub(/\s+/m, ' ').strip.split(" ")
      terms.each do |term|
        users = users.or(User.where('lower(lastname) = ?', term.downcase))
            .or(User.where('lower(FirstName) = ?', term.downcase))
      end
    else
      users = User.all
    end
    users
  end
end
