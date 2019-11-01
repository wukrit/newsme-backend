# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
Filter.destroy_all
Subscription.destroy_all
User.destroy_all
Topic.destroy_all
Source.destroy_all

jdoe = User.create(username: 'jdoe', name: 'John Doe', email: 'jdoe@email.com')
jdoe1 =
  User.create(username: 'jdoe1', name: 'John Doe', email: 'jdoe1@email.com')
jdoe2 =
  User.create(username: 'jdoe2', name: 'John Doe', email: 'jdoe2@email.com')

t1 = Topic.create(title: 'Topic 1')
t2 = Topic.create(title: 'Topic 2')
t3 = Topic.create(title: 'Topic 3')
t4 = Topic.create(title: 'Topic 4')
t5 = Topic.create(title: 'Topic 5')

s1 = Source.create(name: 'Source 1')
s2 = Source.create(name: 'Source 2')

Filter.create(user: jdoe, source: s1)

Subscription.create(user: jdoe, topic: t1)
Subscription.create(user: jdoe, topic: t2)
Subscription.create(user: jdoe, topic: t3)
=======
User.destroy_all
Article.destroy_all
Subscription.destroy_all
Filter.destroy_all
Topic.destroy_all
# Source.destroy_all

u1 = User.create(
    name: 'John Doe',
    email: 'jdoe@email.com',
    username: 'jdoe'
)

t1 = Topic.create(
    title: 'Test'
)

s1 = Source.create(
    name: 'Test Source',
    url: 'Test URL'
)

s2 = Source.create(
    name: 'Second Test Source',
    url: 'Second Test URL'
)

sub1 = Subscription.create(
    user: u1,
    topic: t1,
)

fil1 = Filter.create(
    user: u1,
    source: s2,
)
>>>>>>> 41855c2... Created relationships
