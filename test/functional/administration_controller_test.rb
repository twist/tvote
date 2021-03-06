require 'test_helper'
require 'authlogic/test_case'

class AdministrationControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  #
  def setup
    activate_authlogic
    user_login
  end

  def test_index_no_admin
    
    get :index
    assert_response :redirect
    assert_redirected_to topics_path


  end
  def test_index
    admin_login()
    
    get :index
    users = User.all
    users.each do |u|
      assert_match(u.email, @response.body)
    end

    users.first.encrypt_email_and_save
    get :index
    users = User.all
    users.each do |u|
      if(u.email =~ /@/)
        assert_match(u.email, @response.body)
      else
        assert_no_match(/#{u.email}/, @response.body)
      end
    end

    topic = Topic.all.first;
    pp topic
    assert_match(topic.body, @response.body);
    assert_match(topic.votecount, @response.body);


  end

  def test_encryption
    admin_login()
    get :index
    users = User.all
    users.each do |u|
      assert_match(u.email, @response.body)
    end

    get :encrypt
    assert_response :redirect

    get :index
    users = User.all
    users.each do |u|
        assert_no_match(/#{u.email}/, @response.body)
    end


  end


end
