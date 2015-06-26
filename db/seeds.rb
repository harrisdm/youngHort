# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create! :email => 'admin1@yh.com', :password => '12345678', :password_confirmation => '12345678'
u2 = User.create! :email => 'admin2@yh.com', :password => '12345678', :password_confirmation => '12345678'
u3 = User.create! :email => 'user1@yh.com', :password => '12345678', :password_confirmation => '12345678'
u4 = User.create! :email => 'user2@yh.com', :password => '12345678', :password_confirmation => '12345678'

p1 = Profile.create(user_id: 1, name: "admin 1", age: 25, place_of_study: "N/A", course_of_study: "N/A", admin: true)
p2 = Profile.create(user_id: 2, name: "admin 2", age: 24, place_of_study: "N/A", course_of_study: "N/A", admin: true)
p3 = Profile.create(user_id: 3, name: "user 1", age: 17, place_of_study: "UNSW", course_of_study: "Lawn Mowing")
p4 = Profile.create(user_id: 4, name: "user 2", age: 18, place_of_study: "School", course_of_study: "Box Gardens")

m1 = Mentor.create(name: "Martha" , link: "www.google.com", bio: "blah")
m2 = Mentor.create(name: "Gretle" , link: "www.apple.com", bio: "blah blah")
m3 = Mentor.create(name: "Tomlin" , link: "www.microsoft.com", bio: "blah blah blah")
m4 = Mentor.create(name: "Bobby", link: "www.yahoo.com", bio: "blah blah blah blah")
m5 = Mentor.create(name: "Archibald" , link: "www.agar.io", bio: "blah blah blah blah blah")

pst1 = Post.create(user_id: 1, title: "How cool are we", content: "This is like the most amazing site, like, evas!!")
pst1 = Post.create(user_id: 1, title: "Post 2", content: "Post 2 content")
pst1 = Post.create(user_id: 2, title: "Post 3", content: "Post 3 content")
pst1 = Post.create(user_id: 1, title: "Post 4", content: "Post 4 content")

a1 = Ambassador.create(name: "Filipo", location: "Sydney", bio: "blah")
a2 = Ambassador.create(name: "Cassandra", location: "Perth", bio: "blah blah")
a3 = Ambassador.create(name: "Georgia", location: "Cairns", bio: "blah blah blah")
a4 = Ambassador.create(name: "Myrtle", location: "Newcastle", bio: "blah blah blah blah")
a5 = Ambassador.create(name: "Sebastian", location: "Darwin", bio: "blah blah blah blah blah blah")


