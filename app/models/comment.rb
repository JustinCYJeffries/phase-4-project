class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :helpme
  
    validates :comment, {presence: true}
    validates :user_id, {presence: true}
    validates :helpme_id, {presence: true}
end
