user1_value = {
  username: "amj",
  email: "amjacobowitz@gmail.com",
  password_hash: "1234",
  first_name: "aaron",
  last_name: "j"
}

user2_value = {
  username: "mer",
  email: "mer0522@gmail.com",
  password_hash: "5678",
  first_name: "marisa",
  last_name: "ramon"
}

user3_value = {
  username: "nicoto",
  email: "faintsoundofwater@gmail.com",
  password_hash: "91011",
  first_name: "nicholas",
  last_name: "toulouse"
}

user1 = User.create(user1_value)
user2 = User.create(user2_value)
user3 = User.create(user3_value)

tweet1_value = {
  content: "this is aaron",
  user_id: 1
}

tweet2_value = {
  content: "this is marissa",
  user_id: 2
}

tweet3_value = {
  content: "this is nicholas",
  user_id: 3
}

user1.tweets.create(tweet1_value)
user2.tweets.create(tweet2_value)
user3.tweets.create(tweet3_value)

user3.minions << user2
user3.minions << user1
user1.minions << user3

user2.leaders << user1
user2.leaders << user3
