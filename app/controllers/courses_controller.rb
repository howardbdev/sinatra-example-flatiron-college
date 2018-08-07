class CoursesController < ApplicationController

  # get the form to create a new course:
  get '/courses/new' do
    # declare a new ruby instance variable that holds an instantiated, unsaved, empty course
    @course = Course.new
    # render the form
    erb :'/courses/new'
  end

  # create the course and commit to database
  post '/courses' do
    # now, I want to build my new course

    
  end

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
      flash[:message] = "Course successfully updated"
      redirect "/courses/#{@course.id}"
    else
      # what do I want to happen inside this block?
      # display error message
      # we can use @course.errors in the edit page to show what went wrong
      erb :'/courses/edit'
    end

  end


end
