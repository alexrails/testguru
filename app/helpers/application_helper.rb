module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    content_tag(:a, 'project', href: "https://github.com/#{author}/#{repo}", target: '_blank')
  end

end
