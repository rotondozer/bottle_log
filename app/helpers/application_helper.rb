module ApplicationHelper
  def month_options
    (0..11).map do |i|
      date = Date.current.beginning_of_month - i.months
      [date.strftime("%B %Y"), date.strftime("%Y-%m")]
    end
  end

  def current_month
    Date.current.strftime("%Y-%m")
  end
end
