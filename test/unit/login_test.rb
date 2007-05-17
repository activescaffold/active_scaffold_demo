require File.dirname(__FILE__) + '/../test_helper'

class LoginTest < Test::Unit::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :logins

  def test_should_create_login
    assert_difference Login, :count do
      login = create_login
      assert !login.new_record?, "#{login.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference Login, :count do
      u = create_login(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference Login, :count do
      u = create_login(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference Login, :count do
      u = create_login(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference Login, :count do
      u = create_login(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    logins(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal logins(:quentin), Login.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    logins(:quentin).update_attributes(:login => 'quentin2')
    assert_equal logins(:quentin), Login.authenticate('quentin2', 'test')
  end

  def test_should_authenticate_login
    assert_equal logins(:quentin), Login.authenticate('quentin', 'test')
  end

  def test_should_set_remember_token
    logins(:quentin).remember_me
    assert_not_nil logins(:quentin).remember_token
    assert_not_nil logins(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    logins(:quentin).remember_me
    assert_not_nil logins(:quentin).remember_token
    logins(:quentin).forget_me
    assert_nil logins(:quentin).remember_token
  end

  protected
    def create_login(options = {})
      Login.create({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
    end
end
