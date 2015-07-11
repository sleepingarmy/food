module BasketsHelper
    # Returns a dynamic path based on the provided parameters
  def sti_basket_path(type = "basket", basket = nil, action = nil)
    send "#{format_sti(action, type, basket)}_path", basket
  end

  def format_sti(action, type, basket)
    action || basket ? 
    "#{format_action(action)}#{type.underscore}" : 
    "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
