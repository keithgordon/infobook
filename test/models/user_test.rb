require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:user_friendships)
  should have_many(:friends)

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
    user = users(:michael)
    user.profile_name = "My Profile With Spaces"

    assert  !user.save
    assert  !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

    test " a user can have a correctly formated profile name" do
      user = users(:michael)

      assert user.valid?
    end

    test "that no error is raised when error is raised" do
    assert_nothing_raised do
      users(:bill).friends
    end
  end

    test "that creating friendships on a user works" do
      users(:bill).friends << users(:michael)
      users(:bill).friends.reload
      assert users(:bill).friends.include?(users(:michael))
   end

 end

