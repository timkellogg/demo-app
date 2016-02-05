module ApplicationHelper
  
   # Converts true/false into yes/no
  def friendly_bool(bool)
    bool == true ? "Yes" : "No"
  end
  
end
