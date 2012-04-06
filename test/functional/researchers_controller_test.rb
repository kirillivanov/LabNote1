require 'test_helper'

class ResearchersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Researcher.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Researcher.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Researcher.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to researcher_url(assigns(:researcher))
  end

  def test_edit
    get :edit, :id => Researcher.first
    assert_template 'edit'
  end

  def test_update_invalid
    Researcher.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Researcher.first
    assert_template 'edit'
  end

  def test_update_valid
    Researcher.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Researcher.first
    assert_redirected_to researcher_url(assigns(:researcher))
  end

  def test_destroy
    researcher = Researcher.first
    delete :destroy, :id => researcher
    assert_redirected_to researchers_url
    assert !Researcher.exists?(researcher.id)
  end
end
