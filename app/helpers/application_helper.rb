module ApplicationHelper

  def message_time(date)
    if date > 1.day.ago
      text = "#{distance_of_time_in_words(Time.zone.now, date)} ago".gsub("about ", "")
    elsif date > 1.year.ago
      text = date.strftime("%d %B")
    else
      text = date.strftime("%d %B %Y")
    end
    text
  end

end
