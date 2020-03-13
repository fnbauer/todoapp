class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]

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

  end

  def edit

  end
#edit submits to update
def update

  if @todo.update(todo_params) #try and update
    flash[:notice] = "Todo was updated sucesfully!"
    redirect_to todo_path(@todo) #works on save
  else
    render 'edit'
  end
end

def index
  @todos = Todo.all
end

def destroy
  @todo.destroy
  flash[:notice] = "Todo was deleted sucesfully"
  redirect_to todos_path
end


private
def set_todo
    @todo=Todo.find(params[:id]) #strong parameters
end


def todo_params #parameter validation
  params.require(:todo).permit(:name, :description)
end

end
