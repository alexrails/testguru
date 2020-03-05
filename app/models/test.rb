class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests

  def self.by_category(title)
    joins(:category).where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end
