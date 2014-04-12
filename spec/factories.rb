FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Person #{n}" }     
    sequence(:last_name) { |n| "Van #{n}"}
    sequence(:email) { |n| "person_#{n}@example.com" } 
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end

  factory :board do
    sequence(:subdomain) { |n| "subdomain#{n}" }
    sequence(:name) { |n| "Board #{n}" }
    description "This is the board description"
    keywords "Keyword 1, keyword 2"
    company_name "Test Company"
    address_1 "123 Test Street"
    address_2 "Suite 100"
    region "MI"
    postal_code "49418"
    country "US"
    phone_number "123-123-1234"
    contact_email "user@example.com"
    is_private false
    user

    factory :private do
        is_private true
    end

  end
end