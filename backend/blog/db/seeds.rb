# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(
  email: "gaige@gmail.com",
  handle: "gaigedespain",
  password: "abcdefg!",
  first_name: "Gaige",
  last_name: "Despain"
)

event = Event.create(
  start_date: Time.new(2022, 1, 1),
  end_date: nil,
  name: "Recording Jonny Seegmiller",
  description: "Started the recording process for Jonny's upcoming album",
  user_id: user.id
)

chapter = Chapter.create(
  name: "New studio in the orem house",
  description: "Moved into a new house in orem, and began setting up a new studio",
  expires_at: Time.now + 30.days,
  sealed: false,
  event_id: event.id
)

post1 = Post.create(
  title: "Setting up the new studio",
  body: "<h1>Got the guitar mounts hung up on the wall.</h1><p> The studio looks much better</p>",
  emotion: "positive",
  chapter_id: chapter.id
)

post2 = Post.create(
  title: "Didn't get much done today",
  body: "<h1>Overall, not much was accomplished today</h1><p>We spent a lot of time recording but didn't end up keeping anything</p>",
  emotion: "negative",
  chapter_id: chapter.id
)
