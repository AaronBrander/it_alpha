namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_boards
    join_boards
    make_ideas
  end
end

def make_users
  admin = User.create!(first_name:            "Aaron",
                       last_name:             "Brander",
                       email:                 "aaron@utmsoft.com",
                       password:              "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.first_name
    last_name = Faker::Name.last_name 
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(first_name:     name,
                 last_name: last_name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_boards
  users = User.all(limit: 6)
  5.times do
    users.each do |user| 
      begin
        domain = Faker::Internet.domain_word 
        user.boards.create!(subdomain: domain,
                      name: domain,
                      description: Faker::Lorem.sentence(5),
                      keywords: "Keyword 1, keyword 2",
                      company_name: Faker::Company.name,
                      address_1: Faker::Address.street_address,
                      address_2: Faker::Address.secondary_address,
                      region: Faker::Address.state_abbr,
                      postal_code: Faker::Address.zip_code,
                      country: "US",
                      phone_number: Faker::PhoneNumber.phone_number,
                      contact_email: Faker::Internet.email,
                      is_private: false) 
      rescue
        #just continue making them. Likely the subdomain was not unique
      end
    end
  end

  def join_boards
    users = User.all(limit: 6)
    myList = Board.ids
    users.each do |user|
     myList = myList.shuffle
      (0..5).each do |i|
        board = Board.find(myList[i])
        user.join!(board)
      end
    end
  end

  def make_ideas
    users = User.all(limit: 6)
    boards = Board.all(limit: 6)
    
    users.each do |user| 
      boards.each do |board|

        begin
          board.ideas.create!(name: Faker::Lorem.sentence(1),
                        description: Faker::Lorem.sentence(5),
                        user: user) 
        rescue
          #just continue making them. Likely the subdomain was not unique
        end
      end
    end
    
  end
end