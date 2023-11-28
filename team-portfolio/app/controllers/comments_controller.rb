class CommentsController < ApplicationController
    berfore_action :ensure_signed_in!, only: [:create]
    def create
        @comment = current_user.comments.create(comment_params)
        redirect_to 'james'
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :page)
    end


end
