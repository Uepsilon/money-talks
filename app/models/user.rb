class User < ActiveRecord::Base
  # sorcery
  authenticates_with_sorcery!

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :pb_id, presence: true
  validates :pb_pw, presence: true
end
