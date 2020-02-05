class TodosController < ApplicationController
  def new
    @todo=Todo.new
  end

  def create
    @todo = Todo.new(todo_params) #strong parameters
    if @todo.save #try and save
      flash[:notice] = "Todo was created sucesfully!"
      redirect_to todo_path(@todo) #works on save
    else
      render 'new'
    end
  end

  def show
    @todo=Todo.find(params[:id])
  end

  private
def todo_params
  params.require(:todo).permit(:name, :description)
end

end
