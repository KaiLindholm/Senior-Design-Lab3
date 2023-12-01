# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
User.destroy_all

Project.create(name: 'IoT Temperature System', repo: 'https://github.com/KaiLindholm/Senior-Design-Lab01', description: 'A system that monitors the temperature of a room and sends the data to a web server.')
Project.create(name: 'RF Transmitter', repo: '', description: 'An RF transmitter to determine if the area between it and the receiver are being blocked')
Project.create(name: 'Team Portfolio', repo: 'https://github.com/KaiLindholm/Senior-Design-Lab3', description: 'A portfolio for the team to show off their work')
Project.create(name: 'Capstone Project', repo: '', description: 'A satellite receiver that can be used to receive weather data from the GOES satellite')

User.create(name: 'ECE4880', email: 'ECE4880@default.com', password: '2023FallLab3!', password_confirmation: '2023FallLab3!')
