require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Lars"
    email "hi@hello.com"
    password "password"
    password_confirmation "password" 
  end

  factory :link do
    url "http://www.google.com"
    short_description "Google"
  end

  factory :vote do
    user
    link
  end
end