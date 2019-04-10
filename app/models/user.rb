class User < ApplicationRecord
  attr_accessor :reset_token
  before_save {self.email = email.downcase}
  validates :FirstName, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :classyear, presence: true
  validates :major, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format:      { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}, confirmation: true, :if => :password_digest_changed?
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def self.search(search)
    users = User.none
    if search
      terms = search.gsub(/\s+/m, ' ').strip.split(" ")
      terms.each do |term|
        users = users.or(User.where('lower(lastname) = ?', term.downcase))
        users = users.or(User.where('lower(FirstName) = ?', term.downcase))

        users = users.or(User.where('lower(city) Like ?', "% " + term.downcase + " %"))
        users = users.or(User.where('lower(city) Like ?', term.downcase))
        users = users.or(User.where('lower(city) Like ?', term.downcase + " %"))
        users = users.or(User.where('lower(city) Like ?', "% " + term.downcase))

        users = users.or(User.where('lower(state) Like ?', "% " + term.downcase + " %"))
        users = users.or(User.where('lower(state) Like ?', term.downcase))
        users = users.or(User.where('lower(state) Like ?', term.downcase + " %"))
        users = users.or(User.where('lower(state) Like ?', "% " + term.downcase))

        users = users.or(User.where('lower(major) Like ?', "% " + term.downcase + " %"))
        users = users.or(User.where('lower(major) Like ?', term.downcase))
        users = users.or(User.where('lower(major) Like ?', term.downcase + " %"))
        users = users.or(User.where('lower(major) Like ?', "% " + term.downcase))

        users = users.or(User.where('lower(occupation) Like ?', "% " + term.downcase + " %"))
        users = users.or(User.where('lower(occupation) Like ?', term.downcase))
        users = users.or(User.where('lower(occupation) Like ?', term.downcase + " %"))
        users = users.or(User.where('lower(occupation) Like ?', "% " + term.downcase))

        users = users.or(User.where('lower(military) Like ?', "% " + term.downcase + " %"))
        users = users.or(User.where('lower(military) Like ?', term.downcase))
        users = users.or(User.where('lower(military) Like ?', term.downcase + " %"))
        users = users.or(User.where('lower(military) Like ?', "% " + term.downcase))


      end
    else
      users = User.all
    end
    users
  end
end
