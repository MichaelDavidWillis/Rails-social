class PostFormPartialTest < ActionView::TestCase
  def setup
    @user = users(:one)
    render "posts/form"
  end
  test "renders a status select button" do
    assert_select "select", { type: "submit", name: "post[status]", class: "form-select" } do
      Visible::VALID_STATUSES.each do |status|
        assert_select "option", { value: status }
      end
      assert_select "option", { selected: "selected", value: "public" }
    end
  end
  test "renders a body for text" do
    assert_select "input", { type: "text", name: "post[body]", class: "form-control w-75" }
  end
  test "renders a submit button" do
    assert_select "input", { type: "submit", value: "Post", class: "btn btn-secondary" }
  end
end
