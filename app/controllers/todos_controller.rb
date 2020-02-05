class TodosController < ApplicationController
  def new
    @todo=Todo.new
  end
#new submits to Create
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

  def edit
    @todo=Todo.find(params[:id]) #copied from show, since we need to find what we're editing first
  end
#edit submits to update
def update
  @todo = Todo.find(params[:id]) #strong parameters
  if @todo.update(todo_params) #try and update
    flash[:notice] = "Todo was updated sucesfully!"
    redirect_to todo_path(@todo) #works on save
  else
    render 'edit'
  end
end

private
def todo_params #parameter validation
  params.require(:todo).permit(:name, :description)
end

end
