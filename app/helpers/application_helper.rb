# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def project_repo(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def flash_message(type, message)
    content_tag :p, message, class: "flash #{type}"
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    end
  end
end
