class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :user_passed_tests, dependent: :nullify
  has_many :users, through: :user_passed_tests

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(title){ joins(:category).where(categories: { title: title }) }

  def self.by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
