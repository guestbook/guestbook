::SecureHeaders::Configuration.configure do |config|
  config.x_frame_options        = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection       = {:value => 1, :mode => 'block'}
  config.csp = {
    :enforce    => true,
    :style_src  => "* inline",
    :script_src => "self",
  }

  if Rails.env == "production"
    config.hsts = {:max_age => 20.years.to_i, :include_subdomains => true}
    config.csp[:default_src] = "https:"
  else
    config.hsts = false
    config.csp[:default_src] = "*"
  end
end
