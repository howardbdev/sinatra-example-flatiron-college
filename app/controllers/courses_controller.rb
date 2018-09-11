class CoursesController < ApplicationController

  #Index view
  get '/courses' do
    authorize_user
    # do I need any kind of protections/validations here?
    @courses = Course.all
    erb :'courses/index'
  end

  # get the form to create a new course:
  get '/courses/new' do
    authorize_user
    # declare a new ruby instance variable that holds an instantiated, unsaved, empty course
    @course = Course.new
    # render the form
    erb :'/courses/new'
  end


  # create the course and commit to database
  post '/courses' do
    if !params[:name].empty? && !params[:description].empty? && logged_in?
      # now, I want to build my new course
        # @course = Course.create(params) # build a new course object AND attempt to save to DB
      # @course = Course.new(params) # instantiates a new course object without saving to DB

      # build a new course object associated with the current instructor
      # that's logged in
      # @course.instructor_id = current_user.id

      # combining line 15 and 19, we can do this:
      course = current_user.courses.build(params)

      # try to save the new course to the database
      if course.valid?
        course.save
        # if it saves, redirect to that course's show page with success message
        flash[:message] = "Course successfully created!"
        redirect "/courses/#{course.id}"
      else
        # otherwise, go back to the new course form (instructor show page)
        # with an error message
        flash[:message] = "Error creating course"
        redirect "/instructors/#{current_user.id}"
      end
    else
      flash[:message] = "Error creating course"
      redirect "/instructors/#{current_user.id}" if logged_in?
      redirect "/"
    end
  end

  get '/courses/:id' do
    @course = Course.find_by(id: params[:id])
    # REFACTOR suggestion - move select to a class method
    @students = Student.all.select {|s| !@course.students.include?(s)}
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

  # DELETE a course
  delete '/courses/:id' do
    # what has to happen within this action?
    # 1. find the course by its id
    @course = Course.find_by(id: params[:id])
    # before we do anything with this course, make sure the current user owns  it
    if current_user.id == @course.instructor_id && @course.destroy
      # 2. delete it
      flash[:message] = "#{@course.name} successfully deleted."
    else
      flash[:message] = "You don't have the authority to delete #{@course.name}."
    end
    # 3. go back to the instructor show page??
    redirect "/instructors/#{current_user.id}"
  end


end
