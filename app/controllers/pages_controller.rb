class PagesController < InheritedResources::Base
  
  before_filter :confirm_logged_in
  before_filter :find_subject
  
  
  private
    def find_subject
      @subject = Subject.find_by_id(params[:subject_id])
    end
end


# class PagesController < ApplicationController
#   
#   before_filter :confirm_logged_in
#   before_filter :find_subject
#   
#   def index
#     @pages = Page.all.where(subject_id => @subject.id)
#   end
#   
#   def show
#   end
#   
#   def new
#   end
#   
#   def edit
#   end
#   
#   def create
#   end
#   
#   def update
#   end
#   
#   def destroy
#   end
#   
#   private
#     def find_subject
#       @subject = Subject.find_by_id(params[:subject_id])
#     end
# end
