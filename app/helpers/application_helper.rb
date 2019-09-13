module ApplicationHelper

  def current_year
    Date.today.year
  end

  def project_repo(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

end
