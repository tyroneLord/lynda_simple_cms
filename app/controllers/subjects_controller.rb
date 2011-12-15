class SubjectsController < ApplicationController
  
 
  layout 'admin'
  
  before_filter :confirm_logged_in
  # def index
  #   list
  #   render('list')
  # end
  
  def index
    @subjects = Subject.order("subjects.position ASC")
  end

  
  def show
    #this is for READ part of CRUD
    @subject = Subject.find(params[:id])
  end
  
  def new
    # THIS THE CREATE PART OF CRUD
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end
  
  def create
    # THIS THE CREATE PART OF CRUD
    # were going to make a new object with the params sujbect params from form
    @subject = Subject.new(params[:subject])
    # this save the object
    if @subject.save
      #this is if statement for if the form saves
      flash[:notice] = "You have created a new object"
      redirect_to(subjects_path)
    else
      #if it doesnt go back to new action
      @subject_count = Subject.count + 1
      render('new')
    end
  end
  
  def edit
    # THIS THE UPDATE PART OF CRUD
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  
  def update
    # THIS THE UPDATE PART OF CRUD
    # were going find a object using the params
    @subject = Subject.find(params[:id])
    # this save the object
    if @subject.update_attributes(params[:subject])
      #this is if statement for if the form saves
      flash[:notice] = "You have updated a new object"
      redirect_to(subject_path, :id => @subject.id)
    else
      #if it doesnt go back to new action
      render('edit')
      @subject_count = Subject.count
    end
  end
  
  # def delete
  #     # THIS THE DESTROY PART OF CRUD
  #     @subject = Subject.find(params[:id])
  #   end
  
  def destroy
    # THIS THE DESTROY PART OF CRUD
    # flash[:notice] = "You have destoryed an object"
    # Subject.find(params[:id]).destroy
    # redirect_to(:action => 'list')
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to(subjects_path) }
      format.xml  
    end
  end
  

end
