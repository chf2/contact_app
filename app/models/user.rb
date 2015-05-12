class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts
  has_many :contact_shares
  has_many :shared_contacts, through: :contact_shares, source: :contact

  has_many :comments, as: :commentable
  has_many :posted_comments, class_name: "Comment", foreign_key: :commenter_id

  has_many :contact_groups

  def favorite_contacts
    contacts.where(favorite: true).concat(
       Contact.find(contact_shares
              .where(favorite:true, user_id: id)
              .map(&:contact_id)))
  end

  def all_contacts
    contacts.concat(shared_contacts)
  end
end
