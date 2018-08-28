class InstructorsController < ApplicationController


  get '/instructors/new' do
    # create a new instructors
    # render (erb) that instructor's show page
    erb :'instructors/new'
  end

  get '/instructors/:id' do
    # what do I want to do?
    # 1. find the instructor, and save it to a instance variable
    @instructor = Instructor.find_by(id: params[:id])
    if @instructor && logged_in?
      erb :"instructors/show"
    else
      redirect "/"
    end
  end


end
