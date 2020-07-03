module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    end
  end

  def active_link? (*test_paths)
    test_paths.each do |test_path|
      return 'active' if request.path == test_path
    end
  end

  def status_message (room_price)
    if room_price.date_from.to_s <= Time.new.strftime("%Y-%m-%d").to_s && Time.new.strftime("%Y-%m-%d").to_s <= room_price.date_to.to_s
      "Current"
    elsif room_price.archived_at != nil
      "Archived"
    end
  end


end
