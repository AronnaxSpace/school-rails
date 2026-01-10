module ApplicationHelper
  def pluralize(count, singular, few, many)
    case count % 100
    when 11..14
      "#{count} #{many}"
    else
      case count % 10
      when 1
        "#{count} #{singular}"
      when 2..4
        "#{count} #{few}"
      else
        "#{count} #{many}"
      end
    end
  end
end
