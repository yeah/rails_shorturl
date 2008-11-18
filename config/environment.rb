RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_rails_shorturl_session',
    :secret      => '6e6aa53f0aada3649caa84b51cd605f24ee184046d171c2d6d0a92419fedcbbc577351df289e76c1a9b2d4bb469f7fa7bd18f942e281233055978d90068f8ac6'
  }
end
