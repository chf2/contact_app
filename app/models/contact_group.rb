class ContactGroup < ActiveRecord::Base
  validates :group_name, :user_id, presence: true

  belongs_to :user
  has_many :group_memberships

  has_many :group_contacts, through: :group_memberships, source: :contact
end
