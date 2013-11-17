module MyTimeline
  class PostsController < MyTimeline::ApplicationController

    def new
      @event = Event.new
      @post  = Post.new(event: @event)
    end

    def create
      @post  = Post.new(params[:post])

      @post.event.happened_on = @post.happened_on
      @post.event.user_id     = @user.id
      @post.event.icon_name   = "notes.png"

      if @post.save
        @post.event.linkable = @post
        @post.event.save

        redirect_to root_path, notice: "Post saved."
      else
        render :new
      end
    end
  end
end
