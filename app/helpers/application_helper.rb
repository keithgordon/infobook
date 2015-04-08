module ApplicationHelper

  def flash_class(type)
    case type
    when :success
      "alert alert-success"
    when :alert
      "alert alert-danger"
    when :notice
      "alert alert-info"
    else
      ""
    end
  end
end
