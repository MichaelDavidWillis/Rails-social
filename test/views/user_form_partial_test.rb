class UserFormPartialTest < ActionView::TestCase
  def setup
    @user = User.new
    render "users/form"
  end

  test "renders the first name input" do
    assert_select "input" do
      assert_select "[name=?]", "user[first_name]" do
        assert_select "[type=?]", "text"
        assert_select "[class=?]", "form-control"
      end
    end
  end

  test "renders the second name input" do
    assert_select "input" do
      assert_select "[name=?]", "user[second_name]" do
        assert_select "[type=?]", "text"
        assert_select "[class=?]", "form-control"
      end
    end
  end

  test "renders the email input" do
    assert_select "input" do
      assert_select "[name=?]", "user[email]" do
        assert_select "[type=?]", "text"
        assert_select "[class=?]", "form-control"
      end
    end
  end

  test "renders the image file upload" do
    assert_select "input" do
      assert_select "[name=?]", "user[image]" do
        assert_select "[type=?]", "file"
        assert_select "[class=?]", "form-control"
      end
    end
  end

  test "renders a submit button" do
    assert_select "input" do
      assert_select "[name=?]", "commit" do
        assert_select "[type=?]", "submit"
        assert_select "[value=?]", "Create User"
      end
    end
  end

  test "renders the full form" do
    assert_select "form label", 4
    assert_select "form input", 5 do
      assert_select "[name=?]", "user[first_name]"
      assert_select "[name=?]", "user[second_name]"
      assert_select "[name=?]", "user[email]"
      assert_select "[name=?]", "user[email]"
      assert_select "[name=?]", "user[image]"
      assert_select "[name=?]", "commit"
    end
  end
end
