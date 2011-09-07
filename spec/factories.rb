require 'factory_girl'

Factory.define :user do |user|
  user.name "Joe Doe"
  user.email "user@gdx.org"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :admin do |admin|
  admin.name "Joe Doe"
  admin.email "admin@gdx.org"
  admin.password "foobar"
  admin.password_confirmation "foobar"
end


