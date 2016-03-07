require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "no username twice" do
    user1 = User.new(username: "Admin", email: "admin@finance.cloud", password: "admin")
    assert user1.save, "Error : failing saving user1"
	
	user2 = User.new(username: "Admin", email: "admin@finance.cloud", password: "admin")
    assert !user2.save, "Error : success saving user2, which has same username as user1"
  end
  
  test "username too short" do
    user1 = User.new(username: "Ad", email: "admin@finance.cloud", password: "admin")
    assert !user1.save, "Error : sucess saving user1, username too short"
  end
  
  test "username too long" do
    user1 = User.new(username: "1234567890123456", email: "admin@finance.cloud", password: "admin")
    assert !user1.save, "Error : sucess saving user1, username too long"
  end
  
  test "invalid email" do
    user1 = User.new(username: "Admin2", email: "admin@finance.", password: "admin")
    assert !user1.save, "Error : sucess saving user1, invalid email"
  end
  
  test "invalid rank" do
    user1 = User.new(username: "Admin3", email: "admin@finance.cloud", password: "admin", rank: 1000)
    assert !user1.save, "Error : sucess saving user1, invalid rank"
  end
  
  test "too easy password" do
    user1 = User.new(username: "Admin4", email: "admin@finance.cloud", password: "1")
    assert !user1.save, "Error : sucess saving user1, password too easy"
  end
  
end
