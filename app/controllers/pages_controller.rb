class PagesController < ApplicationController
    def index
    end 

    def kai
        @comments = Comment.where(page: "kai")
    end

    def james
        @comments = Comment.where(page: "james")
    end

    def joe
        @comments = Comment.where(page: "joe")
    end

    def gustav 
        @comments = Comment.where(page: "gustav")
    end

    # before_action :ensure_signed_in!
    def signup_success

    end

end
