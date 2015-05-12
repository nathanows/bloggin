# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post1 = Post.create(
          title: 'Test Post',
          body: %Q{### This is a markdown test post
          
          This is my very first post using markdown!
            
          How do you like it?},
          author: 'Nathan',
          status: 'published',
          tag_list: 'Computers, Engineering, Ruby, Rails'
        )

post2 = Post.create(
          title: 'Another Test Post',
          body: %Q{### This is another markdown test post
          
          It has a [link](http://www.google.com)},
          author: 'Not Nathan',
          status: 'draft',
          tag_list: 'Computers, Engineering'
        )

post3 = Post.create(
          title: 'And Another Test Post',
          body: 'This is even more sample body text... I know you like it.',
          author: 'Nathan',
          status: 'draft',
          tag_list: 'Ruby, Rails'
        )

post4 = Post.create(
          title: 'Final Test Post',
          body: 'This is the last sample body text',
          author: 'Someone',
          status: 'published',
          tag_list: 'Computers, Rails'
        )

post1.comments << Comment.create(body: "This is a comment", author: "Some Guy")
post1.comments << Comment.create(body: "This is another comment", author: "Some Girl")
post1.comments << Comment.create(body: "heh", author: "Troll")

post2.comments << Comment.create(body: "This is a comment", author: "Some Guy")
post2.comments << Comment.create(body: "This is another comment", author: "Some Girl")
post2.comments << Comment.create(body: "heh", author: "Troll")

post3.comments << Comment.create(body: "This is a comment", author: "Some Guy")
post3.comments << Comment.create(body: "This is another comment", author: "Some Girl")
post3.comments << Comment.create(body: "heh", author: "Troll")
