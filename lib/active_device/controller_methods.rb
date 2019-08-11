module ActiveDevice::ControllerMethods

  include ActiveDevice::Helper

  def self.included(base)
    base.before_action :set_mobile_format
    base.helper_method :is_mobile_device?, :is_mobile_browser?, :is_desktop_browser?, :is_bot?
    base.helper_method :is_mobile_view?
    base.helper_method :is_device?, :is_handset?, :is_brand?, :is_model?, :is_os?, :is_engine?, :is_browser?
  end

  # Determines the request format based on whether the device is mobile or if
  # the user has opted to use either the 'Standard' view or 'Mobile' view.

  def set_mobile_format
    if is_mobile_device?
      request.format = session[:mobile_view] == false ? :html : :mobile
      session[:mobile_view] = true if session[:mobile_view].nil?
    end
  end

  # Returns either true or false depending on whether or not the format of the
  # request is either :mobile or not.

  def is_mobile_view?
    request.format.to_sym == :mobile
  end

  # Returns either true or false depending on whether or not the user agent of
  # the device making the request is matched to a device in our regex.

  def is_mobile_device?
    ActiveDevice::Handset.is_mobile? request.user_agent
  end

  # Returns either true or false depending on whether or not the user agent of
  # the device making the request is matched to a device in our regex.

  def is_mobile_browser?
    ActiveDevice::Handset.is_mobile? request.user_agent
  end

  # Returns either true or false depending on whether or not the user agent of
  # the device making the request is matched to a device in our regex.

  def is_desktop_browser?
    !ActiveDevice::Handset.is_mobile? request.user_agent
  end

  # Returns either true or false depending on whether or not the user agent of
  # the device making the request is matched to a bot in our regex.

  def is_bot?
    ActiveDevice::Bot.is_bot? request.user_agent
  end

  # Can check for a specific type
  # e.g., is_device?('iphone') or is_device?('mobileexplorer')

  def is_device? type
    request.user_agent.to_s.downcase.include?(type.to_s.downcase)
  end

  # Can check for a specific type
  # e.g., is_handset?('iphone') or is_handset?('mobileexplorer')

  def is_handset? type
    ActiveDevice::Handset.is_handset? request.user_agent, type
  end

  # Can check for a specific brand
  # e.g., is_brand?('Nokia') or is_brand?('HTC')

  def is_brand? brand
    ActiveDevice::Handset.is_brand? request.user_agent, brand
  end

  # Can check for a specific Mobile Model
  # e.g., is_model?('NokiaE72') or is_model?('Nokia6630')

  def is_model? model
    ActiveDevice::Handset.is_model? request.user_agent, model
  end

  # Can check for a specific OS
  # e.g., is_os?('SymbianOS') or is_os?('Linux')

  def is_os? os
    ActiveDevice::Os.is_os? request.user_agent, os
  end

  # Can check for a specific Engine
  # e.g., is_engine?('Webkit') or is_engine?('Chrome')

  def is_engine? engine
    ActiveDevice::Engine.is_engine? request.user_agent, engine
  end

  # Can check for a specific user agent
  # e.g., is_browser?('Firefox') or is_browser?('Chrome')

  def is_browser? browser
    ActiveDevice::Browser.is_browser? request.user_agent, browser
  end

end
