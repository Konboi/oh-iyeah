module BaseHelper
  def logged_in?
    controller.logged_in?
  end

  def current_user
    controller.current_user
  end
end
