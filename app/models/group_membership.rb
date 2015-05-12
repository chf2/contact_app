class GroupMembership < ActiveRecord::Base
  validates :contact_id, :contact_group_id, presence: true
  validate :user_has_the_contact

  belongs_to :contact
  belongs_to :contact_group

  def user_has_the_contact
    contact_group = ContactGroup.find(self.contact_group_id)
    user = User.find(contact_group.user_id)
    unless user.all_contacts.include?(Contact.find(self.contact_id))
      errors[:contact_id] << "Can't add someone who is not a contact"
    end
  end
end
