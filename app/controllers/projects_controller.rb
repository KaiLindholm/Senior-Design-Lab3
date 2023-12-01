class ProjectsController < ApplicationController
    def index 
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id]) 
        @comments = Comment.where(page: @project.name)
        if @project.name == "IoT Temperature System"
            @projectHightlights = [
                "We were tasked with creating a system that would monitor the temperature of a room and send an alert if the temperature was too high or too low.",
                "We used an ESP32-WROOM-32D microcontroller to host an async web server that allowed for the system to post temperature data and receive commands. 
                 The temperature data was stored in an InfluxDB, the user preferences were stored in a MySQL database, and the commands were sent to the server via custom REST calls.",
                "The client-side application was written with a Node.js backend and the temperature data was visualized using a Graphana module running on the same network as the docker containers.",
            ]
            @images = [
                "lab1/lab1-dashboard.png",
                "lab1/lab1-diagram.png"
            ]
        elsif @project.name == "RF Transmitter"
            @projectHightlights = [
                "For this lab we were tasked with creating a RF receiver that would use filter detection to detect a predetermined frequency signal from a remote control.",
                "Our filtering had to be precise enough to detect the signal and ignore any ambient noise. (i.e. fluorescent overhead lighting, lamps, etc.)",
                "If the signal was blocked, the system would trigger an interrupt on the ESP-32 microcontroller and send a text message to the users phone via the Twilio API."
                        ]
            @images = [
                "lab2/lab2-final.png",
                "lab2/lab2-schematic.png"
            ]
        elsif @project.name == "Team Portfolio"
            @projectHightlights = [
                "For the final lab of the semester we were tasked with creating a portfolio to showcase the projects we had worked on throughout the semester.",
                "We decided to develop using the Ruby on Rails framework and deploy the portfolio using Heroku.",
                "A few of the features we implemented were user authentication, and async commenting."
            ]
            @images = []
        elsif @project.name == "Capstone Project"
            @projectHightlights = [
                "For our capstone project we took some intiative and decided to self-sponsor an image processing project that recieves images from the GOES satellite and processes them to aid in grassroots weather forecasting.",
                "This is a project that is currently being worked on and will be completed by the end of the year.",
                "This page will be updated with more information as the project progresses."
            ]
            @images = []
        end
    end

end
