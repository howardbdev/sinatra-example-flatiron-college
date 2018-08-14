class EnrollmentsController < ApplicationController
  post '/enrollments' do
    binding.pry
    # get the information from the form and instantiate a new Enrollment
# HERE IS WHERE WE LEFT OFF!
    # try to save to the db

    # on success, let's go to the course show page, where we should see the
    # student we just added

    # on failure, create a flash message and/or use AR errors to tell
    # the user that something went wrong
  end
end
