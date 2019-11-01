# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
