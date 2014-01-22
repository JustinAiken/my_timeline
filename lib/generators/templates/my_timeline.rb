MyTimeline.setup do |config|
  # The User class to use... Default is "User".
  # Set to nil to not use per-user timelines,
  # or put a constant in a string to use that class
  config.user_class = 'User'

  # By default, looks for the user by id, but if you want to use a name or a slug,
  # set it here.  I.E., config.user_slug = :nick_name would result in User.find_by_nick_name
  #config.user_slug = :id

  # How to render the events - in a :table, or in a :list
  # config.render_method = :table

  # What classes to style the table with
  # config.table_class = "table table-striped"

  # How to format the time of the event; default looks like "3:33 pm - "
  # config.time_formatter = %-l:%M %P - "
end
