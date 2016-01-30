class TodosController < ApplicationController
	 before_action :set_todo, only: [:show, :edit, :update, :destroy]
	def index
     @todos = Todo.all
    end
  def new
    @todo = Todo.new
  end
  def show
  end
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
       
      else
        format.html { render :new }
        
      end
    end
  end
  def todo_params
      params.require(:todo).permit(:name, :list)
    end
     def set_todo
      @todo = Todo.find(params[:id])
    end
     
end