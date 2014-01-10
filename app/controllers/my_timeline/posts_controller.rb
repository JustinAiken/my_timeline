module MyTimeline
  class PostsController < MyTimeline::ApplicationController

    def new
      @event = Event.new
      @post  = Post.new(event: @event)
    end

    def create
      @post  = Post.new(rails4? ? post_params : params[:post])

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

  private

    if rails4?
      define_method :post_params do
        params.required(:post).permit :happened_on, :full_text, event_attributes: [:description, :public]
      end
    end
  end
end
