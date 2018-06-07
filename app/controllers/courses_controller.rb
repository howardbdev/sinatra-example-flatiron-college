class CoursesController < ApplicationController
  get '/courses/:id' do
    @course = Course.find_by(id: params[:id])
    erb :'/courses/show'
  end

  # what is this route's job
  get '/courses/:id/edit' do
    # I don't want to load this form if the current user
    # doesn't own this course
    @course = Course.find_by(id: params[:id])

    if current_user.id == @course.instructor_id
      erb :'/courses/edit'
    else
      redirect '/courses'
    end
  end

  patch '/courses/:id' do
    @course = Course.find_by(id: params[:id])
    redirect '/courses' if current_user.id != @course.instructor_id

    if @course.update(name: params[:name], description: params[:description])
      # display success message
      redirect "/courses/#{@course.id}"
    else
      # display error message
      erb :'/courses/edit'
    end

  end
end
