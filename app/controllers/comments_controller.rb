class CommentsController < ApplicationController
    before_action :ensure_signed_in!, only: [:create, :destroy]
    before_action :ensure_correct_user!, only: [:destroy]

    def show 
        @comments = Comment.find(params[:id])
    end 

    def create
        respond_to do |format|
            @comment = current_user.comments.create(comment_params)
            puts "Comment: #{@comment.content} #{@comment.id}}"
            if not @comment.save
                format.html { redirect_to :back, notice: 'Comment was not saved successfully.' }
                format.js { render 'create_err.js.erb' }
            else
                format.html { redirect_to :back, notice: 'Comment was successfully created.' }
                format.js 
            end
        end
     end

    def destroy 
        puts "DESTROY: Comment id: #{params[:id]}"

        respond_to do |format|
            @comment = Comment.find(params[:id])
            if @comment.destroy
                format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
                format.js 
            else
                format.html { redirect_to :back, notice: 'Comment was not destroyed successfully.' }
                format.js { render 'destroy_err.js.erb' }
            end
        end
    end

    private 
    def comment_params
        puts "Comment params: #{params}"
        params.require(:comment).permit(:content, :page)
    end

    def ensure_signed_in!
        unless current_user
            respond_to do |format| 
                @error = "Please log in."
                format.html { redirect_to new_session_path, error: @error }
                format.js { render 'signin_error.js.erb' }
            end
        end
    end

    def ensure_correct_user!
        @comment = Comment.find(params[:id])
        if not current_user == @comment.user
            respond_to do |format|
                @error = "This is not your comment"
                format.html { redirect_to :back, error: @error }
                format.js { render 'signin_error.js.erb' }
            end
        end
    end
end
