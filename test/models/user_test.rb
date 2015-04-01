require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
    end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
    end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
    end

  test "a user should an unique profile name" do
    user = User.new
    user.profile_name = users(:michael).profile_name
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: "Michael",
                    last_name: "Gordon",
                    email:     "Michael@mail.com",
                    password: "password123",
                    password_confirmation: "password123")
    user.profile_name = "My Profile With Spaces"

    user.save
    puts user.errors.inspect
    # assert  !user.errors[:profile_name].empty?
    # assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
end