module UsersHelper
  def job_title_icon
    if @user.profile.job_title == "Developer"
      "<icon class='fa fa-code'>".html_safe
    elsif @user.profile.job_title == "Entrepreneur"
      "<icon class='fa fa-lightbulb-o'>".html_safe
    elsif @user.profile.job_title == "Investor"
      "<icon class='fa fa-dollar'>".html_safe
    end
  end
end
