class Comment < ActiveRecord::Base
  validates :commentable_id, :body, :commenter_id, :commentable_type, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User"
end
