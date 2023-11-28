class CommentsController < ApplicationController
    before_action :ensure_signed_in!, only: [:create]
    def create
        puts comment_params[:page]
        @comment = current_user.comments.create(comment_params)
        redirect_to root_path
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :page)
    end


end
