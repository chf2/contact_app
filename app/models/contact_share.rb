class ContactShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
end
