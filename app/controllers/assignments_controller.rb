class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end
  
  def new
  end
  
  def create 
  end
  
end
