module ApplicationHelper

  # Use this helper function to display all the dates
  # 2015-2-29
  def formatted_date(date)
    date.strftime("%Y-%b-%d")
  end

  # 2015-2-29 12:30pm
  def formatted_date_time(date)
    date.strftime("%Y-%b-%d %I:%M%p")
  end

  # February 29, 2015
  def format_formal_date(date)
    date.strftime("%B %-d, %Y")
  end
end
