class SubjectsController < ApplicationController
  
  def index
    list
    render('list')
  end
  
  def list
    #this is for READ part of CRUD
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
    #this is for READ part of CRUD
    @subject = Subject.find(params[:id])
  end
  
  def new
    # THIS THE CREATE PART OF CRUD
    @subject = Subject.new
  end
  
  def create
    # THIS THE CREATE PART OF CRUD
    # were going to make a new object with the params sujbect params from form
    @subject = Subject.new(params[:subject])
    # this save the object
    if @subject.save
      #this is if statement for if the form saves
      redirect_to(:action => 'list')
    else
      #if it doesnt go back to new action
      render('new')
    end
  end
  

end
