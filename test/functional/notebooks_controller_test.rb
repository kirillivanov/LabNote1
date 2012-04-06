require 'test_helper'

class NotebooksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Notebook.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Notebook.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Notebook.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to notebook_url(assigns(:notebook))
  end

  def test_edit
    get :edit, :id => Notebook.first
    assert_template 'edit'
  end

  def test_update_invalid
    Notebook.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Notebook.first
    assert_template 'edit'
  end

  def test_update_valid
    Notebook.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Notebook.first
    assert_redirected_to notebook_url(assigns(:notebook))
  end

  def test_destroy
    notebook = Notebook.first
    delete :destroy, :id => notebook
    assert_redirected_to notebooks_url
    assert !Notebook.exists?(notebook.id)
  end
end
