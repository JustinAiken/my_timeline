module MyTimeline
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a MyTimeline initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "my_timeline.rb", "config/initializers/my_timeline.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
