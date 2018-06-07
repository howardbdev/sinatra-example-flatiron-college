class InstructorsController < ApplicationController

  get '/instructors/:id' do
    # what do I want to do?
    # 1. find the instructor, and save it to a instance variable
    @instructor = Instructor.find_by(id: params[:id])
    erb :"instructors/show"
  end

end
