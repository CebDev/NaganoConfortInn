module ApplicationHelper

  def active_link? (test_path)
    'active' if request.path.include?test_path
  end

end
