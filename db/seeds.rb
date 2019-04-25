# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.where(email: 'admin@admin.admin')
if user
  user.update_all(email: 'admin@admin.admin',
                  admin: true,
                  password_digest: BCrypt::Password.create("admin1"),
                  FirstName: "Admin",
                  lastname: "Admin",
                  major: "Admin",
                  classyear: DateTime.current,
                  military: "Admin",
                  activated: true,
                  activated_at: Time.zone.now)
else
  User.create!(email: 'admin@admin.admin',
               password: 'admin1',
               password_confirmation: 'admin1',
               admin: true,
               FirstName: "Admin",
               lastname: "Admin",
               major: "Admin",
               classyear: DateTime.current,
               military: "Admin",
               activated: true,
               activated_at: Time.zone.now)
end