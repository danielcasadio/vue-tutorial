class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true
  belongs_to :user

  validates :user_id, uniqueness: {scope: [:favoritable_type, :favoritable_id],
  message: 'Can only favorite one time per movie/episode'}
end
