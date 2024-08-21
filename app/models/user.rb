class User < ApplicationRecord
  enum role: { buyer: 0, manufacturer: 1 }

  validates :email, format: { with: /\A[\w+\-.]+@karazin\.ua\z/i }, if: :manufacturer?

  def manufacturer?
    role == "manufacturer"
  end
  has_one :profile, dependent: :destroy
  has_one :bucket, dependent: :destroy

  after_create :build_default_profile, if: :manufacturer?
  after_create :build_bucket, if: :buyer?


  private

  def build_default_profile_and_bucket
    create_profile(bio: "Default bio")
    create_bucket
  end




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
