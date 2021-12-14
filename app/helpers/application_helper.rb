module ApplicationHelper
  def flash_type(type)
    (type == 'notice')? 'alert-success' : 'alert-warning'
  end
end
