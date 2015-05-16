module ApplicationHelper

  def bootstrap_class_for(name)
    if :success
      "alert-success"
    elsif :error
      "alert-error"
    elsif :notice
      "alert-info"
    end
  end
        

end
