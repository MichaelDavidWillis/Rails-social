class PostFormPartialTest < ActionView::TestCase
  def setup
    @user = users(:one)
    render "posts/form"
  end

  test "renders a status select button" do
    assert_select "select" do
      assert_select "[name=?]", "post[status]"
      assert_select "[class=?]", "form-select"
      Visible::VALID_STATUSES.each do |status|
        assert_select "option", { value: status }
      end
      assert_select "option", { selected: "selected", value: "public" }
    end
  end

  test "renders a body for text" do
    assert_select "input" do
      assert_select "[name=?]", "post[body]" do
        assert_select "[type=?]", "text"
        assert_select "[class=?]", "form-control w-75"
      end
    end
  end

  test "renders a submit button" do
    assert_select "input" do
      assert_select "[name=?]", "commit" do
        # assert_select "[type=?]", "text" # fails as the item with the name commit does not contain a type of text
        assert_select "[type=?]", "submit"
        # assert_select "[value=?]", "text" # fails as the item with the name commit does not contain a value of text
        assert_select "[value=?]", "Post"
      end
    end
  end
end
