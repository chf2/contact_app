# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "carl")
User.create(username: "charles")
User.create(username: "kevin")

Contact.create(name: "dave", email: "dave@google.com", user_id: 1)
Contact.create(name: "bob", email: "bob@google.com", user_id: 1)
Contact.create(name: "jim", email: "jim@google.com", user_id: 2)
Contact.create(name: "oscar", email: "oscar@google.com", user_id: 2)
Contact.create(name: "cj", email: "cj@google.com", user_id: 3)

# favorited
Contact.create(name: "andrew", email: "andrew@google.com", user_id: 1, favorite: true)
Contact.create(name: "jane", email: "jane@google.com", user_id: 1, favorite: true)
Contact.create(name: "daniel", email: "daniel@google.com", user_id: 1, favorite: true)
Contact.create(name: "laird", email: "laird@google.com", user_id: 1, favorite: true)


ContactShare.create(user_id: 1, contact_id: 3)
ContactShare.create(user_id: 1, contact_id: 4)
ContactShare.create(user_id: 1, contact_id: 5)
ContactShare.create(user_id: 3, contact_id: 1)
ContactShare.create(user_id: 3, contact_id: 2)
ContactShare.create(user_id: 3, contact_id: 3)

Comment.create(commentable_id: 1, commenter_id: 2,
                body: "test comment", commentable_type: "User")


ContactGroup.create(user_id: 3, group_name: "Besties")
GroupMembership.create(contact_group_id: 1, contact_id: 5)
GroupMembership.create(contact_group_id: 1, contact_id: 2)
GroupMembership.create(contact_group_id: 1, contact_id: 3)
