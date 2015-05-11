# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post1 = Post.create(
          title: 'Test Post',
          body: 'This is some sample body text',
          author: 'Nathan',
          status: 'published'
        )

post2 = Post.create(
          title: 'Another Test Post',
          body: 'This is some more sample body text... like it?',
          author: 'Not Nathan',
          status: 'draft'
        )

post3 = Post.create(
          title: 'And Another Test Post',
          body: 'This is even more sample body text... I know you like it.',
          author: 'Nathan',
          status: 'draft'
        )

post4 = Post.create(
          title: 'Final Test Post',
          body: 'This is the last sample body text',
          author: 'Someone',
          status: 'published'
        )
