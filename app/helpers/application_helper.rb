module ApplicationHelper


  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  # def bootstrap_class_for(name)
  #   if :success
  #     "alert-success"
  #   elsif :error
  #     "alert-error"
  #   else :notice
  #     "alert-info"
  #   end
  # end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end
end
