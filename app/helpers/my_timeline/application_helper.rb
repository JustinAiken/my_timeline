module MyTimeline
  module ApplicationHelper
    def method_missing(meth, *args, &block)
      if meth.to_s =~ /_path$|_url$/
        if main_app.respond_to? meth
          main_app.send meth, *args
        else
          super
        end
      else
        super
      end
    end

    def respond_to?(meth)
      if meth.to_s =~ /_path$|_url$/
        if main_app.respond_to? meth
          true
        else
          super
        end
      else
        super
      end
    end
  end
end
