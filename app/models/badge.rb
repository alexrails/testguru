class Badge < ApplicationRecord
  enum rule: { category_complete: 1, level_complete: 2, first_try: 3 }
  has_many :user_badges
  has_many :users, through: :user_badges
end
