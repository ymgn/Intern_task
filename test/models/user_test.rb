require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "ユーザー1",email: "uer@example.com", introduction: "自己紹介です", password: "123456")
  end
  
  test "should de vaild" do
    assert @user.valid?
  end

  test "name should de present" do
    @user.name= "  "
    assert_not @user.valid?
  end

  test "email should de present" do
    @user.email= "  "
    assert_not @user.valid?
  end

  test "password should de present" do
    @user.password= "  "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should de unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

 test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should de present (nonblank)" do
    @user.password = @user.password_confirmation = " " *6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" *5
    assert_not @user.valid?
  end
end
