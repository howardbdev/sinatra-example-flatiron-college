class EnrollmentsController < ApplicationController
  post '/enrollments' do
    # get the information from the form and instantiate a new Enrollment
# HERE IS WHERE WE LEFT OFF!
# here is the params hash: {"course_id"=>"1", "student_id"=>"5"}
    # @enrollment = Enrollment.create(course_id: params[:course_id], student_id: params[:student_id])

    @enrollment = Enrollment.new(params)
    # try to save to the db

    if @enrollment.save
      # on success, let's go to the course show page, where we should see the
      # student we just added
      flash[:message] = "Student successfully enrolled in this course!"
    else
      # on failure, create a flash message and/or use AR errors to tell
      # the user that something went wrong
      flash[:message] = "Something went wrong: #{@enrollment.errors.full_messages.to_sentence}"
    end
    redirect "/courses/#{@enrollment.course_id}"
  end
end
