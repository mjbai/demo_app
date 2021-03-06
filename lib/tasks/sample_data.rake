namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first: "Example",
			 last: "User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
	  
    99.times do |n|
      first  = Faker::Name.name
      last = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(first: first,
		   last: last,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

