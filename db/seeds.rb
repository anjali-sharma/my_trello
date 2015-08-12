User.create(name: "Example User",
	email: "example@railstutorial.org",
	password: "foobar",
	password_confirmation: "foobar",
	admin: true,
	activated: true,
	activated_at: Time.zone.now)

99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create(name: name, 
		email: email,
		password: password,
		password_confirmation: password,
		activated: true,
		activated_at: Time.zone.now)
end

users = User.order(:created_at).take(10)
10.times do |n|
	title = "Board-#{n}"
	users.each { |user| user.boards.create!(title: title) }
end

user = User.find_by(email: "example@railstutorial.org");
10.times do |n|
	title = "List-#{n}"
	user.boards.each { |board| board.lists.create!(title: title) }
end

