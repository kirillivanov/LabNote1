require 'test_helper'

class NotebookTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Notebook.new.valid?
  end
end
