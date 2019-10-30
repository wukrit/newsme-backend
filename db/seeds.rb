# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
