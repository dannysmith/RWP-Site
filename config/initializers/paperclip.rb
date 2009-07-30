# config/initializers/paperclip.rb
# Added by hand to fix imagemagick problem.

# initializer solution for paperclip + passenger combo
# Paperclip::Attachment#post_process => "/tmp/stream.3916.0 is not recognized by the 'identify' 
# command" error.
if RAILS_ENV == "development"
  Paperclip.options[:image_magick_path] = "/opt/local/bin"
end