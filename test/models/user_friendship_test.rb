require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an expection" do
    assert_nothing_raised do
      UserFriendship.create user: users(:john), friend: users(:bill)
    end
  end

  test "that creating a friendship bassed on user id and friend id works" do
    UserFriendship.create user_id: users(:john).id, friend_id: users(:bill).id
    assert users(:john).friends.include?(users(:bill))
  end
end
