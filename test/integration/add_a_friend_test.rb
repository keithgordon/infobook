# require 'test_helper'

# class AddAFriendTest < ActionDispatch::IntegrationTest
#   def sign_in_as(user, password)
#     post login_path, user: { email: user.email, password: password }
#   end

#   test "that adding a friend works" do
#      sign_in_as users(:michael), "testing"

#      get "/user_friendships/new?friend_id=#{users(:bill).profile_name}"
#      assert_response :success
#    end
# end
