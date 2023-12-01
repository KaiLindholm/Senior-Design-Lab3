class PagesController < ApplicationController
    def index
        @comments = Comment.where(page: "team")
        @project1 = Project.find_by(name: "IoT Temperature System")
        @project2 = Project.find_by(name: "RF Transmitter")
        @project3 = Project.find_by(name: "Team Portfolio")
        @project4 = Project.find_by(name: "Capstone Project")
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
