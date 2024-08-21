class Profile < ApplicationRecord
  belongs_to :user

  validates :bio, presence: true, if: :manufacturer?

  def manufacturer?
    user.manufacturer?
  end
end
