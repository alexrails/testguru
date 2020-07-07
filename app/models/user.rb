class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests
  has_many :author_tests, class_name: "Test"
  has_many :gists
  has_many :feedbacks

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 80 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  def test_passage(level)
    tests.where(level: level)
  end

  def user_passed_test(test)
    user_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
 end
