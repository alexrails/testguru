module ApplicationHelper

  ALERT_TYPE = {
    notice: 'alert-info',
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning'
  }

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    content_tag(:a, 'project', href: "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def alert_style(type)
    ALERT_TYPE.fetch(type.to_sym, 'alert-info')
  end
end
