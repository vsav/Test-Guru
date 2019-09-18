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

end
