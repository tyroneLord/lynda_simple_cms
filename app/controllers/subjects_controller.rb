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
      flash[:notice] = "You have created a new object"
      redirect_to(:action => 'list')
    else
      #if it doesnt go back to new action
      render('new')
    end
  end
  
  def edit
    # THIS THE UPDATE PART OF CRUD
    @subject = Subject.find(params[:id])
  end
  
  def update
    # THIS THE UPDATE PART OF CRUD
    # were going find a object using the params
    @subject = Subject.find(params[:id])
    # this save the object
    if @subject.update_attributes(params[:subject])
      #this is if statement for if the form saves
      flash[:notice] = "You have updated a new object"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      #if it doesnt go back to new action
      render('edit')
    end
  end
  
  def delete
    # THIS THE DESTROY PART OF CRUD
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    # THIS THE DESTROY PART OF CRUD
    flash[:notice] = "You have destoryed an object"
    Subject.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end
  

end
