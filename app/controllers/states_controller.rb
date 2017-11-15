class StatesController < ApplicationController
  before_action :set_state, only: [:show, :update, :destroy]

  def index
    @states = State.all
  end

  def show
  end

  def create
    @state = State.new(state_params)
    if @state.save
      render :show, status: :created, location: @state 
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  def update
    if @state.update(state_params)
      render :show, status: :ok, location: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @state.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name)
    end
end
